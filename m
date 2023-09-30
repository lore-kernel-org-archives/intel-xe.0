Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6956E77358
	for <intel-xe@archiver.kernel.org>; Sat, 30 Sep 2023 05:24:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 706A710E1BA;
	Sat, 30 Sep 2023 05:24:34 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6007010E1BA
 for <intel-xe@lists.freedesktop.org>; Sat, 30 Sep 2023 05:24:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696051472; x=1727587472;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=eoYFW35BgAAlTX9BiXUuL6brZ5Oh8Pfv7JGrbgbXVkU=;
 b=FBXYcqnDE/VQ8KFmVOHm/GabJD7pR9o/Kg7/o7pNgDr8i8W+fhZkAcl2
 grJiSC1ZB+/DW84Z9tC3ZNaDWZEozpO+nuZEIW5ETObcumYJ0/3W8Fhjz
 42Cy9PKxS6+EqoXisEu7ggccK4LUjlmGjLEzOJdBunWEe2kDLOB3LduLK
 S/brb/ICYHKFJr2cIPOlZJ3jeVLfU0e2t9Vz1avmHaXlf1L2DbpxV2ecC
 1UeM7RvuOLwuBpk8Wmx24xNKHoh6u6ktJ9Xv/pWWhi+/ed+/V3z5RMCXh
 Yuq1ZAB78kuY1BUU3Z3ApA18kRo4mCkZaKgMr49WF+6ComNjQ+g2l5LEA g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10848"; a="448915736"
X-IronPort-AV: E=Sophos;i="6.03,189,1694761200"; d="scan'208";a="448915736"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2023 22:24:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10848"; a="820378175"
X-IronPort-AV: E=Sophos;i="6.03,189,1694761200"; d="scan'208";a="820378175"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Sep 2023 22:24:31 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Fri, 29 Sep 2023 22:24:30 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Fri, 29 Sep 2023 22:24:30 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Fri, 29 Sep 2023 22:24:30 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.43) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Fri, 29 Sep 2023 22:24:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BvuOqvClFbi+fYliTiAgdq2Wiv893HoZPEM4foBr6DKGTA7sjQrlWAkswES0S50B71gIXsscuvQWv7++bAL6RYSzfYVNS+qVYvc3EliNrSrLeJddT46+mkwx75TWkEuHOBiCUPKMyd81b+kyGwApRF0FA/Z/9mYFDNfYWHf8y8wChVTvk19qQMWpDt5KqyspD2+dYHZtTuPxX/7xiu23NofSdu85D4Tqz96xUWSUs4iwQOIefSgYe9u627aJJR5I2XX7FH/KVmd0VdKVKi1Efa0a2h4aiA/IxZn2E0BoCm+WwkE99KE9z+ooDRLcRxj15PvcvBHgUc0ikfRpv8hhEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mnrgH7nbwwk4kmqcjOKNkGfxyAexzXQo0TKBAHml20s=;
 b=aqipppmgsizIp1RXTE+z/QLPOI+L4I+MtN2+8VpE3rNlZJMwSSbmdksGbVXExxrAb4hjsesv8BZ7icWOaFtSlbKjYBd0F9tRiQIpeob5xxjlIS23q5y9C/q+NLZCLbR3DipdQKSoce5CDCm3A8Cy8CQBx1DY/4dQR0fXd26C+xXm3cHhzQEa0ZN3J2iynuGV0WR1Wo+ij1WfolB1eGyL7eJyRomb9wlGCLqbOPf4FaEG42IzyaFRVNG4VlgMnUsrbtPUK2/IRogGvxnwItyC5+0oHOpOyDsHoLwAdkHQh+liCB6ZXXheaLAbbJR6zMRxXqVaMeCgtVhJoODfDVNfdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6952.namprd11.prod.outlook.com (2603:10b6:510:224::13)
 by SA2PR11MB5033.namprd11.prod.outlook.com (2603:10b6:806:115::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.23; Sat, 30 Sep
 2023 05:24:28 +0000
Received: from PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::4182:281:404a:1042]) by PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::4182:281:404a:1042%3]) with mapi id 15.20.6813.017; Sat, 30 Sep 2023
 05:24:28 +0000
Date: Fri, 29 Sep 2023 22:24:25 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Paulo Zanoni <paulo.r.zanoni@intel.com>
Message-ID: <ZRexCZczizPkWdNm@nvishwa1-DESK>
References: <20230929173104.2014590-1-paulo.r.zanoni@intel.com>
 <20230929173104.2014590-3-paulo.r.zanoni@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230929173104.2014590-3-paulo.r.zanoni@intel.com>
