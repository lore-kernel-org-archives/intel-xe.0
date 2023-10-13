Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65B2CCDB47E
	for <intel-xe@archiver.kernel.org>; Fri, 13 Oct 2023 22:04:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BFB010E071;
	Fri, 13 Oct 2023 22:04:50 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8883D10E071
 for <intel-xe@lists.freedesktop.org>; Fri, 13 Oct 2023 22:04:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697234689; x=1728770689;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=3hW4YKf0o4Mb2GPwAqvkQNDnLuNXC6EtAum0dKLVAk0=;
 b=SvDbxYIdMAkLaQ/+AzEmNba6/zT9jmo4Ha49f8ifNfIYS8XCCQLQfPHD
 tPOEVeCW7hiXYfEKShW9dPWx1gqHUO+ewZ3iYW3CXeoyarm4W52ShnUFn
 pBC3GUdU2XEiXxIB1EjHRrDCEwiWErBOD1qZbjfZoMoEUwrmj3gbRmzFi
 Mk95C6x5LyAVV3lhTP937+d17jepoMSmry3L6XCao+avEtL41FVuyd/WN
 99mWNUTneTAy+KGKG6qWyA1/HsgDOdbP2+aUZHPkc2dmhz/O2svCqWB2z
 z41zrTxxD6UxFntm+fvgaHG0uf6On5VVhrSsCIQk6Qzvl4rt4uGvRsq2t Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="3883356"
X-IronPort-AV: E=Sophos;i="6.03,223,1694761200"; 
   d="scan'208";a="3883356"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2023 15:04:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="1002123787"
X-IronPort-AV: E=Sophos;i="6.03,223,1694761200"; d="scan'208";a="1002123787"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Oct 2023 15:04:47 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Fri, 13 Oct 2023 15:04:47 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Fri, 13 Oct 2023 15:04:47 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Fri, 13 Oct 2023 15:04:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=krJhXxp70y03AbE99TIlhLZB8G59cFS6BOOl174X8OfyMl8xuCKbYc0eiOKbgQ6r8q4XM7xhb35CRO2jFYDUqttkO9LOe73ahFsxC8/OY01TYctUU1JGvchb2EFponlse7SUYdPN38gaYwK6yWd7pt5OS8TltQNZZuOqrrpH5ZEvobPG03ZlH5acXUWqw1BmmQwxGWTK7i2hOSKJ7gbuxtY2di/EtXt7g40873OMRyIcnH73SzjJahbuUVob7heO1dv6a5aMo2uMpIxf04gP5G/79KJ7HzwGpCeprbQGdy8GN04uzkAINk1r5Nr4vQb+K5rBBVDq4LJqChMqupYMVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bPcVHr3Vvil5CaoanvbeER8p6eknFrwq4DIcCvenSiw=;
 b=GX7/u1Xymk9yaPqJty+GHcceQEVHUuy/TPz8xihENVULBH+lMRWZoiX2Tyoc6B9pCNPBS+7Ny7xzN8DJBhhect32GKXiL9NaDT0ZcN0jKgzGinfARTpo7O6AkTA4eE4m+92bLun13JdNAQd0zdK0uJQDJSfF8dyJ8hrDn7FCd65KXU3JShvSWPShiV39LbFXKSeu/wIRar617OppigUWA39UmAgZekd8dAaz7pVrUADy490BV1T0ZGGorwP+X6F8buG42UIGxdI3UKglcNoAFLyVr+ewQb8tgL6Uo0NZQTc0fzRd+hrjXKDceSzDJQC/Gp51yGrIEwQmGa6Z5N0dtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB3911.namprd11.prod.outlook.com (2603:10b6:a03:18d::29)
 by LV3PR11MB8580.namprd11.prod.outlook.com (2603:10b6:408:1ae::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.38; Fri, 13 Oct
 2023 22:04:45 +0000
Received: from BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::a782:6fec:8d96:27b5]) by BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::a782:6fec:8d96:27b5%6]) with mapi id 15.20.6863.043; Fri, 13 Oct 2023
 22:04:45 +0000
