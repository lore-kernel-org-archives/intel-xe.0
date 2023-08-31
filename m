Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16142C83F10
	for <intel-xe@archiver.kernel.org>; Thu, 31 Aug 2023 06:53:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9E5910E58D;
	Thu, 31 Aug 2023 06:53:09 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC56310E570;
 Thu, 31 Aug 2023 06:53:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693464787; x=1725000787;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Y6AhtIsxHe8GdepH/oHddcNxYlD8vLXUTuIHJtAWDak=;
 b=mm3jr9dHOwpq3Bkd5mbbnjCw86M9YhqVF2jXglYyygYrWBDdyT1/hx+S
 g7tEV1OhzB4GkWU4DfAw+MIyZVBJMQg6zCl1SGiwlVm8GJOEpzmvJW5ik
 frzNMoeKpIAcy68d9KwhXNVjtKT/1LnD2wFbG53l6jDqcfklVaAUzhCTc
 Tb3SDWUOQXrtDiDZghXMo3AFRlCGm85NWvn6oIZK+uzifr33o0YyvfL7j
 7HtD9jnGieqkCDnJF+ekKWv9YZoirgbU4pFUbBhSUkSFMtBUfgXzKsMHX
 yt4CH/eZPdOYcJ1o5QFDi/vEQYJiSECd76ZkULesgnlI6aEP0RvNEoXKk w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="379585544"
