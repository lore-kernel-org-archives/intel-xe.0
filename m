Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18849C0015E
	for <intel-xe@archiver.kernel.org>; Wed, 26 Jul 2023 17:14:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE41C10E02F;
	Wed, 26 Jul 2023 17:14:30 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E72CB10E02F
 for <intel-xe@lists.freedesktop.org>; Wed, 26 Jul 2023 17:14:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690391667; x=1721927667;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=5N8jYe/FvRcdGpF/IiRKkSe9qC35P4b9WmrTC8zn/3w=;
 b=XruCMMb3tT/WPCN1+p0xBK88/T0rtFkGMMbDu3OH85/3pctMYaVAwgq9
 qA2QMUicER/AQrLk2iO4vQ2r0OtTYe7T6AVEMAEV5OjDS8dpRBVIbhDJ+
 Zf8oFE7y9gZ2w25I0+pxnVwl6GKOSemjGu0AeAMIYp/BgRn3kRaMTmphb
 fiJPooS6j0qiZhCbQPqi/8EhveqCmak6trH5UdSPmPsmGLJTyGfF4QA+j
 JEhQw7r+9VMFGq5QSqSKqiHYjHyWQ+9GehMEoiuME1iiRqCAQhifEIly0
 Lk9Ds66x3sJfsgUEIJd9hRVueUZ+ZU6XJgD4yWGqRTpqNMM2AEjod9V3f A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="454451379"
X-IronPort-AV: E=Sophos;i="6.01,232,1684825200"; d="scan'208";a="454451379"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2023 10:14:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="973204048"
X-IronPort-AV: E=Sophos;i="6.01,232,1684825200"; d="scan'208";a="973204048"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga006.fm.intel.com with ESMTP; 26 Jul 2023 10:14:25 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 26 Jul 2023 10:14:25 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 26 Jul 2023 10:14:24 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Wed, 26 Jul 2023 10:14:24 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.49) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Wed, 26 Jul 2023 10:14:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DpZGJ/+/Jns0StZLVunRugLvFErUQXMcJUMQ6CuKPjULw/oEckFx+LBTXV73ait5+SCtnXV6qtrMSRedd5Ho/yqem306DRrLMr6BEAoSxd3iUeS5KLy4TwoVvRJ9sEFAhd4MpF6wmQTo4GxGn5tTAZ05YyYD7OX4eg/emPVw3Y+bPNQ7edQBjvDl7jo1OTqOLkoQoiSC5mnuD/5yHqGnPtuYevhHMi7KXrcZgYfU+O3fHZc3SVoFFL6c0ljn7Y6exzbLuK81IItwpGMoa+Z0AmbKQBYCnKkR89/d0alZ1iuxwbPt3W7pYYUkRoyPzIdogEI4/KFIrzqucXN61XFSaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=foVCZFyTYiYv+yRnK66AMkpdnXhbXgtVybsddK6zPOg=;
 b=VfeZ28ZT5Gfg4z8mFirzsA9C1yzbLObERILDPaQ5gQ7hc4B8JF1rb90zy6FiygGhZbhHEXieLPzojKFO1b/tc9oxHbbeEPaEc18w9QAYAt1Xd1Yg58XMjB7mjmTCYkn6L5oJH3qCRTGhmxKWF9J+0gqGu1zVr9DUS9zmoKXy378UMsK2IIabS232r1CMMRiZ2RdkmVJ9f1036yoOsIubHPO5Wnvb5bi4R29tZYnfaYsi/h5p/bBO3fHitut9HqBmTfC6V2Ua9qRnr7rhWl9MPkFeN5W3FQk5AgKgMlXUC5oMTA5wloAjudzm59akZUgzS08ndJ684+/NfP2NPOyE0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by DM4PR11MB7182.namprd11.prod.outlook.com (2603:10b6:8:112::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.33; Wed, 26 Jul
 2023 17:14:22 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::e273:56c0:2fca:f739]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::e273:56c0:2fca:f739%7]) with mapi id 15.20.6609.032; Wed, 26 Jul 2023
 17:14:21 +0000
Message-ID: <b66d2e08-5b9f-512f-3aa0-3d8c05ddec46@intel.com>
Date: Wed, 26 Jul 2023 22:44:12 +0530
User-Agent: Mozilla Thunderbird
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
References: <20230725155115.3759312-1-himal.prasad.ghimiray@intel.com>
 <20230725155115.3759312-3-himal.prasad.ghimiray@intel.com>
 <ZMEwG8O9dZ8Ri7Kc@intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <ZMEwG8O9dZ8Ri7Kc@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN3PR01CA0026.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:97::17) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|DM4PR11MB7182:EE_