X-ClientProxiedBy: BY3PR05CA0019.namprd05.prod.outlook.com
 (2603:10b6:a03:254::24) To PH8PR11MB6952.namprd11.prod.outlook.com
 (2603:10b6:510:224::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6952:EE_|SA2PR11MB5033:EE_
X-MS-Office365-Filtering-Correlation-Id: 2278a560-ada2-46be-58bd-08dbc1758492
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OYwyzYeiTTrCFKhSUKHcds0bFrgKtrPbEMCD+g5SV8Oxb3DOJJuyuHiftAfSJUa1QwFAcxOS5/ZaD02jFWVhbJzGBxS4e5dDs2837pLOoUZ3tFnqhEF8P+R9EYJtG+qsKGMznKORJwnixlmrh5skbueSQAz/a4KcV78xo2ktsPVYwG73jMosgzE7rwuqVBEKkhS19zNezLl2dtGaPGdDLXW9fgwkcYaAsgSt9nQFnQHUj17JLHJkzUzBfNJyRFB+NxP55ynMq82twRkXV2CH/UuRgFbsPSy05AcGEOD+P8C6KszRb3u9Y8n0CtINp4zuMqKB8Pek4h+MZeZvtdVm0JMusA/Nfvg/lEFQtdajVoguXaLhYRHGiNF9Sns6WSgm6wAn2ygl5r7EwV8lnRXKERM95HEZu0vst6Tn8Dosc6v53xdeWWPbkKtezM1b/f5jghQoC/xA49YlTFxiEWW0fqlJAniYpoRia9dNiq6Pv7jg2AVbNsOYFJ2H2GvntiE2d1LVmJ1abRZNGC9gcR6rB4RTwOVH7DC+ZjU6EjRdixlME2JzCT/JAjDUSMXg7Ook
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6952.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(346002)(39860400002)(136003)(366004)(376002)(396003)(230922051799003)(186009)(451199024)(1800799009)(64100799003)(44832011)(5660300002)(2906002)(316002)(66556008)(66476007)(66946007)(8676002)(4326008)(8936002)(41300700001)(6636002)(86362001)(33716001)(6666004)(82960400001)(478600001)(6506007)(83380400001)(26005)(9686003)(6862004)(38100700002)(6512007)(6486002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?qMW8kXP9PmyIBYulPtUao+YSRyGyyx9q7rAa9MlEEnB8qToQkpPle0BYfB39?=
 =?us-ascii?Q?1PLL7LhJgeVpkrAu5r4vuOV7tooWbzSH7mFc5IzaIHcQanCxHF6/8cKUHSmi?=
 =?us-ascii?Q?A2g1M7Osagzb+XQHs98XFWpoYMv8Y70cPa/xWcUAZraxRgwd54+oLkSO8lpX?=
 =?us-ascii?Q?nC2xmeUU2XgciboxRi47YNIm8P5DGnx4Y3PDGYjAre0bcQELZeo4SXwUbXPG?=
 =?us-ascii?Q?eD6luPYLS4PHpVA/xA/afEukovQTs4xD43VzP2GKol75Rr4o6hUSFeB0gPS0?=
 =?us-ascii?Q?fxGc3e+XNlbA7XCZcaCChGNkN6uMovyzveGgGNGkCUP4Xw8nkicrVMwlgULZ?=
 =?us-ascii?Q?fb9Hs4A4gBVUyrdZBHL7iCxiENfejtKBiiecPLRDLrzM9+IBVBeYBGyvEmyX?=
 =?us-ascii?Q?bn+DNKa62p9avmdJ3vUDpTxgu5rfMKD7UqrOtX86emq4eNHCfhqyeLXBMFzs?=
 =?us-ascii?Q?vHbd/I+rTiHeFmkijTMJpnKBjAjdVYb3FdaoWpLWqw5NiCPdgzI23FqmMwux?=
 =?us-ascii?Q?pNaaaQpaIUIDiQl89RAhywg2soKu5w9S43nlHLr78XIuZb8rRMgOXI/OiHaS?=
 =?us-ascii?Q?omniqNhTm5E4PCBFOOZEvlbFnEz7sPkdQhh8gbVzD1NgDgDXJkAIYOC9PlbB?=
 =?us-ascii?Q?fhoRHa9VyBoZZ6BHM5tFjpYEgLblxe3uKORIWRqmgJZ7xk+rmE3vExEbyl2p?=
 =?us-ascii?Q?7p7Z42GB3QibKbo3jWxOGud5nDOOlEWwGZPmdSAyJ8vmguzl76hisf+CsAOI?=
 =?us-ascii?Q?D+GI2OCMF5KunKTPKvcaWSHyqgrEqPnkGz7metKTwNqdR1efeGW1OAXJPlWN?=
 =?us-ascii?Q?RPpqUcymksouJDtf+qDnoTa7AEMEWa6+AT43l63ymGRCsrMC4ZY7XWDZyrZ/?=
 =?us-ascii?Q?/EG5K/IKQGXdAor3rzpUlGPWHNKEkR+torpuZXzAtlBRYXgqbg4diNDq2Wkp?=
 =?us-ascii?Q?xhMlrCU6iSbt5ooq0YkMqfAsQI8gfkvN+fr7nctrQzmIyYiu07uzZ5aJWLHb?=
 =?us-ascii?Q?phDoumPAcKFuqyhMseVOSDmfjyU4/X8l3DZB06X6CT5FK5rp2ErX8M3pDKVd?=
 =?us-ascii?Q?bdcLdIp+Z1go+QQR8N/rnWGDy/8n3QGxQhoW3Lllr6zklNzmNCDna+mYbuGk?=
 =?us-ascii?Q?4NQzQKJIwcFAYlL2DhJJafLFfkzcjYW3KXzv2ZfqLWGwo3o+GKDY3b1B0w2e?=
 =?us-ascii?Q?ntDV//4GZBJ+mU979n21AOT+rLh8WlkoHxWWBokNCFOVpn8bxFlJHT09kS22?=
 =?us-ascii?Q?6xA9Tz5QJUmZMmnDXs5zlOiP5uC6boWjGbiCM+LMlqF1Piea5ABni4iXjO/d?=
 =?us-ascii?Q?fRDKQh7BaqtDUZtPIfvcSfD5EAi1KcyG6MSs1p/vBCm5du3kGVgbyxKc/qW1?=
 =?us-ascii?Q?xq1jRPo/MWwNcg3m99O87lrzMe1ley1WF7UwChei+wUBY8HMfW17vhrpOkj0?=
 =?us-ascii?Q?FhyrTd51JRKb/74Mmh5ifUdlx9Xyl0AyCD1EgH94MmA8hxN9hafLvhP/y+/6?=
 =?us-ascii?Q?/wRGqzOmUClTbwF/LvEDHFlZGtoZx3eXqI9sLVFxm2tqGxXtrm6303JJGa5K?=
 =?us-ascii?Q?i2wmsG/8eUViXBOO2+Y16T7DcxfYfUSgT8MTgutFPD9UX/reAlYOCFZ/gpPs?=
 =?us-ascii?Q?2cn4sCyWxFAhfWgLUzhee6I=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2278a560-ada2-46be-58bd-08dbc1758492
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6952.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2023 05:24:28.4043 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kUHSw3TEwgE0+AIcgL1yHIQc9MmxIxqGdu4g+fwpsq+Q3f07wjCJsZJHQDSbOsLC81lzC/GFparXb8procGWiYdQ1suPBL4OpiYkHsJR/cSlgczF20qK7PH9BYd3Ate1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5033
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 3/3] drm/xe: fix range printing for debug
 messages
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

On Fri, Sep 29, 2023 at 10:31:04AM -0700, Paulo Zanoni wrote:
>We're already using the half-open interval notation "[A, B)", that "-
>1" there makes it wrong. Also, getting rid of the "-1" makes it much
>easier to grep for the logs when you're looking for an address that's
>the end of a vma and the start of another.
>
>Signed-off-by: Paulo Zanoni <paulo.r.zanoni@intel.com>
>---
> drivers/gpu/drm/xe/xe_pt.c | 4 ++--
> 1 file changed, 2 insertions(+), 2 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
>index 4d4c6a4c305e..70a8bd3558c2 100644
>--- a/drivers/gpu/drm/xe/xe_pt.c
>+++ b/drivers/gpu/drm/xe/xe_pt.c
>@@ -1265,7 +1265,7 @@ __xe_pt_bind_vma(struct xe_tile *tile, struct xe_vma *vma, struct xe_exec_queue
>
> 	vm_dbg(&xe_vma_vm(vma)->xe->drm,
> 	       "Preparing bind, with range [%llx...%llx) engine %p.\n",
>-	       xe_vma_start(vma), xe_vma_end(vma) - 1, q);
>+	       xe_vma_start(vma), xe_vma_end(vma), q);
>
> 	err = xe_pt_prepare_bind(tile, vma, entries, &num_entries, rebind);
> 	if (err)
>@@ -1618,7 +1618,7 @@ __xe_pt_unbind_vma(struct xe_tile *tile, struct xe_vma *vma, struct xe_exec_queu
>
> 	vm_dbg(&xe_vma_vm(vma)->xe->drm,
> 	       "Preparing unbind, with range [%llx...%llx) engine %p.\n",
>-	       xe_vma_start(vma), xe_vma_end(vma) - 1, q);
>+	       xe_vma_start(vma), xe_vma_end(vma), q);

LGTM given it was intended to be half-open interval here and in
xe_vm_dbg_print_entries().

Reviewed-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>

>
> 	num_entries = xe_pt_stage_unbind(tile, vma, entries);
> 	xe_tile_assert(tile, num_entries <= ARRAY_SIZE(entries));
>-- 
>2.39.2
>
