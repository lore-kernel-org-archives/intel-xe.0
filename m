Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7613AEB64DC
	for <intel-xe@archiver.kernel.org>; Mon, 17 Jul 2023 13:24:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 441DB10E245;
	Mon, 17 Jul 2023 13:24:01 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF9CB10E245
 for <intel-xe@lists.freedesktop.org>; Mon, 17 Jul 2023 13:23:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689600239; x=1721136239;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=e4bzv6sDivYMXaYeCAvUW7m+eQb6Uj8CakS+CoXOpeU=;
 b=bzHI7XL1feVhxz22gvHDZ4kZBdzXx48lMjkuxvQPpOxPHciXjmnR5NLH
 X1fBXGqWdAaMXjTmdWiLq3cDtfs/5pdfrSJJtKMlFD+BBTUqmBOntg/fB
 OoZKdn4pO1AUJF7MvF/ToebmJfIcOmJIsvmLjHfkrhye09vspcgCRmZKQ
 XgJLg6c2n0ZFbxBgJInb8C/XYJHlbeBIlal3rIg6QltSu6HO39pKk5N8A
 Z7XrKOxuB7E3CtLJ/rLwNljcvfu2mhObQUQcqGm3x7q4yFv+aQnqmNwrd
 UAaIz2AAbntSmvqg3JGNRH87hRocLMyyogGd/sudirjUe17mwoY4dZoUW w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10774"; a="355865727"
X-IronPort-AV: E=Sophos;i="6.01,211,1684825200"; d="scan'208";a="355865727"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2023 06:23:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10774"; a="758409208"
X-IronPort-AV: E=Sophos;i="6.01,211,1684825200"; d="scan'208";a="758409208"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga001.jf.intel.com with ESMTP; 17 Jul 2023 06:23:37 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 17 Jul 2023 06:23:37 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Mon, 17 Jul 2023 06:23:37 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.174)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Mon, 17 Jul 2023 06:23:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KVp/3UpspE2ML5EgRPbStpVTuVRrAnBzlNPL+ql2BmtLQLkYhNS9IfNL43wjN+KeLQ2a5fYpI4nvxK+PvOzgTpICoPsceJup7ktXtiXoNtvAq4HA76ATuzlke+BiS1NZ4AG9WT0DKBPcEzQ7DpwqqerdWNDSkScmitauokv1t1S9GrCuAs9SkwqQmijYo9pJAExn+8XcOpvpeYRjWii4A8h/DF8AdRCzoxvzl/wZ9ZrGZbAANaJbFKlwr3xdVFw/PpyA9/ynAgL+FkartArmfSbVTsdH3VF9V2py8sL6vqCK1MGWnFX6VtfpZzcbOBBszohbuCG/A9cKA3BJSLDc2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2Ia2mUVW43EWinYmaxkxpIvdbICTJHuRuq1mL85YliA=;
 b=X2gESil1wHKtoa9GkmyBd/dFoESygDjW78lDzDHUQjnnSF3R5J54SGd4LIp6N/EbQfA0ftMhp7vZvxMI0spcV94hMQ8KlDlC1zl+izri9Op7mPVi3Pg3VeWJ5nwgL/rELThSSHKu4y+F2a6PfsJqUN0iUSY01XtM69PUUx9Stwf9JW4RF0OES8G9CEwlc0ZArsbtJp1aRSHZxqaZlbO2LMvFN8zs5+WHHxsXSt8gHeZ+0/wUCrb7qi7wzp51TzsVaVEvtYXfMowJI48fJvcilNfqvXI4fIqVZDoZDSpdFX4DEscsTJplVZfEoLDxuNmz+R2rXds5rfFvOvCBvCmyEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH7PR11MB7049.namprd11.prod.outlook.com (2603:10b6:510:20c::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.31; Mon, 17 Jul
 2023 13:23:35 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::3294:2cf2:e022:7164]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::3294:2cf2:e022:7164%7]) with mapi id 15.20.6588.031; Mon, 17 Jul 2023
 13:23:35 +0000
