Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 670BAC4332F
	for <intel-xe@archiver.kernel.org>; Tue,  7 Nov 2023 23:45:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15BCC10E04B;
	Tue,  7 Nov 2023 23:45:12 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7376810E04B
 for <intel-xe@lists.freedesktop.org>; Tue,  7 Nov 2023 23:45:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699400709; x=1730936709;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=2RksqOaNNvMfcTrcQGCSHw0aAUajcvUNUczKSXPr8dU=;
 b=hPfNbWqFN47LU81glmID1BMik0BE6Ea0jj8PnzZwItUMTDvsel4qLw1W
 QeSRw9+Fm/IGti0b31vjs85ZqchmZ8D+PnWCYpkPUVxk/yMDXJS3Tg5f7
 DL9nlj45XAL8WUxVeNw0lW81xSOPbAwmu7BH5TX/hBYnpyYyC+L9XVXGL
 9qjasaSDpx3j6V5fbP2jPC3cp3HuXrCJzRTfpSfvAhEPHWhLjWz2nYFo/
 G8KOcxEvvKk/fiOB/xPdKuyQCbB9+zJ3Kt/zd5qudWIRWK7N8PEyhzvHm
 mfjlLLnt1KXu0FAop6/gw+ux7jDOgXphFCLdkC2gYRbV+R5+srkqShyQL w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10887"; a="456146166"
X-IronPort-AV: E=Sophos;i="6.03,284,1694761200"; d="scan'208";a="456146166"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2023 15:45:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10887"; a="762876882"
X-IronPort-AV: E=Sophos;i="6.03,284,1694761200"; d="scan'208";a="762876882"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Nov 2023 15:45:08 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 7 Nov 2023 15:45:07 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Tue, 7 Nov 2023 15:45:07 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Tue, 7 Nov 2023 15:45:07 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UqCM/SBuwaM/2zjVeftVwxHzSeDUuFfSkoI2Sfgk1yo6/BMjAfms71efaqt4uT5EKI9rRpeU+oSYr0SdKYEd7zGcDGv1UcfTinz4hBCbRvxjBYFbdXq39QT5VyuK5VnpOxxeUh1syckJuhjzAnvmbybzotNO2xbp21PxCmGboCutlMS0rn1SUtj41KceWQ11dIBa6oybL9GPkwiwb4Nj3mn7DL1FbnYbTd+soQLGmGswhilJ2uW4GETPZT7+blUY3vZnQERz8jMeDJmvvhWK44Bk3xSgi0kjE4SVEx+gSFBwFb95xy6kE30PwECRT2Vzk0H1bsdKfsFh7ZBsPt+isg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ejdWsXORzQHbRJJlrHNBJMa4eNdyoHIpbkq2dgz7FNw=;
 b=CGuExTRk6xRPD8vBGo2+h1sKs521ZQL8pg3NVh8PqsczomEFB0lIxeDshLtZec+9CUhkeJY7n0E3GISISkQG6b78xe2BeJPUkOFWqJEvXwi3cxVjxYQD74xa4YeFz5ktIIawfLYUQJxbbse3oTng9b8giOCNrAM04MyOTmpdUhb+J2BDeTr3HkeS7lsB8A0huAkmYCZ9fT8vsHIP0Gu4hVWNPAIyEAqrz1MmY17olicrEE+u+lgQyYRv8Fi5unY/r1J20WnIOXTmI/aI7wbP4Je9FhZNP20Fjk3WSwq1L2uTjBpyVMdUU+kItau9+QlGW54arsoZ3RshH6TukRdAZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB3911.namprd11.prod.outlook.com (2603:10b6:a03:18d::29)
 by SA1PR11MB6872.namprd11.prod.outlook.com (2603:10b6:806:2b2::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.27; Tue, 7 Nov
 2023 23:45:05 +0000
Received: from BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::de08:93ac:5940:ec54]) by BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::de08:93ac:5940:ec54%4]) with mapi id 15.20.6954.029; Tue, 7 Nov 2023
 23:45:04 +0000
