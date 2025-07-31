Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CDDFC87FCC
	for <intel-xe@archiver.kernel.org>; Thu, 31 Jul 2025 20:38:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C614B10E7E5;
	Thu, 31 Jul 2025 20:38:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="j7FKxIr8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECDED10E7E5
 for <Intel-Xe@lists.freedesktop.org>; Thu, 31 Jul 2025 20:38:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753994325; x=1785530325;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=2re1pZRpO7H1KbY4VvmOEBcDhI3/zzHLsx4MHKjZVmU=;
 b=j7FKxIr8AUuLA5qjxZGk8oQ+hSQL5KJSJyzBAOyn86nqQNhxKbFaSpNc
 G1FJJitC0ltHYivQHyM/Aeg/cAaTFrp8EwkzvG29XkmlJtAkoly8ukazL
 diW+gkt1dEQ5AIRi/sFpxjKk9Cd8p7Tq0zhgP98bVuBdCY1VM18gyZYTg
 cHrzLfHjf/3uh74i7RZba+dMy3s8ZTeCRqf1ptloViNjZTok8dadKGutX
 WGm80b5SM5QxybJLWPneQs8aG2Q5Ju2ec6q0JmVv8RUz3xgJ6Q22VEYBU
 ijSUJ71IiKG5inohIRQEqLs0vutFYrZPPAGbBR5fAs7TS2Dk1QZQWnO7k A==;
X-CSE-ConnectionGUID: YLRVIjXMT9C2TKCP1YVCZQ==
X-CSE-MsgGUID: dSdg/mU1RQqOpeI8+hqvMA==
X-IronPort-AV: E=McAfee;i="6800,10657,11508"; a="73919618"
X-IronPort-AV: E=Sophos;i="6.17,255,1747724400"; d="scan'208";a="73919618"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2025 13:38:45 -0700
X-CSE-ConnectionGUID: WRxhZ+NaQVScjY+W9IXHMg==
X-CSE-MsgGUID: ySy4NIavTZi1KJmJILWeLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,255,1747724400"; d="scan'208";a="163731465"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2025 13:38:44 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Thu, 31 Jul 2025 13:38:44 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Thu, 31 Jul 2025 13:38:44 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (40.107.93.73) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Thu, 31 Jul 2025 13:38:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jeEuaFB79zGEBFTCD4KaUHmuizWHjWSjdH+TtojmYqmLEMabSZPjLDfJaHRHQ/mtBgemkJ3iIGn5e8UiUC6qiwNh2fqS4Utv4plSV8vP3z7BmEOeySgmTjgK9gntHDgZHojPD+8PdG4WITv2PiguAeJfahijkisq5+uDH6zy3ps08FumoP4iVQll0JAT2955XWdj976SE/cZv9KlJ8S1aHh9za17lYYQPmWYiQXAG3EnTYJTvpVz6OdTdWlzh0V15VeGZp9yb+OOFyWCaPOYHzqmniXCyZTjxxsOpRsFXLhg8CDwf6NdBfuAR77ea/QD0S6M2gb/WbAPaAnTpbwiog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AQx66iSLD3isjXx+7BQJK3ihBSTCx4gyhw5OGNvF0k8=;
 b=lf9BZIg+IURoKVlWuhORgF1lbtzwjpHmVYcH9dAaPdB/6jAzXSdmEUFDzhjOpbKHUnuu9LCLEB5ytlo+rv6RhUjZCKTu6k7s9nz2/WYus9YAFycw1Dp2d0VOpOSoadB/4DbVrov/cBtXAubgIolKxbUiRELRTh+/4jpdbx1ZQqoS+QETMriAM24KPCHOucleS2/xSNKsyrv84KFpS5GbIfJfCttJuVysqq9aXoXE+J80sEMTBHPSCELgS51P2dr4P6xzgUT890OeprRcyTt0enKso1AFqUDTmZl8ptJUwHWcCkO6Xsiy2oaTF5Sjg3j8pbdHW99JJP6P6EKK0A9uhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6391.namprd11.prod.outlook.com (2603:10b6:930:38::21)
 by BL1PR11MB6001.namprd11.prod.outlook.com (2603:10b6:208:385::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.11; Thu, 31 Jul
 2025 20:38:41 +0000
Received: from CY5PR11MB6391.namprd11.prod.outlook.com
 ([fe80::d1d5:6fa6:9a2d:92e2]) by CY5PR11MB6391.namprd11.prod.outlook.com
 ([fe80::d1d5:6fa6:9a2d:92e2%7]) with mapi id 15.20.8989.013; Thu, 31 Jul 2025
 20:38:41 +0000
Message-ID: <cf140667-a419-4798-a127-b8a797f2e159@intel.com>
Date: Thu, 31 Jul 2025 13:38:38 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] drm/xe: Allow freeing of a managed bo
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <Intel-Xe@Lists.FreeDesktop.Org>
References: <20250725002111.3906267-1-John.C.Harrison@Intel.com>
 <20250725002111.3906267-4-John.C.Harrison@Intel.com>
 <ab23671a-5f81-4509-a967-fb5ea08e146c@intel.com>