Date: Mon, 17 Jul 2023 10:23:30 -0300
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Message-ID: <mr6slrxoedm46acyb73yzx5yoyuhjbeuixh3albo5jofuuawma@uformzo3j2r5>
References: <20230712125640.1471850-1-ravi.kumar.vodapalli@intel.com>
 <ZK6+NZUQnfZCLQj0@DUT025-TGLU.fm.intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZK6+NZUQnfZCLQj0@DUT025-TGLU.fm.intel.com>
X-ClientProxiedBy: SJ0PR03CA0194.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef::19) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH7PR11MB7049:EE_
X-MS-Office365-Filtering-Correlation-Id: c5e17d6f-bf56-42bc-7b22-08db86c905b3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JuNZHEwiUgv5l6DQ3zCWxbI60Hy5vT2kqCV9jvXnCNBeq9Bt/PQbjIV3tPweCSNWbMPZ1IyU6iEEaik2ic4xZGmSdvDohaZ9gG7yni3E51D3CRNyCfrYiTSTgL4jFw/El9iig2490tpwvnLdyvZFZUwAY2nfNzIPqmeOfHahRlJCcOfQdWXalT/LKiagtwKWCUxmMMr57+m54ngH7B/5+F+nIpycdLjmRaJChPPZqT6q0kVunHsWU6amBSo0tcNNEOFWR4zCvFUazeGILz715vRjhQ7h+6a/rT9PbkCdkpOMzK1dSGM9i1GDirO8LxhHBHg0n8RkeOlvJ51OZq255h6lg7ESWbzhaYaHxrdx+Kv1v7anbknBTDcB68olCmZ3YzFIDqKIhD7Wu/chywHcjJJQDL18jWvk7Nw9A8NEI99wQdsbnaGGcnCJ5n1SfAJQYRMGPs0NkgOw/ccdz0iILZZc7Efoth/gzFiHeDGG4iPNVBOUGwzdE5QmCBN4TDfllavxytmqxwXdYYWQH+/rept0GeMDrLoQEcbEkFq2Fdfz9vY5Mzf/iVX8tx0Kz2b9
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(396003)(366004)(136003)(39850400004)(346002)(376002)(451199021)(478600001)(6666004)(6486002)(6506007)(186003)(26005)(6512007)(316002)(9686003)(2906002)(33716001)(41300700001)(6636002)(4326008)(66946007)(66476007)(5660300002)(6862004)(8936002)(8676002)(66556008)(38100700002)(82960400001)(86362001)(83380400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?upOz4e7QWjm1fZjx1RTViLblNpUzqMTqO6RjwMtjL5psR8VzE01P9niV9t?=
 =?iso-8859-1?Q?umoQ6h0xzajXbSad7zFMD686kjjx5ubrnoMUPZRwxgWcdny781MblDuzkK?=
 =?iso-8859-1?Q?DRBYGNrbuDrAHqBpObC4yuh5QEO0ouXc3oDIW9TSy3ooZ7v3etZn5XZ34U?=
 =?iso-8859-1?Q?rZslQ1pwUpUvz3ZNpckZY/K7Kg5hA1nSQvwtTRD9iRbNXva/wJ+MdrjkAv?=
 =?iso-8859-1?Q?lH+jDzTkVJjocYj7g4MrV0MfSYOD8DylyCEr9g89rqGvWy6nAncgET5hmp?=
 =?iso-8859-1?Q?+IqX2EeoYDV5awt367k+mSAFZOENol1Ak0Lo0TqggOWWvqX6U5/esPjxLh?=
 =?iso-8859-1?Q?R/MKNIwrAmc4eeQhaPBhry6c81XSuKv/TNRC9ANCox9y4SwOj0kmorr3ZE?=
 =?iso-8859-1?Q?kOV8k+M+BNHRjAS1beT5KFhe5obOf4aFDBYB2Kk35nTAYiGI3+grHRH532?=
 =?iso-8859-1?Q?EDDjYm75XzWCGbNsxdsnhxOSI/B7Hc/0aAtgL8pRPE4FVu1IoOuMfr0Pv6?=
 =?iso-8859-1?Q?RbpXwj4Y8SqNcHdkS9WfOlDAQhdtG5/rl903rV6LPH9aAPlTezkPC83YNl?=
 =?iso-8859-1?Q?s8I7TaUDNNGCWa97KuZ2HsmroadE3wIrk5FZM3HKuGkpvauipvxYalHHpr?=
 =?iso-8859-1?Q?+B4RfEMymDcx3z2CvpwREiXV0rDuyVywpWmIoYG8gGAETuDdXU4oyo8Yzu?=
 =?iso-8859-1?Q?RJi4pO8Pm1bUG7vQqwT4BFhUa3IbO6vl+hYnFd8NfShJEJ8qB6QmSOIxh0?=
 =?iso-8859-1?Q?SrUWGmytErAbfXIzdlq8vPoGt/bQklS2uHH0V7Iw5LZQfyqn2Ga6AMw4ui?=
 =?iso-8859-1?Q?Igzi8cLCiZ/5f+QanHF6oXM1MNEJ4COs6Wj377m1cW3SuqRANo+4zQf6Uf?=
 =?iso-8859-1?Q?Vh09rJWx1purzE82x7LBBE7BIK3rEPXOy1epAVhhkiyTHekAHVU6tKyG0B?=
 =?iso-8859-1?Q?HKcNP7tG15hrzWyFk1p19lhOJuQ9E2d1mBXWrsdc1LBUzNB0GXopRC1g1e?=
 =?iso-8859-1?Q?a1gDEbG8btJLg1nhQmTyw5Qii3YgFT2cdHiTx2Yl0jk6fY0V6nx9UPo1zg?=
 =?iso-8859-1?Q?1hwQPf5z5bHnxyKcaE4EqUVeeaNu/rAS1bdznv4Exmf7eoFx8cDGBcf3VK?=
 =?iso-8859-1?Q?7n4t7GmFHVdpu6oC08pzz0IXWWyvkUcL+GHMZAGsBG3GbRdfRaUdjQVMbz?=
 =?iso-8859-1?Q?1SjVeL8YR9S7yQJoGbbsZKV2xVl9aCZu7E8N6c9plZTfvPR97qCRizCrCt?=
 =?iso-8859-1?Q?ODBrZTlTJ8O28r6S9ELwzMcHFdfJt6g+vRdR36RYGhwKzJHZ6mDnySAtvS?=
 =?iso-8859-1?Q?ChLwELlebWMF1glvgpwYiVj7/nmQ073/csYOqixnyNDnFOHlgWpfmuvL3r?=
 =?iso-8859-1?Q?OLvry/jAUu14IHdJuEHy5IB0gzta4kwvDvNUTyq4dBBv3f390lDocS/wbv?=
 =?iso-8859-1?Q?jd7Y7K5ksgIuZUC6DyDb7G945g+KdrvRLwFiupbTl4tHB6vdyqkqZbeDO4?=
 =?iso-8859-1?Q?os3EnrepgQSGXpKF0WO2bGJSHpHsbUFd4cjxGtt0avUmlCnhEalb69wjIq?=
 =?iso-8859-1?Q?x50FnzacV73s1FMpNQX9Q2jSEevKnDxjHmeAMLZzBot9ffXK9cbaduDg2x?=
 =?iso-8859-1?Q?6DR5rKMQqAvINJbLBSCX0bRO0tnwScmXwwOvjMjInXIrh6EyZ0rIfqNA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c5e17d6f-bf56-42bc-7b22-08db86c905b3
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2023 13:23:35.0286 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qZWkMYXuMm4LhtO4kGbs7Wx35ZNaNkDIQ53rNMHD2+uQRhh2fYQMQe0sF4dciOY5tR8WrhTDsXIuEc2RnaLvG1gN9fKs61OkWSixUoCUuDs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7049
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe/ppgtt: Add support for correct PAT
 encoding in Page Table Entry (PTE) format
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Cc: Ravi Kumar Vodapalli <ravi.kumar.vodapalli@intel.com>,
 intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, Jul 12, 2023 at 02:52:37PM +0000, Matthew Brost wrote:
>On Wed, Jul 12, 2023 at 06:26:40PM +0530, Ravi Kumar Vodapalli wrote:
>> Different platforms has different PAT encoding in PTE format, add
>> correct PAT encoding for pre-Xe2 platforms (XELP, XEHPC, XELPG).
>>
>> Bspec: 45101, 71582
>> Signed-off-by: Ravi Kumar Vodapalli <ravi.kumar.vodapalli@intel.com>
>> ---
>>  drivers/gpu/drm/xe/xe_pt.c       | 110 +++++++++++++++++++++++++++----
>>  drivers/gpu/drm/xe/xe_pte.h      |  31 +++++++++
>>  drivers/gpu/drm/xe/xe_vm_types.h |   1 +
>>  3 files changed, 129 insertions(+), 13 deletions(-)
>>  create mode 100644 drivers/gpu/drm/xe/xe_pte.h
>>
>> diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
>> index 00855681c0d5..e7f8bd4dd518 100644
>> --- a/drivers/gpu/drm/xe/xe_pt.c
>> +++ b/drivers/gpu/drm/xe/xe_pt.c
>> @@ -16,6 +16,7 @@
>>  #include "xe_trace.h"
>>  #include "xe_ttm_stolen_mgr.h"
>>  #include "xe_vm.h"
>> +#include "xe_pte.h"
>>
>>  struct xe_pt_dir {
>>  	struct xe_pt pt;
>> @@ -111,19 +112,7 @@ static u64 __pte_encode(u64 pte, enum xe_cache_level cache,
>>  	if (unlikely(vma && xe_vma_is_null(vma)))
>>  		pte |= XE_PTE_NULL;
>>
>> -	/* FIXME: I don't think the PPAT handling is correct for MTL */
>> -
>> -	switch (cache) {
>> -	case XE_CACHE_NONE:
>> -		pte |= PPAT_UNCACHED;
>> -		break;
>> -	case XE_CACHE_WT:
>> -		pte |= PPAT_DISPLAY_ELLC;
>> -		break;
>> -	default:
>> -		pte |= PPAT_CACHED;
>> -		break;
>> -	}
>> +	pte = xe_vma_vm(vma)->pte_encode(pte, cache);
>>
>>  	if (pt_level == 1)
>>  		pte |= XE_PDE_PS_2M;
>> @@ -187,6 +176,94 @@ static u64 __xe_pt_empty_pte(struct xe_tile *tile, struct xe_vm *vm,
>>  	}
>>  }
>>
>> +static u64 xelp_pte_encode_pat(u8 pat_index)
>> +{
>> +	u64 pte_pat = 0;
>> +
>> +	if (pat_index & BIT(0))
>> +		pte_pat |= BIT(3);
>> +
>> +	if (pat_index & BIT(1))
>> +		pte_pat |= BIT(4);
>> +
>> +	if (pat_index & BIT(2))
>> +		pte_pat |= BIT(7);
>> +
>> +	return pte_pat;
>> +}
>> +
>> +static u64 __xelp_pte_encode(u64 pte, enum xe_cache_level cache)
>> +{
>> +	pte &= ~XELP_PAT_MASK;
>> +
>> +	switch (cache) {
>> +	case XE_CACHE_NONE:
>> +		pte |= xelp_pte_encode_pat(XELP_PAT_UNCACHE);
>> +		break;
>> +	case XE_CACHE_WT:
>> +		pte |= xelp_pte_encode_pat(XELP_PAT_WT_CACHE);
>> +		break;
>> +	case XE_CACHE_WB:
>> +		pte |= xelp_pte_encode_pat(XELP_PAT_WB_CACHE);
>> +		break;
>> +	default:
>> +		/* pte |= PPAT_CACHED; */
>> +		break;
>> +	}
>> +
>> +	return pte;
>> +}
>> +
>> +static u64 __xehpc_pte_encode(u64 pte, enum xe_cache_level cache)
>> +{
>> +	pte &= ~XELP_PAT_MASK;
>> +
>> +	/* Initially assumed as CLOS0.
>> +	 * To Do: CLOS1/CLOS2 has to be set depending on requirement
>> +	 */
>> +	switch (cache) {
>> +	case XE_CACHE_NONE:
>> +		pte |= xelp_pte_encode_pat(XEHPC_PAT_CLOS0_UNCACHE);
>> +		break;
>> +	case XE_CACHE_WT:
>> +		pte |= xelp_pte_encode_pat(XEHPC_PAT_CLOS0_WT_CACHE);
>> +		break;
>> +	case XE_CACHE_WB:
>> +		pte |= xelp_pte_encode_pat(XEHPC_PAT_CLOS0_WB_CACHE);
>> +		break;
>> +	default:
>> +		/* pte |= PPAT_CACHED; */
>> +		break;
>> +	}
>> +
>> +	return pte;
>> +}
>> +
>> +static u64 __xelpg_pte_encode(u64 pte, enum xe_cache_level cache)
>> +{
>> +	pte &= ~XELP_PAT_MASK;
>> +
>> +	/* Initially assumed as Non cohorent mode, correct values
>> +	 * has to be set depending on requirement.
>> +	 */
>> +	switch (cache) {
>> +	case XE_CACHE_NONE:
>> +		pte |= xelp_pte_encode_pat(XELPG_PAT_UNCACHE);
>> +		break;
>> +	case XE_CACHE_WT:
>> +		pte |= xelp_pte_encode_pat(XELPG_PAT_WT_CACHE);
>> +		break;
>> +	case XE_CACHE_WB:
>> +		pte |= xelp_pte_encode_pat(XELPG_PAT_WB_CACHE);
>> +		break;
>> +	default:
>> +		/* pte |= PPAT_CACHED; */
>> +		break;
>> +	}
>> +
>> +	return pte;
>> +}
>> +
>>  /**
>>   * xe_pt_create() - Create a page-table.
>>   * @vm: The vm to create for.
>> @@ -216,6 +293,13 @@ struct xe_pt *xe_pt_create(struct xe_vm *vm, struct xe_tile *tile,
>>  	if (!pt)
>>  		return ERR_PTR(-ENOMEM);
>>
>> +	if (GRAPHICS_VERx100(vm->xe) >= 1270)
>> +		vm->pte_encode = __xelpg_pte_encode;
>> +	else if (GRAPHICS_VERx100(vm->xe) >= 1260)
>> +		vm->pte_encode = __xehpc_pte_encode;
>> +	else
>> +		vm->pte_encode = __xelp_pte_encode;
>> +
>>  	bo = xe_bo_create_pin_map(vm->xe, tile, vm, SZ_4K,
>>  				  ttm_bo_type_kernel,
>>  				  XE_BO_CREATE_VRAM_IF_DGFX(tile) |
>> diff --git a/drivers/gpu/drm/xe/xe_pte.h b/drivers/gpu/drm/xe/xe_pte.h
>> new file mode 100644
>> index 000000000000..8b3b5b471a99
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/xe_pte.h
>
>s/xe_pte.h/xe_pte_pat.h
>
>Just my option prefer this.

dunno, but since we have different pte formats for ggtt and ppgtt, IMO
it would add to the confusion.

Maybe this belongs in xe_pat.h since it's xe_pat.c that programs the
tables giving the meaning spelled out in the macros here for each index.
The rest of the code then need to set the bits in the PTE to reference
those indexes, according to the PTE format.

>
>> @@ -0,0 +1,31 @@
>> +/* SPDX-License-Identifier: MIT */
>> +/*
>> + * Copyright © 2021 Intel Corporation
>> + */
>> +
>> +#ifndef _XE_PTE_H_
>> +#define _XE_PTE_H_
>> +
>> +#define XELP_PAT_MASK                  BIT_ULL(7) | BIT_ULL(4) | BIT_ULL(3)
>> +#define XELP_PAT_WB_CACHE              0
>> +#define XELP_PAT_WC_CACHE              1
>> +#define XELP_PAT_WT_CACHE              2
>> +#define XELP_PAT_UNCACHE               3

example... this duplicates what we have in xe_pat.c (comment added here
for clarity)

static const u32 tgl_pat_table[] = {
         [0] = TGL_PAT_WB,
         [1] = TGL_PAT_WC,
         [2] = TGL_PAT_WT,
         [3] = TGL_PAT_UC,
	// .... those are programmed, but not expected to be used
         [4] = TGL_PAT_WB,
         [5] = TGL_PAT_WB,
         [6] = TGL_PAT_WB,
         [7] = TGL_PAT_WB,
};


IMO the abstration could be something like

	// this is valid for both ppgtt and ggtt
	pat = xe_pat_get_index(xe, cache);

	// this changes between ggtt / ppgtt
	pte |= vm->pte_encode_pat(xe, pat);


so the PAT indexes are handled by xe_pat.[ch]. The pte *encoding*
is then handled differently by ggtt and ppgtt. Thoughts?

Lucas De Marchi


>> +
>> +#define XEHPC_PAT_CLOS0_UNCACHE        0
>> +#define XEHPC_PAT_CLOS0_WC_CACHE       1
>> +#define XEHPC_PAT_CLOS0_WT_CACHE       2
>> +#define XEHPC_PAT_CLOS0_WB_CACHE       3
>> +#define XEHPC_PAT_CLOS1_WT_CACHE       4
>> +#define XEHPC_PAT_CLOS1_WB_CACHE       5
>> +#define XEHPC_PAT_CLOS2_WT_CACHE       6
>> +#define XEHPC_PAT_CLOS2_WB_CACHE       7
>> +
>> +#define XELPG_PAT_WB_CACHE             0
>> +#define XELPG_PAT_WT_CACHE             1
>> +#define XELPG_PAT_UNCACHE              2
>> +#define XELPG_PAT_1_WAY_WB_CACHE       3
>> +#define XELPG_PAT_2_WAY_WB_CACHE       4
>> +
>> +#endif
>> +
>> diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
>> index edb3c99a9c81..9e1b33c17d05 100644
>> --- a/drivers/gpu/drm/xe/xe_vm_types.h
>> +++ b/drivers/gpu/drm/xe/xe_vm_types.h
>> @@ -312,6 +312,7 @@ struct xe_vm {
>>
>>  	/** @batch_invalidate_tlb: Always invalidate TLB before batch start */
>>  	bool batch_invalidate_tlb;
>> +	u64 (*pte_encode)(u64 pte, enum xe_cache_level cache);
>
>Add kernel doc.
>
>s/pte_encode/pte_pat_encode
>
>Again just my opinion. Let see if anyone else has an opinion on the naming.
>
>Other than these NITs it LGTM. Didn't read to the bspec to check the
>actually bit setting, but can do that ahead of the next rev. Speaking of
>that, do you have a bspec link so I don't have to search through it?
>
>Matt
>
>>  };
>>
>>  /** struct xe_vma_op_map - VMA map operation */
>> --
>> 2.25.1
>>