Message-ID: <8cd43b8d-9c1a-40d6-9719-146221b8c403@intel.com>
Date: Fri, 13 Oct 2023 15:04:42 -0700
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20231004173341.3256501-1-daniele.ceraolospurio@intel.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <20231004173341.3256501-1-daniele.ceraolospurio@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4P223CA0010.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:303:80::15) To BY5PR11MB3911.namprd11.prod.outlook.com
 (2603:10b6:a03:18d::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB3911:EE_|LV3PR11MB8580:EE_
X-MS-Office365-Filtering-Correlation-Id: 38f099ae-14b0-47df-fa01-08dbcc3868e3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lSFUhxEIc7ZB5tHYK5IPdbOU+NFazpaIHixw/1+he+9eBx/M4P0vJO+VhNuyYjnWkcWMVnbKULJQt6JOjTCvhXG4QcXQp1Mf3kPeBiRNBWB9+qlhwZ0LmGV55b9RyVYNFmImtKm+jjkoeA3QZbc2qIIN1qM1zPmPxQNCefcPk0dCHVEvH2vDgFtOdL52sDDjUUywPz/AZfZ7strmTZwBhK6myBPD13L4tswOjYCmbFq7BF3bWSGmQ9/1iLM/5Qt8SBWfyNtCUDlboS2vnJfjZeYWbDf2U8sSY1c1JPRg90dzjus+seIRdibIg5aVjl9IaM/FxCeNSDHLiDHPwmtcdqF5wGm3xLBYKp0hMjBjaPpqI7UVCqB4R4BmcXSpPeCxImVbTuQR0vXjFXsACPgSA2tK+VNdHOug+FiyPHQUlA7/WeXDP0Y8K4y8hm+RwR1OhnvJ7iPWH7GXCKraBlc22Qur07LmBl22vHuN70xbVAsubyUWcRiox9n1oSxfMDLZ9WZ3OGS5EIuctepbAW1d0e4IPcCx9Px27ARVF40uBT8IpBCcqFGVlyZm0BkUD4c9f4pEOX9XNJXH4eXNLzAYy96QwDLuMFKF0heWr2yZn5/zuDrggrXFIfflWun/qvLW
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB3911.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(39860400002)(396003)(376002)(366004)(136003)(230922051799003)(64100799003)(186009)(1800799009)(451199024)(83380400001)(316002)(38100700002)(53546011)(6512007)(2616005)(36756003)(82960400001)(86362001)(41300700001)(5660300002)(66946007)(8936002)(66556008)(2906002)(8676002)(478600001)(66476007)(966005)(31696002)(6666004)(6506007)(6486002)(26005)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TStVTGdMUnhJdDd1SysrSkdWTUMydVZZNFc0NkFvdTcvOXphc0ZwQk5tRE85?=
 =?utf-8?B?L3Y1ait3ZEQ3dDcySmZZUzlMckVRazgvVEt2amwzMFAyRE8yNnlpOHJvV2NB?=
 =?utf-8?B?Zmd6OUxEb2NLT0hHbWJreFhKZ0poekZBUGErUjNCVStmZHBrcWlnRGdXdWVY?=
 =?utf-8?B?S2JMT2pmOUpISEdWdUVHS3NrdlBUTzQwNzBwU1B2KzlKalZtWVVCd0pkT2VC?=
 =?utf-8?B?Rm9wSEZGMHRNMmFjQTJUVjVvYXhxZGU1alM2cW9VRUU0elRtUk5XSmF4THVY?=
 =?utf-8?B?dzBTS09zRjVxdjVGREI5b2VVMWRUeS84VFlqaGNCSFVoWHB5V09UOFVOa3VN?=
 =?utf-8?B?Rmx0VXNLb0dmR1BuakV5c3B2WVhWeElOSWRyODFya09aUUhFeGQvV29tN2k3?=
 =?utf-8?B?eU9IdTRFTUpVRHk0TkE2bC92ZUNONE9lWXVhZkhEUFBwU2J6SXlKRHcwbGlm?=
 =?utf-8?B?UVYycHZyWW1pc054bkpyUUZiZkthNXFLdDdsWVNPSFBsZ0dWUk01NlJZRzky?=
 =?utf-8?B?ci9CNHZYT2g3dWloelRkZVE2QkdKbElOR21jRkdIQ2hYc2VzdTNzOEJLeHJC?=
 =?utf-8?B?SU8ybm9qYWg0MmhxZ3dxNEZnNFlPNEJ5WVQvbGV2d2l3STgwdHpFaFBtQkdv?=
 =?utf-8?B?YncxWXlUSGxEL2o3R3hmaW9rZ1JrcjQ4RUp6RXFLNm9ZVFVscDhGZW55RUhN?=
 =?utf-8?B?Y0dJMi92aG5WVkgrQUFBdnQzbTZBbDNHY3FJTnNaclB3QW1LczA0bm1ISGN6?=
 =?utf-8?B?Yzl2ZmxRSS8zM0h0bGJxamZEL1oveDdFTXl0VDhEcm1iUytoNFBzaGtZQlVI?=
 =?utf-8?B?SHRvelMvZ0RvaHNTcFB6YkpzTHoyUkZSSHdqb2x0cnQ0Ym9VcUx1L0tlQlY2?=
 =?utf-8?B?b1lPaTc4S1V3SG1zdittWGFHbjJCUHhTVElHM0lGZit2SHhMR1h5bWRSMThF?=
 =?utf-8?B?N0hIajFXNGpxcFpjRUY4SFBkNEZtU2tWb0hkMzE4SjRwcGpqQkdDNHo3NGNV?=
 =?utf-8?B?bWhaV3Z1QU05Uk1iZXpreDFENzdPUStTY0FIWS9WYUMvSnNqKzMzWnRWWkpW?=
 =?utf-8?B?SXlONzJIR3pFR25pUXZ0OGtCb08zMCtHci9NcXpFcmpFSEJtVHZyV1Nqb0lR?=
 =?utf-8?B?eFN2bDkxZXJ3elZ4SWZXTkNMeDB1aTZQT01DWENieUZnUEZIS0MrUU91VnFU?=
 =?utf-8?B?Vjd3ZjNWZ0doR3BQd1JEZU4zNHp3OWdCeVhjelh2OFBIVjdrNDdiYWtRYitk?=
 =?utf-8?B?aXdKMzcrbEQ1cHYwVjBGWWhZU28rczR5UmFuM1VWV2xoUmNOUnhjQm1WMzNM?=
 =?utf-8?B?OVpBVDd2L2sxS1UyS2JnMXUzV2l0eWxyQTh1NHY1cWgreTVoTU9wa0IwWXhu?=
 =?utf-8?B?R2RlbGJ3bFhSQlRJOU5jSWRTMjhvV25WNm94VUR5V04rWDZWb2NJU0owV096?=
 =?utf-8?B?SW5CSU9nYTdJMncyV1l3UjZXVjdPWHUyOUI0NmpUdUFCazU4OFltMmcrT1ND?=
 =?utf-8?B?TytCWDlkakQ0RDJlZGhrU0lERVhmcmYvRVNKQ0x0ejFHbXJVWGsrdG9QdUY2?=
 =?utf-8?B?ZWd3QVFqamhZQmZKQjRBa3FYZWJ1S2JYNnBwc0lzQnFkK2J0dWxMWDNTTUxV?=
 =?utf-8?B?WU5rU0NJZ1U4U3pjS1BPUkhqYzhVUXlRZWlCQ1BUM2M0V0FmWENMMitaVUxH?=
 =?utf-8?B?NUlCUWdMdGpMVjM5QXRwbkxXNjY0akpRZGRPSzNCTFFtTUhqOFY3bGlvbHI4?=
 =?utf-8?B?cm5ldWw3NTdvK24wZzQ3RkxPbE1aSkJpaHR4bHZUUk9vcDJvVmdUUlAvU05S?=
 =?utf-8?B?QmRGeFFYcGZJaE5IQjJZWlA2TXgwNzVYSmtxckNSSHJrSWsvQklON0RVbmlT?=
 =?utf-8?B?NkZzZVpmYUhiREZ5UjFaV0RvYW5OVVo2aEh5NndTbFkydkluTkNPZEhwSWx3?=
 =?utf-8?B?SjMxNXk2bEZvbXFmbjUreGpweTR5QTEzaUdrWnRXSnlzeTVkT0pyV0sxT3RH?=
 =?utf-8?B?bGZZckxnWXlHYzRhM1J2SCtUOTl2dW56R2xCc05lUjVDcXNDV0h4WFFpUzNs?=
 =?utf-8?B?UWxTSnRaZ1BJbGhhRG5teG9VWVJWS3pRU0k5MDd5VXg5WTRFWlZuTkVLbTJz?=
 =?utf-8?B?MWM5M2FKbkdaci9jdU4wdXJTdHdUa1UyOXArdUpFdzBXbzVPbHBFdkRZeUlt?=
 =?utf-8?B?NVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 38f099ae-14b0-47df-fa01-08dbcc3868e3
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3911.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2023 22:04:45.4506 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TPR3L+UM99vj2RWErwBwfhjQVjwO4RS4avpvW4FIFgYxmzS4IUTZTjk/3fnCNHy2J7ll+RHO4SPpNmx5bj73WJZ8OOov3VoE04CN0/8jpQ0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8580
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe/guc: Bump PVC GuC version to 70.9.1
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

On 10/4/2023 10:33, Daniele Ceraolo Spurio wrote:
> The PVC GuC version that we're currently using (70.6.4) has a known
> issue that leads to dropping the disabling of contexts that have
> pending page faults. This is fixed in newer blobs, so we need to
> update to a more recent release.
>
> Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/696
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: John Harrison <John.C.Harrison@Intel.com>
Reviewed-by: John Harrison <John.C.Harrison@Intel.com>

> ---
>   drivers/gpu/drm/xe/xe_uc_fw.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
> index 138960138872..edaa195fa25f 100644
> --- a/drivers/gpu/drm/xe/xe_uc_fw.c
> +++ b/drivers/gpu/drm/xe/xe_uc_fw.c
> @@ -103,7 +103,7 @@ struct fw_blobs_by_type {
>   #define XE_GUC_FIRMWARE_DEFS(fw_def, mmp_ver, major_ver)			\
>   	fw_def(LUNARLAKE,	mmp_ver(xe,	guc,	lnl,	70, 6, 8))	\
>   	fw_def(METEORLAKE,	major_ver(i915,	guc,	mtl,	70, 7))		\
> -	fw_def(PVC,		mmp_ver(xe,	guc,	pvc,	70, 6, 4))	\
> +	fw_def(PVC,		mmp_ver(xe,	guc,	pvc,	70, 9, 1))	\
>   	fw_def(DG2,		major_ver(i915,	guc,	dg2,	70, 5))		\
>   	fw_def(DG1,		major_ver(i915,	guc,	dg1,	70, 5))		\
>   	fw_def(ALDERLAKE_N,	major_ver(i915,	guc,	tgl,	70, 5))		\

