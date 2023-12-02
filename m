Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E826C4167B
	for <intel-xe@archiver.kernel.org>; Sat,  2 Dec 2023 06:06:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B7DF10E163;
	Sat,  2 Dec 2023 06:06:09 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED7FD10E163
 for <intel-xe@lists.freedesktop.org>; Sat,  2 Dec 2023 06:06:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701497166; x=1733033166;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=7ASbyRSK9LNN6tCdIf95twI5NAuEDNcyTJktzT7U+i0=;
 b=gRiJ8ODjHZeYqQKv9ujvuOz3Wf5KAVcxIiU0K3NnZBvUy3Qc3H33wtec
 eo+RcX766GsB0V2v1jIwuYfc8OUPT1KU6uu75qCCaRTVKGnZSwFRbZ6Yb
 FWVW9IyeWhfBZrUs6WkkUXNOyTn0ererJdkhDGGXe8L55DKW4pGGbknHC
 C4mVj85AsAfekDToL/V4hyPsWyiEyNcmezHiVffBlUPfBpkYPek0hFojX
 I6oKVW+NMAz4NfZ3VcmVDjhdgY0jTaEaEEpUk2+IfaRfw8K8dROBBFmia
 3PA1nK2+yyj3oVn4vc2URCyMIF04aOQkiPH0ZjVqtibhTq9efY9fS0jKg g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10911"; a="464668"
X-IronPort-AV: E=Sophos;i="6.04,243,1695711600"; 
   d="scan'208";a="464668"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2023 22:06:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10911"; a="773668005"
X-IronPort-AV: E=Sophos;i="6.04,243,1695711600"; d="scan'208";a="773668005"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 01 Dec 2023 22:06:04 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Fri, 1 Dec 2023 22:06:04 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Fri, 1 Dec 2023 22:06:04 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.101)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Fri, 1 Dec 2023 22:06:04 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J5ONfSNyuhE1zBOVYhhS1R+DmUQK0O1RqUCptqUNOWzpXLopTZKyYmhmxvGrbFpPoujHuso2cqhzW6gW9zw6+RBpGoUwEpgjzSoHOQg1pfAyg2jHIhzzCrK7ObD7NglZGNzPKhxZ3ed2rtKKJJwUSuRaWqKfdwBvxTmx1y5t7oH/uIhSeZftg6G6kBbdGNfiPhBuTOM9+DIGvabTafxumSpXkaHflLcqmMb5N3Ezp83Hi0UzxTEGOVvykeDUAFMsjxcppi4sG/Z8b61MfyYB5FqnXNIUTixoMHsKz8MnHp57LLhzwiKM1XhFXU65vAFfUlNBXQAspq5VLhWs/WYt4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OpLKSfsliJ1HqYqGVlLvhONGiJ3bUd7+H44h+8eyfmM=;
 b=NVHwn3vGJC2T8luElNE4oFh2V93agc58zuFw8Qa9BIK+2J6IAsFKZHqrIU/sOcg0rbCSGfjVVOmg2ahBD0NyGcxd8HYOGl91bMPPlEn3pmA0Mg8vGqJiFvNsIP9/tjKHMBrvVZYPmOflqu3BOuhU6WxsFnwVtt9cBtLBEukZ+suLFXZ5Ftve9f2SWihkh8XJI+SMtxkUYJ8yeUNbcsqMxAty+eA+JIapQwRjgLII3aNknv3ioazkubT0dWDHE0dpAOczD+T471Q4p7TEmvFLXjB346SPeShqsPhlY1+iP365kKuGleD56QQSOSitBPcmPcmE3gZvaM0lDmNQNIpSUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6952.namprd11.prod.outlook.com (2603:10b6:510:224::13)
 by BN9PR11MB5557.namprd11.prod.outlook.com (2603:10b6:408:102::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.29; Sat, 2 Dec
 2023 06:06:01 +0000
Received: from PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::787c:c5fe:c197:443c]) by PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::787c:c5fe:c197:443c%7]) with mapi id 15.20.7046.027; Sat, 2 Dec 2023
 06:06:01 +0000
Date: Fri, 1 Dec 2023 22:05:55 -0800
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Andi Shyti <andi.shyti@linux.intel.com>
Message-ID: <ZWrJQ9pz0N8bE8oY@nvishwa1-DESK>
References: <20231129025716.9094-1-niranjana.vishwanathapura@intel.com>
 <20231129025716.9094-2-niranjana.vishwanathapura@intel.com>
 <ZWpHjLio4sNtHWnm@ashyti-mobl2.lan>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <ZWpHjLio4sNtHWnm@ashyti-mobl2.lan>