X-MS-Office365-Filtering-Correlation-Id: a34dd3c0-7452-459b-b31e-08db8dfbc0b8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZB0oo3R/sxFwANwESLmUOcOGkTC4ngO/5xNmB1YYQjcJlRw2MPNMaZjQMLnk/z7hE7FGJN16o9KQ5kbRIA+tNo5Dz7uRtJEFktFx2uN6FIJ2wXR+F3rPm4kJjRs2DC1jRQkjUXFpExwCtKzEYagGDhkOzwlPumSloE6mg/yaRV7Ea2j2YuN032DF7stzk+s4//rf4mKdZkrFIeEsaON8L9vvIvbBZ1L6v5t4ww7mcB3q7IwEQMR6yZBkfm2HGAkO1kx1SwaSzIbvqY5/ZR3VQIUu3rcsCKh+pd+j/dLXc9QIV/YdHJvEEI71FxYxrFG9rgqUYr5aEhxtIJYmxLDLRMuW9SUh9Rp/FBzFOw7ctDJ7DO2A+AC5hTXEMWjG8HhGgktvq8MxdRneSgNqU2E604ZCM/1DM9ZgZFpG8LJw5WY3SXHLZ5jB9sLVxE9kKqE3zwQ7TrPtM2cQLZADYcne5Ca/4bKQBk6xo2eueQiq4OMiI3ZaH/LxEsY4AcDZS5Vb7IWXOmKV9hE5PUzONEImrc9uG69I2VPBNg4qwMrYUpR3ANADfVKZWVocghYGsKSXq2QkdyA1WO+qr6qAr51ympNp+JdwD9R2AjSh0WM5aYG/lLPbQX8OAAn6UWIPp8wWUUXWlUrYSM8iXaUcJ0ZJIg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(396003)(366004)(39860400002)(346002)(376002)(136003)(451199021)(186003)(53546011)(6506007)(26005)(2616005)(83380400001)(66476007)(6636002)(66556008)(6666004)(316002)(66946007)(4326008)(5660300002)(8676002)(41300700001)(6486002)(6862004)(8936002)(6512007)(478600001)(2906002)(37006003)(38100700002)(31696002)(86362001)(36756003)(31686004)(82960400001)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cE9ObVhBd2RXL3hEWWRVVnhzZWlIWklrNHR1TDdMenhldkhYV0RVSExqeUZp?=
 =?utf-8?B?azhaa0FlME1rTUh6RzdCTU55Sy9uQ1ptSUx1TFM0dGM3c00zQ2xFc0VlbHpt?=
 =?utf-8?B?UG9qaGp3NHd0N3VZM3lKRUJwaE10WlRCd0RjZEIzNkZBY0dVMWJkWlRQWGFJ?=
 =?utf-8?B?K1V6YnY4Qkd5clJVbTBlMHJLbUNUQ01Vb3c4aXpaK0huNHlrOE05MVdiUXgz?=
 =?utf-8?B?TXVtOUtKOUZ0SG9qbUNwSER1U1JzTStYMEQ3YjVJQmN3TEo2ZUU2S25NSG9z?=
 =?utf-8?B?MHo2bVE0cnJ2TStHNEdOUk5HVjlENGFpZjJJOTN1RkdNdnBBOE9TMFhkMEhD?=
 =?utf-8?B?VitYdG81N3pCZm1IQmFYK0QrQUNwY0x3dVNvTnFxYS8raFN6cnF6RFJRNStZ?=
 =?utf-8?B?T1YrajFvMDJ2dHdIRFAzVFYzak0yNnI2T1dTTjdFMldUNW5rNHNRVTF3T3FN?=
 =?utf-8?B?dHZCRWIveDk1MERFZXFjMnplZGIyUlc1eUdpYnJ2aTBqaDF2aWJCRm5SMDFv?=
 =?utf-8?B?L1EvK0JJMndhSDhBU3V2K3pBd01Hd1hSbDg1UUN6U3dVZUlUZ1lvQ1VXS2Rl?=
 =?utf-8?B?MmxNbG5RVWRLMmpKVkc0S0tydFZFRE1SU3BpVHptdVNzaDNBb3A5WFdoQWpL?=
 =?utf-8?B?TWs4cXdFa3I2Y00yZnhPTE5HbmlreXA1Mi9hMkRpcnNWVDN2Z0FDbHN1bU95?=
 =?utf-8?B?YzJtOTJGNTk2bzBERjZmOGJlUjR5Unk1dDhNc0h6WnJnTy8wUG8vVkdtcmhF?=
 =?utf-8?B?bUJBYm11NDZKSGdpejdjZWpiY1dsNFp5UXQvMXVOVUQ2RDF3RjZITmkra01s?=
 =?utf-8?B?d0lqRVdtQ0tWQ0ZZcUFPd1JwVS8yeDRVOXNySzdIdUZ0QzZBMEYzVXJCaXEw?=
 =?utf-8?B?UnZVdkU0S2M0Kzd0c3k0eHZXWEpCWkowcmMvRlZJUGF2YXR2Q0JDYVF5dlZW?=
 =?utf-8?B?TGg5c01zWEdxamRXaUV2MVdVd3czTVNudWhjRVV4bTQzZFE4QWFRV1F0bkNQ?=
 =?utf-8?B?QVdlb0hXV2lUVktBVUIyUXBqaURicE9UTlFLRzZzN0lzWCttNDhhekpBRG5M?=
 =?utf-8?B?d0NYei9pV1QzR0hmZGsxT3ZPVzF0M01aRDY2Y1A5MTJGRDVXb0o5b210REFU?=
 =?utf-8?B?aC8wbjI2VU11WmdwM3YreituZGdMWDBBSHBMc2gxZktJVEFZcVhFcmRDekNX?=
 =?utf-8?B?YWpkdWhqNFhHeU9YMytJQXk4Nk9kdEtFQU55QlN3WjJFcDZXUmY1Y2MvYWJK?=
 =?utf-8?B?ZXAzMHIwQjR1M09wc3IzMFBTOXFwckp1aVZHMFFCYWR4R1BHeXpscXBwRm5m?=
 =?utf-8?B?b0ljNDNsYlVLQ2tMZFpjak1iV2pSRkFRSWxGaWVEQW5YZ0ZucGEvTmJhd3J6?=
 =?utf-8?B?V0ZSU0JnczJic0tWVGgwVGZxUEFnV0lBUEFkU003bGxybDZUZTdFb3k5cXVS?=
 =?utf-8?B?K0laOU1nOWNTd21pTTZFcEgxTlhKbU9Eb1kxaVNCOHRCQjBWUSszWUoyT3JQ?=
 =?utf-8?B?dmRjM3haMis5WHpGaXRvTVdyeFlBckVrQndxR1VvTW9HMHRIelFUTXJNeXRa?=
 =?utf-8?B?VDJhK2Zld1VDVitnTVpWQ2JSMkExb2dud3FlNEdTamxGcUdZdW55ZnBQN0dB?=
 =?utf-8?B?R3dJUFh0SGRzeUZTaEVCMVVHeEJYNHRobEx1SUhqZkRQQ3ZJY1V3bTJWUzZZ?=
 =?utf-8?B?aFptNEl6SlBITktmN2pDTFQxcFpYdHFhY3pWdDE2b1NySy9nK1lkYkpTbUUx?=
 =?utf-8?B?Y1RRL3RGMWtxdE9oK2d4cytLdzlqdUxycGhTekdPd0ZjZUc0Y3hDaTFZeVFY?=
 =?utf-8?B?NVBTUzlFNTdxZHdBMm5OUnBmMlY4N3Jwd2duRjVhK1ZCRS9HU2xuTkthR0FZ?=
 =?utf-8?B?VThReGNPUEVWdHhhNXlDVld1YTMxTEZ3WGo5WXdwUWRmcVZWZTlqbFVKTmd3?=
 =?utf-8?B?NUVYMHFJM0FwUEQ1Zkd0SWZ1dXpvdU1WdGMzOXdCNmdSUFlsWEF4eHNtMEdB?=
 =?utf-8?B?dTg0aTZmZDZNbzBXNjAwR2RoM3NzbTJ3RmJlV3VqSG9rWUlnd3JpZjNZMkZB?=
 =?utf-8?B?OU1Sc2VrUnJyTU51d1JiVHU5cnAzQlRtNnBSU1p0WjU4eVZwN1kzUjBzbkNn?=
 =?utf-8?B?WHYwUVRtZjhiZzdWMzZBb2l3cGt6dGp2cHhnbTBRL3JJYnZMMjhmczV3Y3dK?=
 =?utf-8?Q?hRjcpEF+iQhJPc15zQApnnA=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a34dd3c0-7452-459b-b31e-08db8dfbc0b8
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2023 17:14:21.6636 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CfW3g/LA8I3iOX8GWts7R8z3rmEQp/zG4aXCg2Wi7NeqCIlKJ4xtbo+cljBDvLQr5n1PfHDMCArWk2CfPKZzigpVBKq5u7EHZkCv8WMKJDo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7182
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v8 2/3] drm/xe: Notify Userspace when gt
 reset fails
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