X-IronPort-AV: E=Sophos;i="6.02,216,1688454000"; d="scan'208";a="379585544"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2023 23:53:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="732960662"
X-IronPort-AV: E=Sophos;i="6.02,216,1688454000"; d="scan'208";a="732960662"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 30 Aug 2023 23:53:04 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 30 Aug 2023 23:52:12 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Wed, 30 Aug 2023 23:52:12 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.103)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Wed, 30 Aug 2023 23:52:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hTj1fWRahd7d4xmdiLtashLxISHJogdazVmlYzGKmLp+ENyckdtF5wvCE8dzBf5o4qal9kY/NY5URbZ30NQbKHwdeE7YM845LSz6j0bCPDn9VwTRpSYVKd3XtGMAo9k+RV59K21Hp45Pzf/iRe7+5NyGNqnX79A8bMJAn2VbT248U8Hw4jYY4h321HeOXMytCCt4ftzVZo/CANAb7ALzoxjw29aoS5W4uykv6xSI9U1ofEr2PDISpN2m3JQkCSp0ToiTQO/2CubFrUfnaNat8v5B6cDxVvWQ4esWt/jyYwZaC7ACmxXIz6R1tKHtl+Q18rRJbHOjNElfiGlRfy0pHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7h5FgteydhbRMSu4ascqmX+rwDjMT7unm7zvQ4TfQHI=;
 b=fX1oEunpVUkXundZOqJMGFFtLh130NLgln7xokpyGQ85vlC/EBf9/5g+4VdYGqsilzIKYeF5gRI1CqQHguu6eMVklFDC3yXlJXF4e3wlrdrEwgxRCmWEaZXAx5Z8bBb1mksTqxKm5HFxLntswZ6lN+OQgV70XttS0pWemawJpW+VMsBTFHg36X/Non7aruBkxLzelM8+6t1AzE5drnxEmKZI9ZyTJGDGYfj5aSRAOnMuvoAUueNsFStcDZ/p1Earj6cHS12S6rjdClCRRwD2PzdaO0+z5PmptDIzjL1CLMXo68BIUptoyaakf4lFrrQEykQCul8SMrL/qjsQGFa81w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6974.namprd11.prod.outlook.com (2603:10b6:510:225::16)
 by CH3PR11MB8210.namprd11.prod.outlook.com (2603:10b6:610:163::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.35; Thu, 31 Aug
 2023 06:52:03 +0000
Received: from PH8PR11MB6974.namprd11.prod.outlook.com
 ([fe80::864b:5f88:8b9d:517f]) by PH8PR11MB6974.namprd11.prod.outlook.com
 ([fe80::864b:5f88:8b9d:517f%4]) with mapi id 15.20.6699.034; Thu, 31 Aug 2023
 06:52:02 +0000
Date: Thu, 31 Aug 2023 12:21:50 +0530
From: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>, <igt-dev@lists.freedesktop.org>
Message-ID: <ZPA4hgy1NnZFI371@bvivekan-mobl>
References: <20230829141107.1505705-1-lucas.demarchi@intel.com>
 <20230829141107.1505705-3-lucas.demarchi@intel.com>
 <ZPA3tuQCuZkPKntS@bvivekan-mobl>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <ZPA3tuQCuZkPKntS@bvivekan-mobl>
X-ClientProxiedBy: MAXP287CA0023.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a00:49::31) To PH8PR11MB6974.namprd11.prod.outlook.com
 (2603:10b6:510:225::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6974:EE_|CH3PR11MB8210:EE_
X-MS-Office365-Filtering-Correlation-Id: 79ca3df9-b06a-4555-680b-08dba9eec7c6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iDE6g3whXoaRoUHGwnbY99iPOE63t+CuAO3aRz0J4wbYxANWt/PWUBAGTXaOlT/Ek4q8RIO3IhTJ134d/Fmv5EoULr2DoKk3fCQF1rrJV9GvDSGAI0BS7fTBXoOxGPLomgwRtoIq2kIDv4wFPm6gQSD5Yr+5Yf5CLgzVpdf9m1Hi8x0IsPhTNmkzNprd3jGtpf2frFAYxujZM235eIf9tPOITtYhdYTkFWgwm6wJ2y8fek100vrXy6YUbSkXn7CW7DK4nCkqJ/yCOaJaNwWDy6JKvSzRWp9YwHpfLEcLhyIFNDuj+d5mV+xSflAeSowuYePuT3/p2Bnz5r4OLQSgcwiLuKdmnCc31hw2nc2c/E8XF4aSNeBTiyYLOoR192O16As5OM4VaHtmo67+vNNum9hlwcXWzNVxtvfZ9YrRq10e6DxRODxUknpSG2zyApQOKy/c2b5ueL8lNSnymG9xR4am21Ul0Qwt9WfW3pkeKRc+hscQ1Dj5uGlOFj3NmyG1wtQ1XpTgg1rLlmDnvvZztwbHfSiVZK9OjpItcvpC4SBySUuCKO/vF5MGxxcaATjj
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6974.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(366004)(39860400002)(136003)(346002)(396003)(376002)(451199024)(1800799009)(186009)(6512007)(9686003)(316002)(38100700002)(41300700001)(82960400001)(5660300002)(4326008)(107886003)(33716001)(44832011)(8676002)(86362001)(2906002)(8936002)(450100002)(6666004)(66556008)(6506007)(66476007)(6486002)(478600001)(53546011)(66946007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aTJ2RTFPbDNqZDF4Q01CMUU1STlKclhLbkJMZVJHYlQxTkprek0wZy95NDNQ?=
 =?utf-8?B?MWwwdm9wK0NpZjN0TlVKcEc2dDR2OExFVzU2a2M2Ni81SGFPWjFqMUNpYThV?=
 =?utf-8?B?OFN2T2JNVjVvQnpydTJqNlZpRFlKYUU2aHJFNytma256REI4YVJveW1nSGZP?=
 =?utf-8?B?Z0dyeTEyM1NJTlJia2hLblRmRHRXb3BtUFQ2dUZwS1FHbVZsbG9pUVIwejVh?=
 =?utf-8?B?L05KblIzazNJWXdaWlZQNkFka3JTUWFyMnk1Q1F3LzhITTVSTytBd0dlSDVo?=
 =?utf-8?B?dEVqYmdwNW52Z0hMZHVaQW5DeXhZaXNzVE9WRW5YVVJNWnRGRlRKanBFaHNm?=
 =?utf-8?B?djUweWMzMGV2b3FTZWVlaU9PTys4NGRXbVROV0V3UGhoZ1pTUFVEWXc5K0U0?=
 =?utf-8?B?VnpNaWFEbG1yUjIwbHhRNnlKTk5YK0pneVNvblZDcUtZaDRmRzAwc3JDNjhL?=
 =?utf-8?B?UHQ3RW9vdnVOMmFVYnE4dGVFMWNiOUxjT2ZSSGVxZVhKUTdEa2N4STk0NEh2?=
 =?utf-8?B?UWNCTXpEQzF5MmF3L1hUcDloZkcvS3BHRnBVeTJqdTQxamdwNk0yYlNzY0l2?=
 =?utf-8?B?cTNsb2RmMVlDVDdkaHpiQmRKdWNpMUdtYkpWdFk5RGJZLzlCSk5rMUFER0xS?=
 =?utf-8?B?OHJncDd0RDlQdEo1eUgzTHNqYnBVNDN6ZUxKdWFBSWhyeHpEQzZKRnJKNlZl?=
 =?utf-8?B?YVVBQUQ4U0s4MS9GNFFua29jWERRVDhqN1RCcnVRL0lOYm9RbXF3M3J6ODdx?=
 =?utf-8?B?Vmd0QStvcEVqWVJmTnlFcVh6cTZjSUluaUoycVhjV2M4QWFsR01MdG9GT0ZQ?=
 =?utf-8?B?Y2g1dUdJMCtLcVpZSHFFM3pPSHEvK01kTTlGZDFPQUhWNFNHKzU4WDBmV20r?=
 =?utf-8?B?SlQ1eE80U21CaDczUlR5L3hTOVVrNHRXNzlsUklpL1BkTDNkMzFRenpFbjV4?=
 =?utf-8?B?ZHNxa3FrVUJUL1JPUGgzLzlNRE8rY0dGMWM5c1RvZkxROE43SlhjNHpUUzVQ?=
 =?utf-8?B?QWJuOE96cEcreHQ3SW5RMmZwcjJiNDZSamNBUUpNeStwd3RsYkZhTE1hVEdy?=
 =?utf-8?B?Y3p5KytoYzFRVGNyeDdJNUR2c3Z3TG5qdUJYaVQrK1prQkROajZXbHd6eUhu?=
 =?utf-8?B?NVpxbVZyUWIrL0xqaHdDSlFwNTJaM3RON20vODhreHVVcEdydGk0Rzl5cFg5?=
 =?utf-8?B?eTUrNUlmaEd6STdNamNUMFhEWjZxZVlCbGh0SFhzVWdxK04zenF3Wjk0Q1dJ?=
 =?utf-8?B?QURpQUxjSHpxWGNtdTJpOGtuNzVmMW9iSFJSTWNZcWVqclhoOHNaQk5nMkJn?=
 =?utf-8?B?Y1FTZXh1QmFnY3grNWxMT3gwVktuYnlHRjBEekRKOEpUaXBPZEVBSFYyeGEr?=
 =?utf-8?B?RFFPSEllZEF5M214UUN3MWZ1c1RhZDU4dlM5Qzdud1p1VjVoZWVsWmFCQjc1?=
 =?utf-8?B?WEhOaU4rc05LYmM1RTEwZkdieXRXN0xjNExzOGdTL2xUOERhbjBqV2w0ODhT?=
 =?utf-8?B?ZWw5SmJnZ0RIQitOb3ZSU3pvc0ZGc2xjK21XTXo3c0RrSWRxbmx1M2RmaXg1?=
 =?utf-8?B?Tm15R0Y3MzNSVU9iNGtDazMrSndyUVRtVlErTXI4Uk1ZN2RxODFvQXN5L0dq?=
 =?utf-8?B?ZTllb1MzUmVQNm52QS9XNTdLdUZjVVhjV0xpNkp2dUhjbkNaanRYRlRuVi9u?=
 =?utf-8?B?SnFGS2xyMXA1RnFRZEg1Tmp0VHd4Tlk1d0k4dzdnRVh3S0xXQitzcjVIRTl2?=
 =?utf-8?B?RnQrcXEwTWZFR1pXdTZsbEh4UnBhTGUwSWFqNG5hb2FWUGVTRlQzTzh2YWRR?=
 =?utf-8?B?T2VFc2xMblo4UG5UOXNHWVZ5OXBVSGRycmJLR2ljai9jK1ZzcW4wYUhhV1dC?=
 =?utf-8?B?cjhZM1pENStlMVBCWnN1UUtNVHBtWGljSG5Ka2Q3dmowWTIzcE51SWRYTXFy?=
 =?utf-8?B?dHh5TlZDaHZzY1p6cWh1cGs0L1d3MkZPTHc3dG1ucEJlRWtqM3Z1czY5WU9N?=
 =?utf-8?B?aUk2Qjg2ZmhFOEcxOTRvbUpuQWNBYUNKaUhCS3FYOHhkL1FVeFRBc01BODZ2?=
 =?utf-8?B?NkI5dTVQQ2ZMWDU2TnkxU3VRaWhMMllzNmxldjV3NytucGl6NmJTK3JtQmxk?=
 =?utf-8?B?VEVLV0w3aXNRMEc1MjhJYld0VmZhSjZmVmJDR1kzSmhRYXdTSSs5WnRlaHdD?=
 =?utf-8?B?WWJtSVZWOHdTRVhWRUQ5YkFKTlhlY01OVEhMQjM0cTFtUUlkVHZlaHZuNE5G?=
 =?utf-8?B?RVNqamNoQVhqUkE1MjNucnNRU2xxY0h6V3gwQVRGNXpwN2xOODJza2JvSmRM?=
 =?utf-8?Q?oicVYOTZkE6yA3+lTr?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 79ca3df9-b06a-4555-680b-08dba9eec7c6
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6974.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2023 06:52:02.3047 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oFGiQHdVqkNCuNHuKwm5CYBEod8giG06A8u0OQsaUa49c0z8jYo66eBNnvW2/sTHjTOm1VTVVpq42JKLQ8n1udZa0pAnrdya59/WM5IPOHgmAdW9GCTJtjQTbPCdpHfq
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8210
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH igt 2/4] lib/intel_chipset: Add Lunar Lake
 support
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
Cc: intel-xe@lists.freedesktop.org, Swati Sharma <swati2.sharma@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On 31.08.2023 12:18, Balasubramani Vivekanandan wrote:
> On 29.08.2023 07:11, Lucas De Marchi wrote:
> > Add basic definition for the Lunar Lake platform. This uses the PCI ID
> > from the xe_pciids.h which has a macro in a slighlty different form.
> > 
> > Going forward we could also trim down a little bit the the info struct
> > like was done in the kernel, relying on gmdid and IP version checks.
> > This is left for later.
> > 
> > Cc: Swati Sharma <swati2.sharma@intel.com>
> > Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> > ---
> >  lib/intel_chipset.h     |  5 +++++
> >  lib/intel_device_info.c | 12 ++++++++++++
> >  2 files changed, 17 insertions(+)
> > 
> > diff --git a/lib/intel_chipset.h b/lib/intel_chipset.h
> > index 84cf1799e..52b15ccea 100644
> > --- a/lib/intel_chipset.h
> > +++ b/lib/intel_chipset.h
> > @@ -46,6 +46,7 @@ struct intel_device_info {
> >  	bool has_4tile : 1;
> >  	bool has_flatccs : 1;
> >  	bool has_oam : 1;
> > +	bool has_gmdid : 1;
> >  	bool is_mobile : 1;
> >  	bool is_whitney : 1;
> >  	bool is_almador : 1;
> > @@ -90,6 +91,7 @@ struct intel_device_info {
> >  	bool is_alderlake_n : 1;
> >  	bool is_meteorlake : 1;
> >  	bool is_pontevecchio : 1;
> > +	bool is_lunarlake : 1;
> >  	const struct intel_cmds_info *cmds_info;
> >  	const char *codename;
> >  };
> > @@ -203,6 +205,7 @@ void intel_check_pch(void);
> >  #define IS_ALDERLAKE_N(devid)	(intel_get_device_info(devid)->is_alderlake_n)
> >  #define IS_METEORLAKE(devid)	(intel_get_device_info(devid)->is_meteorlake)
> >  #define IS_PONTEVECCHIO(devid)	(intel_get_device_info(devid)->is_pontevecchio)
> > +#define IS_LUNARLAKE(devid)	(intel_get_device_info(devid)->is_lunarlake)
> >  
> >  #define IS_GEN(devid, x)	(intel_get_device_info(devid)->graphics_ver == x)
> >  #define AT_LEAST_GEN(devid, x)	(intel_get_device_info(devid)->graphics_ver >= x)
> > @@ -236,4 +239,6 @@ void intel_check_pch(void);
> >  
> >  #define HAS_OAM(devid)		(intel_get_device_info(devid)->has_oam)
> >  
> > +#define HAS_GMDID(devid)	(intel_get_device_info(devid)->has_gmdid)
> > +
> >  #endif /* _INTEL_CHIPSET_H */
> > diff --git a/lib/intel_device_info.c b/lib/intel_device_info.c
> > index 5d53d2906..86a8b3650 100644
> > --- a/lib/intel_device_info.c
> > +++ b/lib/intel_device_info.c
> > @@ -504,6 +504,16 @@ static const struct intel_device_info intel_pontevecchio_info = {
> >  	.cmds_info = &gen12_pvc_cmds_info,
> >  };
> >  
> > +static const struct intel_device_info intel_lunarlake_info = {
> > +	.graphics_ver = 20,
> > +	.graphics_rel = 4,
> > +	.display_ver = 20,
> > +	.has_4tile = true,
> > +	.has_gmdid = true,
> 
> has_gmdid should be set true even for Meteorlake. If not in this patch,
> in a follow up.
> 
> Regards,
> Bala

Other than this comment,

Reviewed-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>

Regards,
Bala

> 
> > +	.is_lunarlake = true,
> > +	.codename = "lunarlake"
> > +};
> > +
> >  static const struct pci_id_match intel_device_match[] = {
> >  	INTEL_I810_IDS(&intel_i810_info),
> >  	INTEL_I815_IDS(&intel_i815_info),
> > @@ -607,6 +617,8 @@ static const struct pci_id_match intel_device_match[] = {
> >  
> >  	INTEL_PVC_IDS(&intel_pontevecchio_info),
> >  
> > +	XE_LNL_IDS(INTEL_VGA_DEVICE, &intel_lunarlake_info),
> > +
> >  	INTEL_VGA_DEVICE(PCI_MATCH_ANY, &intel_generic_info),
> >  };
> >  
> > -- 
> > 2.40.1
> > 