X-ClientProxiedBy: SJ0PR03CA0018.namprd03.prod.outlook.com
 (2603:10b6:a03:33a::23) To PH8PR11MB6952.namprd11.prod.outlook.com
 (2603:10b6:510:224::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6952:EE_|BN9PR11MB5557:EE_
X-MS-Office365-Filtering-Correlation-Id: feb4071f-ac16-4a15-98ff-08dbf2fcc28e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ttOKfiv1rerK313vY/ZQA2ZJ5epwFY1dNRO5/2MeohcAkYUszGqo9o1ek9i+y11wZCIpa9NCNDXIWHkc6NoHYj+eGrQoYrRoZle6PA9LdeY+9JUExLn766Uf7sRUVkEySNau8LGXY6L0DOMEFU2j1P/vIY7YcEPTHyCvZ+XE4iQUo5A8edANVyocYrbXIMOhSalEG7yfNRnDNcZXzLj5V8KG4d6Gf2tvMtjZ7JB3HOcSiEEUlUfKfa0sI4ial4lYwf3vNZ38iRnKlwZF3khqbTJn1s6/pUhYSZ6NwRIpp1SxFTMUYRVWkR1bWbT1r4qKJ3B2pVlhGdJyEvmjQkpHb4sethTTjxC1t54Lvje7asNOOC0VmQhaSwYVxOCMJB0sCKj+lXF3xkcJQ+/6PtskvfZP1yJ+6Tgt3Dh+p0VBq3NHoNrWu6gdMrm6NNNjAjqihcB14xn01Tl5FDRZaR+I/Yyyh6Rm/2rlIxsJ9lYdBJdfRuKqKvmwi0FZfyhr/U4Kxe6jc2RB8ydUUQLOS0ofYpusQC+csUomGeyy5QzARUAKdhaNEsT7ofyEgg9Ahjuq
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6952.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(136003)(366004)(39860400002)(346002)(396003)(376002)(230922051799003)(1800799012)(64100799003)(186009)(451199024)(6916009)(66556008)(66476007)(66946007)(4326008)(8676002)(8936002)(316002)(478600001)(6486002)(6666004)(5660300002)(41300700001)(33716001)(2906002)(86362001)(44832011)(82960400001)(83380400001)(26005)(38100700002)(6506007)(9686003)(6512007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Xx+CG4JiprxHgZ/rLd+UBgLWozqKr/XDgBxu/IAj/cbf0lI1VCVZyBj39I1/?=
 =?us-ascii?Q?9EEls83E8/EthHrZ9s6etqDe2DtoGw4vfs80LhmuiVhENmDDvINQg45wBlou?=
 =?us-ascii?Q?3py/K2re6vr2BDT7+QTidFJwuYpweJwPFVJWFj5zwE0VcGSvAF0F4Ba9vX9a?=
 =?us-ascii?Q?D/P45lamOiNsWek7xvhSVnjyPsHhCbScv0cGaqSbykSXNt6f8rLSuPA0EoIn?=
 =?us-ascii?Q?wh3rlwupdG5hUZUVhk+qBFHV2GVWzD7f4eekXNeIQ2GGni34bvYBP2uB91t7?=
 =?us-ascii?Q?6QbIFkqqvp4Eam392X5EkPHQBspvXIQDtYfbUrAtOOZL/XL2Pa6iCoQp0xQ3?=
 =?us-ascii?Q?B6xaqdfGhhTNTzu/ttDyIX3s6ReHilX/T3mwDHacxh44li5PvzxaGW4ZC62a?=
 =?us-ascii?Q?DLvkYSFmDwEaqycOlUfIdbw8050rhwVfQ3yF0dnHrdAVcqWLiRclCNbG7dSs?=
 =?us-ascii?Q?VG3ytZwcSOQGbfJCwFTfblXMHbEXI/JUdJWAVnT4SfBMSoOLYgkN/0MMhGtU?=
 =?us-ascii?Q?wUM3XHQ4dpwuHvR17TuQUm76TsvgD8RdTiTTA+Gly9Rq9OMWK5OUy7Gg62JB?=
 =?us-ascii?Q?VD3uvrFnyi64ZcCwCfXeFFLsTruOTYBtzQf4Bo4vdHIHKvpRApyMVyta0LH3?=
 =?us-ascii?Q?TSYf2vmOuf1P30TeT9hoirzmvIvcORwEpr3vath72ji33Rxzd9+FyJWcEvTe?=
 =?us-ascii?Q?lx+ghSEbaRLf2PuvrdhRcE13f44xuXj3f6L3rjcTeUbRzgUkNqrVHldXVou2?=
 =?us-ascii?Q?6zs9sx5SgEOPXxt0HSodQ/Rp3e8lRwvYFquFsGeTTDCufRVGEbwpQ92H6Ksx?=
 =?us-ascii?Q?voOCBtM2SdIOXwUwOfGXUygKoBxsERGmE05lGO1jlW9tcfTwzsuNWw/A9qlr?=
 =?us-ascii?Q?68vehZAIm67AUjJmO1WPkJ1i/E6Iv+zYM67hgBfMEH8ABQL0t5Gw3Yt4mN6I?=
 =?us-ascii?Q?y0tc1GJ59VtF3WrRMsAOkKenVmSuAzQlZhnTsrcAhXoHnD+GeWPinUnwC79C?=
 =?us-ascii?Q?Rh3QD6jBFdTzrk5kLieYn6/pEy9bkgVq74LIRT9VQZDcFgYiff395EacQFvX?=
 =?us-ascii?Q?8Spqli8Ci0U1689JMR7ZJkoI11PaDUzcLXmc/Yx5BmAwhucQZpo+BEYQYfEj?=
 =?us-ascii?Q?1JSYw/0KMSUrR/1Z0d7QttEoK44m8BvP4ZITLCZZlIjo6TgWqNjvxGRh6Ob6?=
 =?us-ascii?Q?7/kkRpQA6UCxkvPaYI1KBNR9cEs4UzPN1vdbydHYMWd7IWmLOD9R76TqHxrz?=
 =?us-ascii?Q?zpr5kx20pdhQHeNWJTTbZUsRPwkrzlFz+TWMrAJCZj6LtofXTd51bJWU0Uge?=
 =?us-ascii?Q?iareoCF7CKUlviMSK0voR0ruyIyiJ9DT8wmdDqDEqjONZn9eTqwaCACw5RgV?=
 =?us-ascii?Q?fI3ltXmoP7r1FWGa9bQMqyZFqpoVI6cY1WUonTzAUii1giS6OjfRnZVAZioY?=
 =?us-ascii?Q?Co+NLb7BpCDBIj9dXHln2ZXMyA3+qIVM59aSBoXJxAfbbg8AM1Em7VqpAUA/?=
 =?us-ascii?Q?H6GWGLCyYtDaWWrMxCIHQ5owVBJhhzAee6lUn3+Ww3wdrpxpQyz5PbJIInF2?=
 =?us-ascii?Q?b2lAWrG/WkdwSG8KNypjfHUwX6r26n78UgG/6DwVBGvQnhTaPDpcT8kqL8Kc?=
 =?us-ascii?Q?/fz/sky1NpGotJV2aFW8cd4=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: feb4071f-ac16-4a15-98ff-08dbf2fcc28e
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6952.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2023 06:06:01.4505 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 725P12JVQWOt8ugTp3+AASgNOEie2MDYkLyAM+G6j3H3ZDT+24Dx8qU4kX8lBAk1tN1eeWkSd9BslcihS37DjYUwL25Ru/qwlEDds/txGG6OGCijDhGpYZ5C9b4Uzu5V
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5557
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 1/3] drm/xe: Enable Fixed CCS mode setting
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Fri, Dec 01, 2023 at 09:52:28PM +0100, Andi Shyti wrote:
>Hi Niranjana,
>
>looks good, just a few comments below.
>
>...
>
>> +static void __xe_gt_apply_ccs_mode(struct xe_gt *gt, u32 num_engines)
>> +{
>> +	u32 mode = CCS_MODE_CSLICE_0_3_MASK; /* disable all by default */
>> +	struct xe_device *xe = gt_to_xe(gt);
>> +	struct xe_hw_engine *hwe;
>> +	int num_slices = hweight32(CCS_MASK(gt));
>> +	int width, cslice;
>> +	enum xe_hw_engine_id id;
>
>please put 'id' and 'hwe' inside the for ()
>

Ok

>> +	u32 config = 0;
>
>this should actually be sorted in a reverse Christmas tree shape.
>

Ok

>> +	xe_assert(xe, xe_gt_ccs_mode_enabled(gt));
>> +
>> +	xe_assert(xe, num_engines && num_engines <= num_slices);
>> +	xe_assert(xe, !(num_slices % num_engines));
>> +
>> +	/*
>> +	 * Loop over all available slices and assign each a user engine.
>> +	 *
>> +	 * With 1 engine (ccs0):
>> +	 *   slice 0, 1, 2, 3: ccs0
>> +	 *
>> +	 * With 2 engines (ccs0, ccs1):
>> +	 *   slice 0, 2: ccs0
>> +	 *   slice 1, 3: ccs1
>> +	 *
>> +	 * With 4 engines (ccs0, ccs1, ccs2, ccs3):
>> +	 *   slice 0: ccs0
>> +	 *   slice 1: ccs1
>> +	 *   slice 2: ccs2
>> +	 *   slice 3: ccs3
>> +	 */
>> +	for (width = num_slices / num_engines, cslice = 0; width--;) {
>
>why not
>
>	for (....; width > 0; width--) {
>		...
>	}
>
>as normally it's done? :-)
>

Ok

>> +		for_each_hw_engine(hwe, gt, id) {
>> +			if (hwe->class != XE_ENGINE_CLASS_COMPUTE)
>> +				continue;
>> +
>> +			if (hwe->logical_instance >= num_engines)
>> +				break;
>> +
>> +			config |= BIT(hwe->instance) << XE_HW_ENGINE_CCS0;
>> +
>> +			/* If a slice is fused off, leave disabled */
>> +			while ((CCS_MASK(gt) & BIT(cslice)) == 0)
>> +				cslice++;
>> +
>> +			mode &= ~CCS_MODE_CSLICE(cslice, CCS_MODE_CSLICE_MASK);
>> +			mode |= CCS_MODE_CSLICE(cslice, hwe->instance);
>> +			cslice++;
>> +		}
>> +	}
>> +
>> +	xe_mmio_write32(gt, CCS_MODE, mode);
>> +
>> +	xe_gt_info(gt, "CCS_MODE=%x config:%08x, num_engines:%d, num_slices:%d\n",
>> +		   mode, config, num_engines, num_slices);
>> +}
>> +
>> +void xe_gt_apply_ccs_mode(struct xe_gt *gt)
>> +{
>> +	if (gt->ccs_mode.num_engines)
>> +		__xe_gt_apply_ccs_mode(gt, gt->ccs_mode.num_engines);
>> +}
>
>I don't see the need for this wrapper here... just:
>
>void xe_gt_apply_ccs_mod(struct xe_gt *gt)
>{
>	u32 num_engines = gt->css_mode.num_engines;
>
>	if (!num_engines)
>		return;
>	
>	...
>}
>

Ok

>...
>
>> +static inline bool xe_gt_ccs_mode_enabled(const struct xe_gt *gt)
>> +{
>> +	/* Enable CCS mode interface on all platforms with more than one CCS engine */
>
>This comment is misleading, since it's not doing any operation,
>please, replace "Enable..." with "Check if it's enabled..."
>

Ok, will simplify it.

>> +	return hweight32(CCS_MASK(gt)) > 1;
>> +}
>> +
>> +#endif
>
>...
>
>> +	/**
>> +	 * @ccs_mode: Fixed mapping between CCS engines and compute slices.
>> +	 * Through the per-gt 'ccs_mode' sysfs interface, the user can specify a
>> +	 * fixed number of compute hardware engines to which the available compute
>> +	 * slices are to be allocated. By default all compute slices are allocated
>> +	 * to the first available compute engine instance. This user configuration
>> +	 * change triggers a gt reset and it is expected that there are no open
>> +	 * drm clients while doing so.
>> +	 */
>> +	struct {
>> +		/** @num_engines: Number of CCS engines enabled */
>> +		u32 num_engines;
>> +	} ccs_mode;
>
>why the need to have a struct here? It looks free complexity to
>me.
>

Earlier version of the patch series has other fields in this stucture.
Ok, will simple define it as,
u32 ccs_mode;

with definition,
@ccs_mode: Number of compute engines to be enabled

Thanks,
Niranjana

>Andi
>
>> +