Message-ID: <9cc04ff6-d3ee-4ab1-bc1e-940813f35af0@intel.com>
Date: Tue, 7 Nov 2023 15:45:02 -0800
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20231027222928.1981633-1-daniele.ceraolospurio@intel.com>
 <20231027222928.1981633-6-daniele.ceraolospurio@intel.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <20231027222928.1981633-6-daniele.ceraolospurio@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0066.namprd03.prod.outlook.com
 (2603:10b6:303:b6::11) To BY5PR11MB3911.namprd11.prod.outlook.com
 (2603:10b6:a03:18d::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB3911:EE_|SA1PR11MB6872:EE_
X-MS-Office365-Filtering-Correlation-Id: 06a2d572-b05d-4989-40d0-08dbdfeb90f1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ql+3bE6AtC6vyI6NL48bCm+B5QcVFrlr2Lv94OW34RI3h4yTQED7LoqaclKo/W3GCWs2fSs+/iviJZXOydOcPDj1sg5MoTXyTGNtDICDsL8Yjfy1F1I0jkGhWwnzEjpGHmoqupZ4lV9Ro1TjI0xVczi1M9u/RJLUKUNuhAAvxZtuAQ3KTXI9ZxFZcv0KXB+oB6VMNXmAgw/reY+eLh2qfu3tBKKa1rmDXOvEBf+P2nckKJ8xQyxUIumWy7UQ+aDYCnnTwQeO34KRkbICClPKwZL7HH43D5utjX0i5SF3LVZSRYxla+MoRH8x1aiqdf6ljwNX6Crd/0hMAL6d+9B9SkSQjKMEcCrCmlWJ6rdL3pZ/CyAbBNpHIzTue0TjQCtg0H+Xxg5LgJCEFZFxms5dUf29Yphdg7jUUvmgNUyhulIpXYYiYcBML0wvHLK2lBbIGT+VAgLZkpqGMfNZUmEw9IQnCbz3cxwaasvtJlI8YK2ihg9x0MiR49BUrlzOvCoErLEL8vt+LYyq9N0YLF87Vv/SD+i6OUOwylZXd2U+MO0ZrUqbMI+79Bhl5ezKpVfWjGCELGdTiQ7afMpMxoANw+zyNzhktsoVxx77SoAM9cwT8Ifmr+3hPc3VPIfSG8bGLP3nFoh6tWobfWxhZmdqfw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB3911.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(346002)(39860400002)(376002)(366004)(396003)(230922051799003)(64100799003)(186009)(1800799009)(451199024)(38100700002)(478600001)(6506007)(6512007)(53546011)(6486002)(2616005)(83380400001)(5660300002)(26005)(8936002)(2906002)(107886003)(66476007)(66556008)(41300700001)(66946007)(4326008)(316002)(54906003)(8676002)(36756003)(82960400001)(86362001)(31696002)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WWVsUWcvaGlyR1h1Mkk4VlpTdTFyY2Mxd2FFU2tqS2VnUXk1bHB5UkVmQWla?=
 =?utf-8?B?ZFpkUm1KRFVQOTc4bGRQaWh4cm1jaGswQ0dldzRQRDBieFBqa040QVN5OGtn?=
 =?utf-8?B?YXpxNW5Nbm15QWR3ZVp1UkU4NXF4Tk5Nc1lDNVk2Qnk0RGtlc2p0NXVMbVB5?=
 =?utf-8?B?TU1zNEs1RGpWNXkvYVFPUHlSNnF6TTBodGdCdFlpL21GdXlRMHZQWXp6NFRE?=
 =?utf-8?B?SE1tYW0wa2gyVmdiMWVuVXVzYmRGTXFiQkZCVXNLYXNKWnk0bmE4Q0pJNVhE?=
 =?utf-8?B?WUZTUzN1SVpNQnIyd0Rpb01wb0ZEb1JDOEorNXo4b2NHTENQZFV4aE1oN0tP?=
 =?utf-8?B?SjU1Y0VYZmJhU3YrdnhUWHdDbG0rVnd6QVFLYVJ5K09EbHZpWEtEQ0hxOWZW?=
 =?utf-8?B?dmpIQTdCRmdnU2Fkdk1DcHQzSVRGTWh2M3VhYWZ3RU16UHFudHFXQmVobXoy?=
 =?utf-8?B?WW9IdndzMEh4L20wckU3N0JxcStGSnBGTTdwRGxVczYwRzN4T2pPc0ZDU1h1?=
 =?utf-8?B?VXlDRGt0YkliZTR1cEdteGkwc1NyR0I1VzE5ZUkvSDJEdm4wTVJkL3BkZDJD?=
 =?utf-8?B?YUZrd2FkaXUvOU94WTQ5QU5TSjZ2azJLSGFSY1JodGJBNkE5NjJTY1c5YTBk?=
 =?utf-8?B?eHN4NGpvNEQ1anA0dUR2clhVMWNENHdWT0NncHRsNS9CNGxyZktqTllvTWxI?=
 =?utf-8?B?MU9Tb28zNVhPS1ZtaTdQd0U5c1BPYUVEUEVEaGVaR0xLQWMwYW1pRDNNT3pw?=
 =?utf-8?B?RVNXNmRrMzQydnB1WmhqeVdVaHkwbHlHSnZMWUdBT1YvdXpDY3B0bnZmL1gy?=
 =?utf-8?B?dk9KNkk2bEtPOGNFNnJxQUQ4K29KYWhSTlZZb2dQd0w2U2Y3SUV4WTNpSlZD?=
 =?utf-8?B?dzlMODZLYllpOGN0a2kvQ1llTTRGV203c2pVVnFPNGt2bmVMTmM3QnRNbGpX?=
 =?utf-8?B?WXBZUVRYZUgzajQzU3ZLR2pLZW04d1FPR01KRkRyeDA4Wmk5ZVNqQzRVS2lS?=
 =?utf-8?B?TnFuNGhoWnNza1dNZU1KeUpZSjRUMnhBQW00aVdFR29ra2czSGU2dDhBZlhk?=
 =?utf-8?B?N1c0MkVHWnZ5RFpXeE1qakZud3ZKNUpiZEpIWlpUOGRtR1BTK0NMVUlWVUpk?=
 =?utf-8?B?NXd6NFQ3VHhlU1czN1N3OHpKQ3hwTFVVNlQyN3I5U3JnYVFmRFU4Ky9QRWFJ?=
 =?utf-8?B?OEt5RU90TlZ2VVNyQzFYSlBtRk5CTXN2REREelVVS3RFU3FzK0p3NVZpWnpz?=
 =?utf-8?B?bU56RW9ET2pLWHB1Zjl1c3dSS1RXNUhCQzJMd05HaGJvZENETVowZmJrZDMz?=
 =?utf-8?B?MmZGRVlpQ0VuUXNBN05kdW1xNlo3emVBcGxCdGVnR25hY3JxdG1iQ01EZlR2?=
 =?utf-8?B?a2dSL05EU095eis0QWFqOVRqU1orbjJpTlhJQ1cvNFAzMUt3MVVOaUhWMmN2?=
 =?utf-8?B?NzFPd2lScW5LV2grcWliZzh0Q0NlTlV4Rm5ramx4WjlNZGN3T08rYXlSVFh6?=
 =?utf-8?B?TFVuN2taWHFNYmJlLzAvVW1uTWpKSm5vamQwdHpCbkpMVnNDQnozaFphWkR0?=
 =?utf-8?B?dWpWM0RyOE1NWEdWajYxeTU2N2x5S29oVzRSQkZQUFkzS1VVWHBUay95Rzdv?=
 =?utf-8?B?dEZtTFRYUk9pSjFuMS91VFBzZVArK3FCbVoxczVMVnY3QXZLUVhybkMrNVk3?=
 =?utf-8?B?cFh0aG5rcWdCZnRJSXlRN0VGN0RkL3JiekFBamJaQWxZNWR3SVJ4cSszN3lF?=
 =?utf-8?B?WW5ZazhZMjU5aUV5YzRXNUNDaCtIU1V6TEdwODhsVFY4QzN6Nkw1MlorQ2Vx?=
 =?utf-8?B?YUZnbWxoazZ2eXNtVWQvL1MrbDlzcUdYeEhiOWw2dFQrUEtFUU9IOHRzdlB6?=
 =?utf-8?B?NEx6RHdQbStSYnpOQThPQXl4WWFMQ0NyMDFhQW5ZU1NjekNJSVpwUVBYWVhh?=
 =?utf-8?B?dDI5OWJHM1ZtdDFyZlhYQ3RaWkdNcEUrWVpHYkZNU1BDNXNSQjVBb1NiVktS?=
 =?utf-8?B?elhvVFdjdCs1T1U0bEw5WENYb3BPc1ZGUFlITVhKbWpSdi9lZDl5VkhRSm5B?=
 =?utf-8?B?ZHp3MGR6OEFaZEV5c05MV0FTWVp3OCtWNmE5TTlXLzZWbFphRXp5WW82TEUy?=
 =?utf-8?B?VFZNSS9wVVBiVFFZVE9OS0thczVHSzVIeVFFRDVJMDZ5dXBhNlk1ck44VVFB?=
 =?utf-8?B?alE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 06a2d572-b05d-4989-40d0-08dbdfeb90f1
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3911.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2023 23:45:04.6636 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bGzfos1XPvpo9qf3Ni9TB2krazKpmGAPiPp5MU+soBLf2T/4OTi0JnTnX1H76UOruN2BW2B9/uUjczS+iE2SdmgBtZqPsxA1TfVv5k49bTI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6872
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 05/12] drm/xe/gsc: Parse GSC FW header
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On 10/27/2023 15:29, Daniele Ceraolo Spurio wrote:
> The GSC blob starts with a layout header, from which we can move to the
> boot directory, which in turns allows us to find the CPD. The CPD uses
> the same format as the one in the HuC binary, so we can re-use the same
> parsing code to get to the manifest, which contains the release and
> security versions of the FW.
>
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
> Cc: John Harrison <John.C.Harrison@Intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_gsc_types.h |   3 +
>   drivers/gpu/drm/xe/xe_uc_fw.c     |  77 ++++++++++++++++++++
>   drivers/gpu/drm/xe/xe_uc_fw_abi.h | 113 ++++++++++++++++++++++++++++++
>   3 files changed, 193 insertions(+)
>
> diff --git a/drivers/gpu/drm/xe/xe_gsc_types.h b/drivers/gpu/drm/xe/xe_gsc_types.h
> index 135f156e3736..1bc50583fe58 100644
> --- a/drivers/gpu/drm/xe/xe_gsc_types.h
> +++ b/drivers/gpu/drm/xe/xe_gsc_types.h
> @@ -14,6 +14,9 @@
>   struct xe_gsc {
>   	/** @fw: Generic uC firmware management */
>   	struct xe_uc_fw fw;
> +
> +	/** @security_version: SVN found in the fetched blob */
> +	u32 security_version;
There is no official structure to this version number?

>   };
>   
>   #endif
> diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
> index af3e5cba606f..bb38a76eb4a6 100644
> --- a/drivers/gpu/drm/xe/xe_uc_fw.c
> +++ b/drivers/gpu/drm/xe/xe_uc_fw.c
> @@ -12,6 +12,7 @@
>   #include "xe_bo.h"
>   #include "xe_device_types.h"
>   #include "xe_force_wake.h"
> +#include "xe_gsc.h"
>   #include "xe_gt.h"
>   #include "xe_map.h"
>   #include "xe_mmio.h"
> @@ -488,6 +489,13 @@ static int parse_cpd_header(struct xe_uc_fw *uc_fw, const void *data, size_t siz
>   	release->minor = manifest->fw_version.minor;
>   	release->patch = manifest->fw_version.hotfix;
>   
> +	if (uc_fw->type == XE_UC_FW_TYPE_GSC) {
> +		struct xe_gsc * gsc = container_of(uc_fw, struct xe_gsc, fw);
> +
> +		release->build = manifest->fw_version.build;
> +		gsc->security_version = manifest->security_version;
> +	}
> +
>   	/* then optionally look for the css header */
>   	if (css_entry) {
>   		int ret;
> @@ -517,6 +525,73 @@ static int parse_cpd_header(struct xe_uc_fw *uc_fw, const void *data, size_t siz
>   	return 0;
>   }
>   
> +static int parse_gsc_layout(struct xe_uc_fw *uc_fw, const void *data, size_t size)
> +{
> +	struct xe_gt *gt = uc_fw_to_gt(uc_fw);
> +	const struct gsc_layout_pointers *layout = data;
> +	const struct gsc_bpdt_header *bpdt_header = NULL;
> +	const struct gsc_bpdt_entry *bpdt_entry = NULL;
> +	size_t min_size = sizeof(*layout);
> +	int i;
> +
> +	if (size < min_size) {
> +		xe_gt_err(gt, "GSC FW too small! %zu < %zu\n", size, min_size);
> +		return -ENODATA;
> +	}
> +
> +	min_size = layout->boot1.offset + layout->boot1.size;
> +	if (size < min_size) {
> +		xe_gt_err(gt, "GSC FW too small for boot section! %zu < %zu\n",
> +			  size, min_size);
> +		return -ENODATA;
> +	}
> +
> +	min_size = sizeof(*bpdt_header);
> +	if (layout->boot1.size < min_size) {
> +		xe_gt_err(gt, "GSC FW boot section too small for BPDT header: %u < %zu\n",
> +			  layout->boot1.size, min_size);
> +		return -ENODATA;
> +	}
> +
> +	bpdt_header = data + layout->boot1.offset;
> +	if (bpdt_header->signature != GSC_BPDT_HEADER_SIGNATURE) {
> +		xe_gt_err(gt, "invalid signature for BPDT header: 0x%08x!\n",
> +			  bpdt_header->signature);
> +		return -EINVAL;
> +	}
> +
> +	min_size += sizeof(*bpdt_entry) * bpdt_header->descriptor_count;
> +	if (layout->boot1.size < min_size) {
> +		xe_gt_err(gt, "GSC FW boot section too small for BPDT entries: %u < %zu\n",
> +			  layout->boot1.size, min_size);
> +		return -ENODATA;
> +	}
> +
> +	bpdt_entry = (void *)bpdt_header + sizeof(*bpdt_header);
> +	for (i = 0; i < bpdt_header->descriptor_count; i++, bpdt_entry++) {
> +		if ((bpdt_entry->type & GSC_BPDT_ENTRY_TYPE_MASK) !=
> +		    GSC_BPDT_ENTRY_TYPE_GSC_RBE)
> +			continue;
> +
> +		min_size = bpdt_entry->sub_partition_offset;
> +
> +		/* the CPD header parser will check that the CPD header fits */
> +		if (layout->boot1.size < min_size) {
> +			xe_gt_err(gt, "GSC FW boot section too small for CPD offset: %u < %zu\n",
> +				  layout->boot1.size, min_size);
> +			return -ENODATA;
> +		}
> +
> +		return parse_cpd_header(uc_fw,
> +					(void *)bpdt_header + min_size,
> +					layout->boot1.size - min_size,
Could compare this calculation against bpdt_entry->sub_partition_size 
before bothering to try to decode a partial CPD?

> +					"RBEP.man", NULL);
> +	}
> +
> +	xe_gt_err(gt, "couldn't find CPD header in GSC binary!\n");
> +	return -ENODATA;
> +}
> +
>   static int parse_headers(struct xe_uc_fw *uc_fw, const struct firmware *fw)
>   {
>   	int ret;
> @@ -526,6 +601,8 @@ static int parse_headers(struct xe_uc_fw *uc_fw, const struct firmware *fw)
>   	 * releases use GSC CPD headers.
>   	 */
>   	switch (uc_fw->type) {
> +	case XE_UC_FW_TYPE_GSC:
> +		return parse_gsc_layout(uc_fw, fw->data, fw->size);
>   	case XE_UC_FW_TYPE_HUC:
>   		ret = parse_cpd_header(uc_fw, fw->data, fw->size, "HUCP.man", "huc_fw");
>   		if (!ret || ret != -ENOENT)
> diff --git a/drivers/gpu/drm/xe/xe_uc_fw_abi.h b/drivers/gpu/drm/xe/xe_uc_fw_abi.h
> index d6725c963251..edf2a448f4bb 100644
> --- a/drivers/gpu/drm/xe/xe_uc_fw_abi.h
> +++ b/drivers/gpu/drm/xe/xe_uc_fw_abi.h
> @@ -140,6 +140,58 @@ static_assert(sizeof(struct uc_css_header) == 128);
>    *	|      RSA Key (MTL+ only)                       |
>    *	|      ...                                       |
>    *	+================================================+
> + *
> + * The GSC binary starts instead with a layout header, which contains the
> + * locations of the various partitions of the binary. The one we're interested
> + * in is the boot1 partition, where we can find a BPDT header followed by
> + * entries, one of which points to the RBE sub-section of the partition, which
> + * contains the CPD. The GSC blob does not contain a CSS-based binary, so we
> + * only need to look for the manifest, which is under the "RBEP.man" CPD entry.
> + * Note that we have no need to find where the actual FW code is inside the
> + * image because the GSC ROM will itself parse the headers to find it and load
> + * it.
> + * The GSC firmware header layout looks like this::
> + *
> + *	+================================================+
> + *	|  Layout Pointers                               |
> + *	|      ...                                       |
> + *	|      Boot1 offset  >---------------------------|------o
> + *	|      ...                                       |      |
> + *	+================================================+      |
> + *	                                                        |
> + *	+================================================+      |
> + *	|  BPDT header                                   |<-----o
> + *	+================================================+
> + *	|  BPDT entries[]                                |
> + *	|      entry1                                    |
> + *	|      ...                                       |
> + *	|      entryX                                    |
> + *	|          type == GSC_RBE                       |
> + *	|          offset  >-----------------------------|------o
> + *	|      ...                                       |      |
> + *	+================================================+      |
> + *	                                                        |
> + *	+================================================+      |
> + *	|  CPD Header                                    |<-----o
> + *	+================================================+
> + *	|  CPD entries[]                                 |
> + *	|      entry1                                    |
> + *	|      ...                                       |
> + *	|      entryX                                    |
> + *	|          "RBEP.man"                            |
> + *	|           ...                                  |
> + *	|           offset  >----------------------------|------o
> + *	|      ...                                       |      |
> + *	+================================================+      |
> + *	                                                        |
> + *	+================================================+      |
> + *	| Manifest Header                                |<-----o
> + *	|  ...                                           |
> + *	|  FW version                                    |
> + *	|  ...                                           |
> + *	|  Security version                              |
> + *	|  ...                                           |
> + *	+================================================+
>    */
>   
>   struct gsc_version {
> @@ -149,6 +201,67 @@ struct gsc_version {
>   	u16 build;
>   } __packed;
>   
> +struct gsc_partition {
> +	u32 offset;
> +	u32 size;
> +} __packed;
> +
> +struct gsc_layout_pointers {
> +	u8 rom_bypass_vector[16];
> +
> +	/* size of pointers layout not including ROM bypass vector */
pointers layout -> layout pointers?

> +	u16 size;
> +
> +	/*
> +	 * bit0: Backup copy of layout pointers exist
exist -> exists

> +	 * bits1-15: reserved
> +	 */
> +	u8 flags;
> +
> +	u8 reserved;
> +
> +	u32 crc32;
Should we be doing anything to test against this crc or the one in the 
bpdt_header below?

John.

> +
> +	struct gsc_partition datap;
> +	struct gsc_partition boot1;
> +	struct gsc_partition boot2;
> +	struct gsc_partition boot3;
> +	struct gsc_partition boot4;
> +	struct gsc_partition boot5;
> +	struct gsc_partition temp_pages;
> +} __packed;
> +
> +/* Boot partition structures */
> +struct gsc_bpdt_header {
> +	u32 signature;
> +#define GSC_BPDT_HEADER_SIGNATURE 0x000055AA
> +
> +	u16 descriptor_count; /* num of entries after the header */
> +
> +	u8 version;
> +	u8 configuration;
> +
> +	u32 crc32;
> +
> +	u32 build_version;
> +	struct gsc_version tool_version;
> +} __packed;
> +
> +struct gsc_bpdt_entry {
> +	/*
> +	 * Bits 0-15: BPDT entry type
> +	 * Bits 16-17: reserved
> +	 * Bit 18: code sub-partition
> +	 * Bits 19-31: reserved
> +	 */
> +	u32 type;
> +#define GSC_BPDT_ENTRY_TYPE_MASK GENMASK(15, 0)
> +#define GSC_BPDT_ENTRY_TYPE_GSC_RBE 0x1
> +
> +	u32 sub_partition_offset; /* from the base of the BPDT header */
> +	u32 sub_partition_size;
> +} __packed;
> +
>   /* Code partition directory (CPD) structures */
>   struct gsc_cpd_header_v2 {
>   	u32 header_marker;

