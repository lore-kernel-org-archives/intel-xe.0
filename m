Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89046E7E635
	for <intel-xe@archiver.kernel.org>; Tue, 26 Sep 2023 13:50:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54B4E10E3E2;
	Tue, 26 Sep 2023 13:50:34 +0000 (UTC)
X-Greylist: delayed 424 seconds by postgrey-1.36 at gabe;
 Tue, 26 Sep 2023 13:50:32 UTC
Received: from mgamail.intel.com (unknown [198.175.65.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8764110E3E2
 for <intel-xe@lists.freedesktop.org>; Tue, 26 Sep 2023 13:50:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695736233; x=1727272233;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=R1FDPPIjpbUEPkvS0Z1RtrJ04CfC6DLaKB0wfuKvEI8=;
 b=cI0C+cNJKj9zuTqAsEwD60Y90vUrh6byxS8OM0XGFLbx4CZm726ordFG
 aiZ5g+01E/sMNdcEBP85tVJynav2Zkf9zU2fihe5dhmIlnvJ0WBScckP5
 j8L7eWY/SUlLMvNDuMCPQdDNde1C0viSjb98Hfoc9E4q2aY8rAGJ13fJc
 4uuLEdLzxFEkuI9bbaefNuZOemLqcmO7M6QbjidlMRa7FjzTtA6SJkD9L
 7+pSjSH0vmnYCQmg5QCV5ikDYfIZuiVjSWh3CZqL8h6eBqC+vedwIcY3k
 3cTd+j34iZsjWjXi1aN/VCFDA05NIBZXpbKs+aKnggo2eA5j0qoj39dzT Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="208348"
X-IronPort-AV: E=Sophos;i="6.03,178,1694761200"; 
   d="scan'208";a="208348"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2023 06:43:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,178,1694761200"; 
   d="scan'208";a="161534"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Sep 2023 06:43:28 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 26 Sep 2023 06:43:27 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Tue, 26 Sep 2023 06:43:27 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.45) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Tue, 26 Sep 2023 06:43:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bXF1PdbzsL1fU9M9jHzX4z5WnLzIlKO9NhYN4AAelWp1bufhDpUsmOhXYUP92sA17xW/YuHqm+lw6u+3Xqn4POs+/u2wDQ9vnpyGqlvUOlHBELNLcRABpLmqIHSIDVxM5qALFeDnfMba/Vl+dHM6hgqSO1axU7AZ2mADfqNnP+upDSxvlhPXz9V6nBMMCmgnvD5h++ff/N/wI86tB9diWHOMsNTm4RH44ddBtckzVB5hIRrBqyGnSQXRodab6/B9pHaCu7sANoMK+IMYxgYWHRqhx91wBExgWPtAjuvt6Gj2tN91wauMAnwLhOA95MWyqPpJTyZQoRTnPd9+uUev3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ssqm7C6t+CIGvDBeVW5usgRiZR42lWqWgoT60m0SXPs=;
 b=lurZNynoFMO5b/FKYlJdkqsh0LyWYR01JWC1tQnxEMce2DcRoMeTw8S4VBHSb/7yfrgPKbq1sEC0vQwQPPQMwwejm/xUsxyS/jF6M4TR33cBNF/XhAiHvUKPEkPmC9UkySCTGCY9QtENMOAhIxqmSkf7EmjEyYbHtqQ9sc47Z6KLVQsa4rCPy1vjZltA8pkaB0CE6iFlwVS9j4LsfFASRH2I1jUSUSS51kBcqRf+CnPZFIP8tq2sMImB+nMhEEBqeNT5tZMlcs6muh/AO55LrruZKuPcdZOaTHQQbxh5h86jBZS/rvuBv2+teXTqjQGnEYH1taZ8QNMOC7qvuOoiNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by MW3PR11MB4619.namprd11.prod.outlook.com (2603:10b6:303:5b::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.28; Tue, 26 Sep
 2023 13:43:24 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::cc12:ab15:1d0:af79]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::cc12:ab15:1d0:af79%5]) with mapi id 15.20.6792.026; Tue, 26 Sep 2023
 13:43:24 +0000