Hi Rodrigo,

On 26-07-2023 20:09, Rodrigo Vivi wrote:
> On Tue, Jul 25, 2023 at 09:21:14PM +0530, Himal Prasad Ghimiray wrote:
>> Send uevent in case of gt reset failure. This intimation can be used by
>> userspace monitoring tool to do the device level reset/reboot
>> when GT reset fails. udevadm can be used to monitor the uevents.
>>
>> v2:
>> - Support only gt failure notification (Rodrigo)
>>
>> v3
>> - Rectify the comments in header file.
>>
>> v4
>> - Use pci kobj instead of drm kobj for notification.(Rodrigo)
>> - Cleanup (Badal)
>>
>> Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
>> Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> Reviewed-by: Badal Nilawar <badal.nilawar@intel.com>
>> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> Cc: Matt Roper Matt Roper <matthew.d.roper@intel.com>
>
>> ---
>>   drivers/gpu/drm/xe/xe_gt.c | 17 +++++++++++++++++
>>   include/uapi/drm/xe_drm.h  |  8 ++++++++
>>   2 files changed, 25 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
>> index 3e32d38aeeea..f4766fb6bfdb 100644
>> --- a/drivers/gpu/drm/xe/xe_gt.c
>> +++ b/drivers/gpu/drm/xe/xe_gt.c
>> @@ -8,6 +8,7 @@
>>   #include <linux/minmax.h>
>>   
>>   #include <drm/drm_managed.h>
>> +#include <drm/xe_drm.h>
>>   
>>   #include "regs/xe_gt_regs.h"
>>   #include "xe_bb.h"
>> @@ -500,6 +501,19 @@ static int do_gt_restart(struct xe_gt *gt)
>>   	return 0;
>>   }
>>   
>> +static void xe_uevent_gt_reset_failure(struct pci_dev *pdev, u8 id)
>> +{
>> +	char *reset_event[4];
>> +
>> +	reset_event[0] = XE_RESET_FAILED_UEVENT "=NEEDS_RESET";
>> +	reset_event[1] = "RESET_FAILED=gt";
>> +	reset_event[2] = kasprintf(GFP_KERNEL, "RESET_ID=%d", id);
> should we also put which tile this is coming from?
> Matt?
>
>> +	reset_event[3] = NULL;
>> +	kobject_uevent_env(&pdev->dev.kobj, KOBJ_CHANGE, reset_event);
> Himal, could you please paste here an example of the output of this event
> when monitoring it with the:
> $ udevadm monitor
> ?

Please find the output from udevadm  monitor below


KERNEL[471.352287] change 
/devices/pci0000:89/0000:89:02.0/0000:8a:00.0/0000:8b:01.0/0000:8c:00.0 
(pci)
ACTION=change
DEVPATH=/devices/pci0000:89/0000:89:02.0/0000:8a:00.0/0000:8b:01.0/0000:8c:00.0
SUBSYSTEM=pci
DEVICE_STATUS=NEEDS_RESET
RESET_FAILED=gt
RESET_ID=0
DRIVER=xe
PCI_CLASS=38000
PCI_ID=8086:0BD6
PCI_SUBSYS_ID=8086:0000
PCI_SLOT_NAME=0000:8c:00.0
MODALIAS=pci:v00008086d00000BD6sv00008086sd00000000bc03sc80i00
SEQNUM=8817

BR

Himal


>
>> +
>> +	kfree(reset_event[2]);
>> +}
>> +
>>   static int gt_reset(struct xe_gt *gt)
>>   {
>>   	int err;
>> @@ -550,6 +564,9 @@ static int gt_reset(struct xe_gt *gt)
>>   	xe_device_mem_access_put(gt_to_xe(gt));
>>   	xe_gt_err(gt, "reset failed (%pe)\n", ERR_PTR(err));
>>   
>> +	/* Notify userspace about gt reset failure */
>> +	xe_uevent_gt_reset_failure(to_pci_dev(gt_to_xe(gt)->drm.dev), gt->info.id);
>> +
>>   	return err;
>>   }
>>   
>> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
>> index 347351a8f618..fdacee0a27c5 100644
>> --- a/include/uapi/drm/xe_drm.h
>> +++ b/include/uapi/drm/xe_drm.h
>> @@ -16,6 +16,14 @@ extern "C" {
>>    * subject to backwards-compatibility constraints.
>>    */
>>   
>> +/*
>> + * Uevent generated by xe on it's pci node.
>> + *
>> + * XE_RESET_FAILED_UEVENT - Event is generated when attempt to reset engine
>> + * fails. The value supplied with the event is always "NEEDS_RESET".
>> + */
>> +#define XE_RESET_FAILED_UEVENT "DEVICE_STATUS"
>> +
>>   /**
>>    * struct xe_user_extension - Base class for defining a chain of extensions
>>    *
>> -- 
>> 2.25.1
>>