Content-Language: en-US
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <ab23671a-5f81-4509-a967-fb5ea08e146c@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4P221CA0029.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:303:8b::34) To CY5PR11MB6391.namprd11.prod.outlook.com
 (2603:10b6:930:38::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6391:EE_|BL1PR11MB6001:EE_
X-MS-Office365-Filtering-Correlation-Id: 161d67d4-f5cf-4641-3dcc-08ddd0723c2a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?d0dmZnRDUmpxV0Y2UVM0QmVUc09raVlVMjR2MzVJVVpFclcrVTV4NDZ1TlR4?=
 =?utf-8?B?UkorVDVTMFVKbmI3TCthY0xQQUFSbUhCWmYxelZ5dVhnYlJkZS9aT1RHTTcr?=
 =?utf-8?B?WGJWYWtrQjA3SmNNdzBra0V0Yis4N09TOHZ6bnZEYStQcGRZck5KYk9NUCtW?=
 =?utf-8?B?cy92OVc1VEFxeHV1YlFseEg2RldTT0dSRUd5VEpvRXBPQXRjTytuYjFmRTBP?=
 =?utf-8?B?TGs3LzZOS0M5UjgzREdUOFBwRGhvUE0vRnZwVGIybE5QM1pvSUZWSXpkdHcz?=
 =?utf-8?B?VE4yVWV3ejRVZGpZOEJOQ2w5cmZuKzAwY1lsL2JJQVNUUkVMTGZ2Vkl0Wjd4?=
 =?utf-8?B?RlVXRk1EK1dFM282a2JXd0JVQlJaNENZNDRBUmVZTUFzd1FOWmJCR3E4cEdP?=
 =?utf-8?B?c29DcDdxZ29CQW9xa0t1czdZbmVOa0VicFd3OTBnTks4TWRwbUg4ZzY2akVU?=
 =?utf-8?B?ZS9xZVdXakdud2FUcm52R0dzeEZocUM5alRETS9ocXVLdHlpOGVQcm9PSVRl?=
 =?utf-8?B?clh3eG9aUVFFZHdKb2tYbng4d1hTb0RxTi8rSmd2OFRPNTJsNXpteTM1bGV6?=
 =?utf-8?B?Q2pIbUNwazNOeUhEV2dzMUwrWklZVGloV2J5SmtKS1hNWnY5SGRXaTdZR1Zh?=
 =?utf-8?B?L1dsWWluaXovNjQvOFJ5em5MaDVVU0JvWXlXNmpsYkZkL1U1MHY1MVJTRDlj?=
 =?utf-8?B?OG1nRjRTa1VKekZzMkVqTDhucUdhYmdNYVRRdnk2OGxVWmJxWFFqeVNvenl5?=
 =?utf-8?B?ejdjaVZ5OEdxWWpjdTlsZTJDZGNLZ01odXlKaXNranRmREEyVUV5dERCeEZS?=
 =?utf-8?B?cHRFUW9YMkJZbTJ4aGhjMklyVi9kc3Uxb04rWVkwb0lqNjdqMjY0aVBRdkZP?=
 =?utf-8?B?R3NNMkZuNGxrQkdUZkRrcWFoNDNBZUd4dTJTczdxMUFBWHU3c3hjUS9NRlJ0?=
 =?utf-8?B?djFrT2dpZjdEbzZFSEpFUVRabnJtQWlHa3NMQ3djajEwdnBZQlh0NmhyZTFx?=
 =?utf-8?B?TUV2RnhkYVM1bXFBNEJnVkVSc2ExODFFcWR6VjdiSGdRNC9yV0NxVWcwc09x?=
 =?utf-8?B?UlFTNVMyYlZBN3ZDam1sQVhRVjVQeUxtdUNiRnNWWExtM0hoZEFmKzBOTXRr?=
 =?utf-8?B?UER3N2VuNzZqZXFvTHVqYkV1ZU8zUTNFYkFGWGdDMm9DUU1ZZGEyVmJ2YmFl?=
 =?utf-8?B?ZnJDWGRMcVZ4UzVPZEFMUGVQMlhzaWdZOEtMTFBlQWM2NmhNWTBSY3pWRklN?=
 =?utf-8?B?Wm1YY1VVQVNtR2Y4aGlwcUhwRWEzZHk1U1ZMdnR4dHc1V042b0hBMzQrQW0z?=
 =?utf-8?B?NXp5MHUzTE1xMkJyNVQyRDZiMmFNOWxtQTJpbUtnSEZnd1hUTlV1VDRVODJl?=
 =?utf-8?B?TVVvSUJWR1ljeXdmQTlTNkJUck1ueks2Q2NoZXlRbUhnaUlmYmhqM3M1aVVS?=
 =?utf-8?B?cHZScVd3Yzh1YjNpbUI4dXdZL21uc3J2MXJtNGhINWs2ejd3cFBWU3F3WDRJ?=
 =?utf-8?B?WDJRcVlFRSszd2RzdWJFbUFvUHFZaU9ORGJoYzZxY0hldVNJY1NpU0todlg3?=
 =?utf-8?B?ZmJ5b3BTT0NwN2cwdk5VU050R3FCYkhVWWl3OEtjMmdFUkthdHJOengyUHBv?=
 =?utf-8?B?cDNVekNOcmU0bGh6T3pzVzd5ZlVaVEJFWVVkay9tWTl5OU82NUlEeW8rK2x4?=
 =?utf-8?B?NnNkUlVvNjlqQVJCSS9ndFIreE9YVzBvNFJ4SzNMMjByei9rd052NlJ3Vmxq?=
 =?utf-8?B?MlpiNzg3dXlQUzBNNnRqVCtucmgxazFoL0N2NklKWk45YjVrL25Zc1czUDE2?=
 =?utf-8?B?UlZ6Z2g3bnUvRG9JQVg0L005OWpUbzIzTXZISHlSYXQ5NzJ6bDFDVjUvUGdS?=
 =?utf-8?B?dkhud1huaTZqSDhEMXV6b1pKcWxSaC9Mc3NKRjV2UUhSYmFZLzhQdnVvRy9Q?=
 =?utf-8?Q?pylfphfA7ME=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6391.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QklxNmlUYlVMbDBOMmpta0Z3VmcyVU91NnhGYnZwNzh0bzVkWnRTZ1hiNzJV?=
 =?utf-8?B?N2VENVk1TkNTOEc2VWVobUJkVzNvMGNodmpTdVE0NkkrY1FBS3pnSEZFbFVn?=
 =?utf-8?B?SUlUYXNCY3BmQld4T1A4WUJIMmoyaUxZbEhleFJ4VkVnMitFSjFTMnFnL2lq?=
 =?utf-8?B?T2JjeE9PNnVocE43M3ZoOGU4a1dPclhzdVI5NDdYWXRpSnVBcm15N1UxY2Fl?=
 =?utf-8?B?eFJuc0pDYUVtaGNJakJZU1JOZDh6RnR4bjEvWHIxWjVBajNXamMzeTJ3TXJ5?=
 =?utf-8?B?Y2hqejQvYWYzR3FtUkM5RFkyTllTelh6NFlZelIvaHVOY0VoWjc3RC9UYjFK?=
 =?utf-8?B?ZDN2eDlrNHZOemcwQStUeXNQTm1EeWJPbTVEWUExeFZpY3F6a3pEYytiVFpx?=
 =?utf-8?B?Uk91bWFxNXViY1J6cEovS3V2Q1IyM0g2SllEUm9LNmg4MnlrZXZMV3BwK08x?=
 =?utf-8?B?YmYxWHFrWU1TdFR1NjNaelY1a3c1ZDJ5ZnRqbjQvUmhVUzJJZmM3cDI0bEtT?=
 =?utf-8?B?R3R0UHdZYlEyZm0xVzRzbVlzMWRqaXFyVDJLdXVlVk15dVkvU1JuWE5sOUp3?=
 =?utf-8?B?UEFRQUtoZWNUQVFWL2ZMclhvaHl2Q1JTYWQ2TTBhTktMSGx1MUZGMzlURkpw?=
 =?utf-8?B?cG9WTS9WcXM5TnNqTDNtVnNBMDZ2M3dDOW5MTHhiYUNvcU5SNDVncUt1ODB0?=
 =?utf-8?B?WitGWWxnd24xcmhrRGZyTjZwTGkwQmR2UGlCQ2c1a0gvUmdjQWJJYUFZL1Zj?=
 =?utf-8?B?SHZ1YThoWDZrZ1VVcmZXQmt5RnFSYVZUaFA2VUtERjgzZjN5dUk3VGo4TkxN?=
 =?utf-8?B?akllR1JOWDFaVyt3cUlKQy9sWGhUN2lnL3VuM2xLSm5RaTlPMHFIM1ZjenN2?=
 =?utf-8?B?R1QvNjduUkUrMUFoOURGVDJMMkZOU1k0bmZRd2xPK3p5ejhjck9LSThsbHdT?=
 =?utf-8?B?dmJ5WXdoWlVaeEJtQUIrZ3Y1bE1UdmJxZmQ2MDBic1gxNHBIaVhmNHAyeVRx?=
 =?utf-8?B?OWZCLzlzNmV4VnFvc3lQVVZoWVhZYlJnS0J1NjNrdko0dy9aRVIvd1M3UHJD?=
 =?utf-8?B?bzJtMzRVU09QaExEK1EwZzNZY3BqeUh3NlhOanMzU091WDMxMnFaV2xaZlNH?=
 =?utf-8?B?YVJvT3JuM1FHTWw3WmptZTdXVVZlalBuS1ozWXEyVVZNVlJsR0pWWkg1UGZE?=
 =?utf-8?B?MUdDSXVJcnplSW9kM055OU1PYXVVVWNBN3hMVGdOdTl2VEJmaWRhejF2aU1J?=
 =?utf-8?B?UWFWY1ltMldsWEJzQjltY2Q0cllTWEtQbDdoaUMxMEs1ZGt0VEVrZ0Z5c1ZZ?=
 =?utf-8?B?VWwycW1GdE0zNGJpKzJLMFF5ZDNTUjR2d21ZRWpRRzdFcjNHbnVLdDlWZG9h?=
 =?utf-8?B?UTQ3WVFUTE9taWtGVGJWRjlMWWg2VzF1TFlLcXUrUXJ0a0hBdUQ5WHRnNkhl?=
 =?utf-8?B?NG9rTjZnc2FnV2RvMHoveW51YWJYak1DMjh6MW1YOWp1L2hNU1ZmQWx6NFQ0?=
 =?utf-8?B?aHhKVFpnamZlNjdUaVJzcGFTaWcrTktSNTFwWGRlQkZ3UE11Zmwyd0tNUit6?=
 =?utf-8?B?WGcyZ20wejVMU0pBMEplT1dyV0ptMHc3anFzbVRucXBxZXpRMTNTZ2NxSUpi?=
 =?utf-8?B?elA4NTVzQWZLUG9MaGRjR3A4RCtnT1pCb1B1QXA0OWs1emVSNnZ1Q1F2VDVE?=
 =?utf-8?B?K0Fnc1oyUTZzaWpRUGFmQjFSbTNvREk5SS9TcFRJYjBuUysyRyswdTJNTUZS?=
 =?utf-8?B?SmQwNjR4d2sxcEE3UTlwblVKb0NLMUZwM21obmNneHRlWXBCNzc3eXl0SW9N?=
 =?utf-8?B?cmVWaGlUMnM2MGk5bm9ycmduT0sra1pVQWxjQnEwLzVXVm9oMGdGUkxNZER5?=
 =?utf-8?B?YkNwcUdWd2xNTGlsK2dFaW5KOWJFN3ExOHY4RHlIWlJEVDY2K1V6M1lZaGFi?=
 =?utf-8?B?L1UyU1k5Uk0wa3RoL2xOR3FFNENGL0ZtK0tZSm13YlQ5SW11aEhMamtlVitC?=
 =?utf-8?B?MDVaWCtXMDZmb2h0SW9JRzE2MHp5Z2ZLaklEWDR3bnIwQ0lwQ1VSS2dUSjJS?=
 =?utf-8?B?T2tHSjFWdFpjbU1iUHVpSExoNERobCtPYldEQk1UT3JKWFdSMlpldlYzanU3?=
 =?utf-8?B?RDE5dmI2TGhCR01pRldMTGZhcjhUaXpXeDZuTnhGZGNQQXlEbmRReEo5VHI0?=
 =?utf-8?B?elE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 161d67d4-f5cf-4641-3dcc-08ddd0723c2a
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6391.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2025 20:38:41.2938 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /C7NwQe2n6u4AdvIkmDzCbghzQDOi6sO3NSPqUtzs7lgPT0m8MqACTTNbzPJDoo34RO8MjsR+AH9K2LlwxaOiarlFJF3l1S/h+YbMubI2oo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB6001
X-OriginatorOrg: intel.com
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On 7/25/2025 1:25 AM, Michal Wajdeczko wrote:
> On 7/25/2025 2:21 AM, John.C.Harrison@Intel.com wrote:
>> From: John Harrison <John.C.Harrison@Intel.com>
>>
>> If a bo is created via xe_managed_bo_create_pin_map() then it cannot be
>> freed by the driver using xe_bo_unpin_map_no_vm(), or indeed any other
>> existing function. The DRM layer will still have a pointer stashed
>> away for later freeing, causing a invalid memory access on driver
>> unload. So add a helper for releasing the DRM action as well.
>>
>> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_bo.c | 5 +++++
>>   drivers/gpu/drm/xe/xe_bo.h | 1 +
>>   2 files changed, 6 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
>> index ffca1cea5585..472cadcfc4dd 100644
>> --- a/drivers/gpu/drm/xe/xe_bo.c
>> +++ b/drivers/gpu/drm/xe/xe_bo.c
>> @@ -2222,6 +2222,11 @@ struct xe_bo *xe_managed_bo_create_pin_map(struct xe_device *xe, struct xe_tile
>>   	return bo;
>>   }
>>   
> please add kernel-doc for this new public function
None of the xe_bo functions have kernel-doc :(. Someone needs to 
document the whole lot and I am definitely not the right person to do 
that. I don't really know what the doc for this function should say, to 
be quite honest. E.g. why is it _no_vm? This code was suggested by 
someone from the memory side (I forget who, it was a while ago) and it 
fixed my problem so here it is.

>
>> +void xe_managed_bo_unpin_map_no_vm(struct xe_device *xe, struct xe_bo *bo)
> do we really need xe? we can get xe from xe_bo_device(bo) if needed
I don't know. Maybe? Some way of getting to the drm.dev object is needed.

>
>> +{
>> +	devm_release_action(xe->drm.dev, __xe_bo_unpin_map_no_vm, bo);
>> +}do we want to use this function right away in xe_managed_bo_reinit_in_vram() ?
Is it worth changing? The point is to provide a way to do this from 
outside the bo code. Internal code can do what it wants directly. And 
abstracting a single line of code into a function call wrapper around a 
single line of code seems more like obfuscation than simplification.

John.

>> +
>>   struct xe_bo *xe_managed_bo_create_from_data(struct xe_device *xe, struct xe_tile *tile,
>>   					     const void *data, size_t size, u32 flags)
>>   {
>> diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
>> index 8cce413b5235..72f4348d0d52 100644
>> --- a/drivers/gpu/drm/xe/xe_bo.h
>> +++ b/drivers/gpu/drm/xe/xe_bo.h
>> @@ -122,6 +122,7 @@ struct xe_bo *xe_bo_create_pin_map_at_aligned(struct xe_device *xe,
>>   					      u64 alignment);
>>   struct xe_bo *xe_managed_bo_create_pin_map(struct xe_device *xe, struct xe_tile *tile,
>>   					   size_t size, u32 flags);
>> +void xe_managed_bo_unpin_map_no_vm(struct xe_device *xe, struct xe_bo *bo);
>>   struct xe_bo *xe_managed_bo_create_from_data(struct xe_device *xe, struct xe_tile *tile,
>>   					     const void *data, size_t size, u32 flags);
>>   int xe_managed_bo_reinit_in_vram(struct xe_device *xe, struct xe_tile *tile, struct xe_bo **src);