Date: Tue, 26 Sep 2023 08:43:20 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Message-ID: <aqu67ps2p6azfwkd6tabvqqsprmesuf4dtqn7mdc43bndubxej@jnl363wc5l76>
References: <20230925221049.2681491-1-lucas.demarchi@intel.com>
 <20230925221049.2681491-2-lucas.demarchi@intel.com>
 <20230925223006.GX2706891@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230925223006.GX2706891@mdroper-desk1.amr.corp.intel.com>
X-ClientProxiedBy: BYAPR08CA0053.namprd08.prod.outlook.com
 (2603:10b6:a03:117::30) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|MW3PR11MB4619:EE_
X-MS-Office365-Filtering-Correlation-Id: 262deeaf-f939-48a7-40d2-08dbbe968e2d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pv/bAKkESmGY74rZ361fZPdXHLP7JFmxg8hAWipJzz4l6ndBq/m/aTS8S8k4Q5DONL4MurG1bqjfXmTXhOIp+SaGeEv2Y8Pvipa+ZT/5FobwQNplhWezs8o79TIhMyILdJTdMsaxe3CGiLU9UYQludVGi4q4DmYGthchrRmJZYFkOg09ijdHFDL0ZeX3dwLH0qQV9qYG456pBVSSpv9GN+3uqnAYz0+4M9ptPmYpfqMnA3JDo3hBqfJYKBmWfwOb3X5z9JL3clO8TRMziV5nN28dSRDtliLB6PUQvjB7eQ8UJO3ocuYg3ydmI16nVrPUDjB50avvb//JeL+rkPFw3srDDkpVZGMaMySZOW65suZaU3B6o7h6Y61/Ih6zVsHmlL2RjDxe2lcJ4ZKtU8AOo/1sTVUJirWKUo7gZFXexcIFl7C8XTzwlKeN2CDdmRiZr6a+SRZ1lJ5naj38jTn7oIBULmQXV3zX4UBsu/cS11APLdJ/yiTmrvGcFq39lkSYMR/K3BFjm67jS5CMWAt0dvacdUPJwpTM9l06UtP9gNwUJBOP6eUn4jGwxPWWi/Hhi1lqR/82ou9TkpxeTK1wIV0LFtCDW2TUAM581UXuLiQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(376002)(136003)(39860400002)(346002)(366004)(396003)(230922051799003)(451199024)(1800799009)(186009)(8676002)(8936002)(4326008)(6862004)(26005)(2906002)(478600001)(66476007)(316002)(6636002)(41300700001)(66556008)(66946007)(5660300002)(6506007)(6666004)(6486002)(66899024)(6512007)(9686003)(107886003)(33716001)(83380400001)(38100700002)(86362001)(82960400001)(21314003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?9EYPEEIG52ExKbgpIcfXQPbhUkkImxtRif97NqrL3Pnb9xRH15uknCtSW4ij?=
 =?us-ascii?Q?QAPoXkELsv9moKPDME1juX73n2Uv0fGDd7cn52D1m5pQ/e61eGQou09G5j5F?=
 =?us-ascii?Q?HPqXMLgRf1uWFPGBNAPgOMYxirNUEEqNgMXNe2F+3+6m9GfxqaVVwzcQuJPa?=
 =?us-ascii?Q?DgSRJEtx1GfdlRgZYkl0991dUFjNMFKQDxHc6NNq77kNgHJpRPm8TgmRFBkL?=
 =?us-ascii?Q?gGN4CoMIBMZUd0eO+YLiBDkuJb8ePnpP0Sc9RQzBZd4SQMU3nPAriUrK+Gmb?=
 =?us-ascii?Q?rz4g7NaFxYYLboI5f+Nk31MDEItjbLW2Wqil9YGJgYZPeGE3ewCy2wAcilAB?=
 =?us-ascii?Q?b+uzFzLxkzJxVBaO3MDdmMYwaT7ndIeXRu8B1jIHmY752aYPqG/aj4W0AFtR?=
 =?us-ascii?Q?Y7vSeyAjW4Iz3/zDDCggqRbD+IsM/qeL0CxzW0j1k5Vpvl7W7AvIgZMufLL5?=
 =?us-ascii?Q?7kmNmZVj30HkDf8mDXX+egO/nV/FSTJPjDtieYi1SWVawADY4Tai5V/scsMD?=
 =?us-ascii?Q?WQZNJtSAjg8K1wEUg6UASNvRx4sU1Dq8VlA0KDl3V/MS0SfcMgc0tBbob1HW?=
 =?us-ascii?Q?GBFv0f/c3YdlMQxKOoADW6ABpedpKckHMrL9ZsI+E/s458CxASR3r/2sU1D3?=
 =?us-ascii?Q?uW9Vk7whyOzwohVQC+D/PuQbLSznsqv8I+4Q0cW8x4oadMPIJYJKoR/48FAl?=
 =?us-ascii?Q?7DGfssoxZenSz/7h50sbPFW/MWiEEFkKGBjI1jM6PDYhSmIHI3H+o/xAZfaI?=
 =?us-ascii?Q?bEmd/IM1VAviu7MS5ohYbaIPhw9GijUng4S1cTnOlM/AUtQifVrf+CRDEBn6?=
 =?us-ascii?Q?Wwg0AXPR+5ch/eWOlhp6M8I4OlOEn5o+jF0sUhbGIt21vGf35IVuzQrPiJo5?=
 =?us-ascii?Q?D3I8ODMlGVa+uiD7K/mB6zNd/vZA27vCVcPm0axzFjLOUX3jLj8s3EdytI0Y?=
 =?us-ascii?Q?KNsnk2Cd9YI1KIWuWy/s6ar3lA1HGlVzGOxT7d5WiLEtz/gJ/Lg3GHVqjoOv?=
 =?us-ascii?Q?lVBKJqEnQXmHpHbSQDbN6iWM7c5XKREENYzfLnSuiO1McKLSv9u3c+NL4h/i?=
 =?us-ascii?Q?Wt2+qry0vK7GybV/AaM3/uPRPoI2E+RcHcN4+EgJUWMgZvTQ3rzEnXzeaPDc?=
 =?us-ascii?Q?4F4wvN2oG0Do7F3zCXvwab3d8M9M7Jgw/3XRp/rsF0TZRUs6aZdA0HRbYwY6?=
 =?us-ascii?Q?HI3TeQkaWZxitMcBAxiVu56CnRty1WHZkvYhsgjCbmGisr8yKlafkmjtUcwB?=
 =?us-ascii?Q?pOWrfhRYAhZ9AfK9pAZuwW9M9NhueqzDY0rLrW5HiVLWTpnAmss3ELbWkoDw?=
 =?us-ascii?Q?ulaRWn30nrYW06hVYYqjiaBupiEqU1oWuWcb3uHFQ0VqKg0SW6MMYCwfpa+C?=
 =?us-ascii?Q?nFAGV469bQHR3VU6/jv52ggh4S0voOnESDhce3eznO5njH/hpuSSnGhroOqv?=
 =?us-ascii?Q?JGmHrDGd4fKvUruTExc6Mce9uzkFlg+s4Qv3YVeewFNtmP8WbdiacCgzWKwF?=
 =?us-ascii?Q?OncfQ7BQmfyWH3uUANvqH1/XD9zuHPvNq7V5y7KgTidlaxKh+ZDU+pfoJBn3?=
 =?us-ascii?Q?HZvwUX7TDTRqs8oInFBJMypGXBSsK5kYOzfQcDe1CqHkHw+JgYrzWwvruxhc?=
 =?us-ascii?Q?fw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 262deeaf-f939-48a7-40d2-08dbbe968e2d
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2023 13:43:24.5170 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HO+dPac8uTGjooJUfcEiLeU6uVI2sDDJIYfHlCxygftGQ7t3sN3ne0kflfC7QXoRGpamyTTBykj43KPOEftXjOMXsNLio44W9ZAH8oH0kuA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4619
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 1/9] drm/xe: Normalize pte/pde encoding
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
Cc: intel-xe@lists.freedesktop.org, Matthew Auld <matthew.auld@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Mon, Sep 25, 2023 at 03:30:06PM -0700, Matt Roper wrote:
>On Mon, Sep 25, 2023 at 03:10:41PM -0700, Lucas De Marchi wrote:
>> Split functions that do only part of the pde/pte encoding and that can
>> be called by the different places. This normalizes how pde/pte are
>> encoded so they can be moved elsewhere in a subsequent change.
>>
>> xe_pte_encode() was calling __pte_encode() with a NULL vma, which is the
>> opposite of what xe_pt_stage_bind_entry() does. Stop passing a NULL vma
>> and just split another function that deals with a vma rather than a bo.
>>
>> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>> ---
>>  drivers/gpu/drm/xe/xe_pt.c | 119 +++++++++++++++++++++----------------
>>  1 file changed, 67 insertions(+), 52 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
>> index aec469842471..afadd399684c 100644
>> --- a/drivers/gpu/drm/xe/xe_pt.c
>> +++ b/drivers/gpu/drm/xe/xe_pt.c
>> @@ -47,91 +47,106 @@ static struct xe_pt *xe_pt_entry(struct xe_pt_dir *pt_dir, unsigned int index)
>>  	return container_of(pt_dir->dir.entries[index], struct xe_pt, base);
>>  }
>>
>> -/**
>> - * xe_pde_encode() - Encode a page-table directory entry pointing to
>> - * another page-table.
>> - * @bo: The page-table bo of the page-table to point to.
>> - * @bo_offset: Offset in the page-table bo to point to.
>> - * @level: The cache level indicating the caching of @bo.
>> - *
>> - * TODO: Rename.
>> - *
>> - * Return: An encoded page directory entry. No errors.
>> - */
>> -u64 xe_pde_encode(struct xe_bo *bo, u64 bo_offset,
>> -		  const enum xe_cache_level level)
>> +static u64 pde_encode_cache(enum xe_cache_level cache)
>>  {
>> -	u64 pde;
>> -
>> -	pde = xe_bo_addr(bo, bo_offset, XE_PAGE_SIZE);
>> -	pde |= XE_PAGE_PRESENT | XE_PAGE_RW;
>> -
>>  	/* FIXME: I don't think the PPAT handling is correct for MTL */
>>
>> -	if (level != XE_CACHE_NONE)
>> -		pde |= PPAT_CACHED_PDE;
>> -	else
>> -		pde |= PPAT_UNCACHED;
>> +	if (cache != XE_CACHE_NONE)
>> +		return PPAT_CACHED_PDE;
>>
>> -	return pde;
>> +	return PPAT_UNCACHED;
>>  }
>>
>> -static u64 __pte_encode(u64 pte, enum xe_cache_level cache,
>> -			struct xe_vma *vma, u32 pt_level)
>> +static u64 pte_encode_cache(enum xe_cache_level cache)
>>  {
>> -	pte |= XE_PAGE_PRESENT | XE_PAGE_RW;
>> -
>> -	if (unlikely(vma && xe_vma_read_only(vma)))
>> -		pte &= ~XE_PAGE_RW;
>> -
>> -	if (unlikely(vma && xe_vma_is_null(vma)))
>> -		pte |= XE_PTE_NULL;
>> -
>>  	/* FIXME: I don't think the PPAT handling is correct for MTL */
>> -
>>  	switch (cache) {
>>  	case XE_CACHE_NONE:
>> -		pte |= PPAT_UNCACHED;
>> -		break;
>> +		return PPAT_UNCACHED;
>>  	case XE_CACHE_WT:
>> -		pte |= PPAT_DISPLAY_ELLC;
>> -		break;
>> +		return PPAT_DISPLAY_ELLC;
>>  	default:
>> -		pte |= PPAT_CACHED;
>> -		break;
>> +		return PPAT_CACHED;
>>  	}
>> +}
>> +
>> +static u64 pte_encode_ps(u32 pt_level)
>> +{
>> +	/* XXX: Does hw support 1 GiB pages? */
>> +	XE_WARN_ON(pt_level > 2);
>>
>>  	if (pt_level == 1)
>> -		pte |= XE_PDE_PS_2M;
>> +		return XE_PDE_PS_2M;
>>  	else if (pt_level == 2)
>> -		pte |= XE_PDPE_PS_1G;
>> +		return XE_PDPE_PS_1G;
>>
>> -	/* XXX: Does hw support 1 GiB pages? */
>> -	XE_WARN_ON(pt_level > 2);
>> +	return 0;
>> +}
>>
>> -	return pte;
>> +/**
>> + * xe_pde_encode() - Encode a page-table directory entry pointing to
>> + * another page-table.
>> + * @bo: The page-table bo of the page-table to point to.
>> + * @bo_offset: Offset in the page-table bo to point to.
>> + * @cache: The cache level indicating the caching of @bo.
>> + *
>> + * TODO: Rename.
>> + *
>> + * Return: An encoded page directory entry. No errors.
>> + */
>> +u64 xe_pde_encode(struct xe_bo *bo, u64 bo_offset,
>> +		  const enum xe_cache_level cache)
>> +{
>> +	u64 pde;
>> +
>> +	pde = xe_bo_addr(bo, bo_offset, XE_PAGE_SIZE);
>> +	pde |= XE_PAGE_PRESENT | XE_PAGE_RW;
>> +	pde |= pde_encode_cache(cache);
>> +
>> +	return pde;
>>  }
>>
>>  /**
>>   * xe_pte_encode() - Encode a page-table entry pointing to memory.
>>   * @bo: The BO representing the memory to point to.
>> - * @offset: The offset into @bo.
>> + * @bo_offset: The offset into @bo.
>>   * @cache: The cache level indicating
>>   * @pt_level: The page-table level of the page-table into which the entry
>>   * is to be inserted.
>>   *
>>   * Return: An encoded page-table entry. No errors.
>>   */
>> -u64 xe_pte_encode(struct xe_bo *bo, u64 offset, enum xe_cache_level cache,
>> +u64 xe_pte_encode(struct xe_bo *bo, u64 bo_offset, enum xe_cache_level cache,
>>  		  u32 pt_level)
>>  {
>>  	u64 pte;
>>
>> -	pte = xe_bo_addr(bo, offset, XE_PAGE_SIZE);
>> +	pte = xe_bo_addr(bo, bo_offset, XE_PAGE_SIZE);
>> +	pte |= XE_PAGE_PRESENT | XE_PAGE_RW;
>> +	pte |= pte_encode_cache(cache);
>> +	pte |= pte_encode_ps(pt_level);
>> +
>>  	if (xe_bo_is_vram(bo) || xe_bo_is_stolen_devmem(bo))
>>  		pte |= XE_PPGTT_PTE_DM;
>>
>> -	return __pte_encode(pte, cache, NULL, pt_level);
>> +	return pte;
>> +}
>> +
>> +/* Like xe_pte_encode(), but with a vma and a partially-encoded pte */
>> +static u64 __vma_pte_encode(u64 pte, struct xe_vma *vma,
>> +			    enum xe_cache_level cache, u32 pt_level)
>> +{
>> +	pte |= XE_PAGE_PRESENT | XE_PAGE_RW;
>> +	pte |= pte_encode_cache(cache);
>> +	pte |= pte_encode_ps(pt_level);
>> +
>> +	if (unlikely(vma && xe_vma_read_only(vma)))
>
>Do we need the non-NULL check part of this condition (ditto for the one
>below)?  With your refactoring, the vma parameter passed to this
>function should already be non-NULL, right?  In fact we've already
>dereferenced it before the only callsite of this function...

yeah... I think the goal of this patch was accomplished: to become
obvious we can't have a NULL vma at this point. I see you noticed it
later in patch 2 ;)


>
>Aside from that,
>
>Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

thanks
Lucas De Marchi

>
>> +		pte &= ~XE_PAGE_RW;
>> +
>> +	if (unlikely(vma && xe_vma_is_null(vma)))
>> +		pte |= XE_PTE_NULL;
>> +
>> +	return pte;
>>  }
>>
>>  static u64 __xe_pt_empty_pte(struct xe_tile *tile, struct xe_vm *vm,
>> @@ -614,9 +629,9 @@ xe_pt_stage_bind_entry(struct xe_ptw *parent, pgoff_t offset,
>>
>>  		XE_WARN_ON(xe_walk->va_curs_start != addr);
>>
>> -		pte = __pte_encode(is_null ? 0 :
>> -				   xe_res_dma(curs) + xe_walk->dma_offset,
>> -				   xe_walk->cache, xe_walk->vma, level);
>> +		pte = __vma_pte_encode(is_null ? 0 :
>> +				       xe_res_dma(curs) + xe_walk->dma_offset,
>> +				       xe_walk->vma, xe_walk->cache, level);
>>  		pte |= xe_walk->default_pte;
>>
>>  		/*
>> --
>> 2.40.1
>>
>
>-- 
>Matt Roper
>Graphics Software Engineer
>Linux GPU Platform Enablement
>Intel Corporation
