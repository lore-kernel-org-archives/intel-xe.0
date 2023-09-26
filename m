Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 965EAE8181D
	for <intel-xe@archiver.kernel.org>; Tue, 26 Sep 2023 05:09:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58C3C10E0B0;
	Tue, 26 Sep 2023 05:09:06 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E973210E0B0
 for <intel-xe@lists.freedesktop.org>; Tue, 26 Sep 2023 05:09:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695704944; x=1727240944;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Hyj+3/8+jfbTnldhBCp31oAAJ5wFBV3qCDm+CaEGrvk=;
 b=mlwgC8QDuJYqItt99w8/CZOvHZg7urb60MvQ0UrG35hMVQ7vsnJKYuCw
 5OK3g4a2Ml+uUIPkntif2oeqsRisye5lAJaoALWBfKTyt9iU91rAV4Nxv
 cV7VlYqcZ25SFE238k8YkA3bIb4YFqq2MPF9FJFwavMb/CnTIW2nF+fH/
 OxfUgLXRgWXiO9zpVIw1k3wi6vNhpZvJA8FIu591Zv73S/WZWGdDQuOF4
 Opq6O4U1Hejqf/LTJSyFfCSwqErTC0Or+QPRW5EbXL7Zmon/t2FXr914W
 aP4eDMAF7on3alTjSBoY7vtWVWcZrxHaMOpoxcagWbWvZrKsNqU9D4TUB Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="371819133"
X-IronPort-AV: E=Sophos;i="6.03,177,1694761200"; d="scan'208";a="371819133"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2023 22:09:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="783821407"
X-IronPort-AV: E=Sophos;i="6.03,177,1694761200"; d="scan'208";a="783821407"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 25 Sep 2023 22:08:56 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Mon, 25 Sep 2023 22:08:56 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Mon, 25 Sep 2023 22:08:55 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Mon, 25 Sep 2023 22:08:55 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.107)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Mon, 25 Sep 2023 22:08:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OmZ/kwOTXBC9wEvihVPOKy80ZRrvOx4HjvIScjx5tYBU4zi0wmJH1xd9W3FqS8n+fVwuU+P+iV87FMk8j/eO32JytXxCZU9Tbvz6S2mFx5Y2oCnw1RNUMIXp8gEhFEV93/meF0Xo/7ZRvacKkCxWXp1q8Qq1sZMLRlegwsJCgufy9WephXVK3FgyBE8gnooJxhTgFojjmAp5OXjJtPQKdkLk7hiH4ayVQ+gU8rVG1Sqk26hugwKyN5Eaz+3ianWJTlXBYM1kLe8fXu5KZ8t3qV5/WaeHyd76q3rr+e27/0dprCgibZGSGqR4lkTqlttRpCTW+Yu3SmsKFKPl8wpz7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6PedkVFvBDGFCBnEo/ONWTj3iKDqf4raMo92ZweomJM=;
 b=nnDfym5bVDWE//H656MqY+kVRtJj2B/VgV12mrHHWrufdzvaBzoII+9gyuD6wL3sSks2wXwG+p+6Yxacltbmt0IyWiraw4YN5R+zGsP+3n617tVT5DE7oi9QIkbQGmVvQGC/vSqt0M+tLBzbGQr+HNRvj0plrjT5gC6frhHJCl0j2p+Qp7nZ/d63MSoyi9S7JkEEjfCcmXNbCnuhHlQ49dMu90UKKJ5oXPqp/JL85/bawJhJRH5Bh0mQBUlAq/HazIeRjAkpsJB9qbuwLV46Udx50ybTXWKn5cV+1LCAhKVFaAujJZjuUPDR0p/vzP+aeZEOoDKw0zLLVdJZEg/nwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by DM4PR11MB5455.namprd11.prod.outlook.com (2603:10b6:5:39b::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.28; Tue, 26 Sep
 2023 05:08:48 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::82e:c2f3:6b0f:3586]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::82e:c2f3:6b0f:3586%4]) with mapi id 15.20.6813.027; Tue, 26 Sep 2023
 05:08:48 +0000
Message-ID: <ed406599-055d-4189-85e4-6232f5e8d127@intel.com>
Date: Tue, 26 Sep 2023 10:38:36 +0530
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20230823085842.1440523-1-himal.prasad.ghimiray@intel.com>
 <20230823085842.1440523-3-himal.prasad.ghimiray@intel.com>
 <e6c3dae0-0713-db9e-93ef-cffc24b3b8a3@linux.intel.com>
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <e6c3dae0-0713-db9e-93ef-cffc24b3b8a3@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN3PR01CA0171.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:de::14) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|DM4PR11MB5455:EE_
X-MS-Office365-Filtering-Correlation-Id: 71512d5b-bbe9-4363-de37-08dbbe4eaa60
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pGDJtftnU2fb7kZ33WRZRU/YvTOBzNlRRA5+GcKkuzhxIr37lkjboQ7xg9S4M5ArWpmslPjBqJfsPahqYfCyirfPhwCmKZztAx+/7IH4KLszl/Cjs6dYlGeZMtr74JHYHbkDPzUfDwUMZGx4XUqkrZSohQbHnX05MUcf6dm5aV/iSAJe+N2+UsC15DJmx3yYUieXoL8hZCSKmRJfQ3SapiYyTzLFB7Ci8JLGO+UwHMaJIfBUheixT3pklsdZTRqoi+QlNBsa8AkwPy6toHvpGLbMISEgJklpvq25V29Gr5N0miG3KWTX9vs5DICYLVF7q4jlmvUbpZfFUIXf5n3mIhKC08X0HtvOo5wxFhHMH5wgZAO/zVfvb1L9Y9pazskrB7U2/fCbitQrGpxif9clXb/4F3gEhx7DSkhMfTNnNAZ70vJuEwFXatfEu0IWX6ODbuNI1VqNyfcIYguWSFEFHa7uI+K51xnKxJQLaaTQz7kKvxycpE19czR7Uzx9jyb18CiFKQ446kzRxXxdhlL731fthR3EOOUbuezRTWfZZ11pk9uGfmwU+lsG+NSrm8itqUmOZs4oseDq1Fh8wsMSaoOGKqU2zoKUNKzHm/E+WUi7UWZ5jxzGFAgZo7QUCQ72GF8t5N3kphfbJ8nYWMxpgg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(396003)(366004)(39860400002)(136003)(376002)(230922051799003)(186009)(1800799009)(451199024)(53546011)(6486002)(6506007)(6666004)(478600001)(83380400001)(26005)(2616005)(6512007)(30864003)(2906002)(41300700001)(66946007)(316002)(66556008)(5660300002)(66476007)(4326008)(8936002)(8676002)(54906003)(36756003)(86362001)(38100700002)(31696002)(82960400001)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VVI5MWdFVG5Qd2tvUUNSRlhOVExpdExoUWxPMWlBWHJHaXJNNytORDJmNW5S?=
 =?utf-8?B?WXhPREZlci9IOE5jSWJKajhwN3VRQ0tPVGJTSklESFZZSUYxUkNPUXN6MXdy?=
 =?utf-8?B?Tnd1dVdRQjFBdm91Z0dmZkZLd0JPVm5xdzlMWTFSektlRXRMMnY1U0cxUjNt?=
 =?utf-8?B?dFpmVS8rVXVsRTlGRVcrUGhSRWtSaytENFRKOVRNcGxBM0xxQnNNdlo2Z0k2?=
 =?utf-8?B?dDcxL3pnckcxd1ZRMXdrTlE3d3JFcExHbkZPa2NzbThHZExUSHlxZ292TU9Q?=
 =?utf-8?B?QkpNeCs2MXZySjBhL3lHakg3QXE5THJ3VzMraDk2QjJ5MDI3dDF3RUhjN0VV?=
 =?utf-8?B?U0VoUjBnYmZXb3REa3IyaWFKTjlIT2xnVCtlNjUvNDd3ZWtvRG1USHFJK3BH?=
 =?utf-8?B?V0lqaXZVVVlVbW5oeFJrYUdlSlFGNC9ZaEVQS0hhRnZhODlqS05lQll1TjBW?=
 =?utf-8?B?eS9UWTFzcmFicG8rUjVBbXdIU1Bud0ZhckVWVXlpK1ZsdWord0R1T0ZpOHZi?=
 =?utf-8?B?MFA2Q3dRbTVsSTJTM2tpc1lNaXVOcmk5MC9iakswT1JLeHFmY1orOTJZVW5J?=
 =?utf-8?B?ZnhjSWtsL2pSOWN6MnZ5REhHRVpiZXdSUTZXVUhDZDlNWEtzK045V3c2OWx3?=
 =?utf-8?B?eW54TkRsenJFVkFKWGxLalVFczliR2hoVDhGc3lJNEZES2xNWlhlT2xLdmlR?=
 =?utf-8?B?WXFvaWtHcE0zTzd4L0FGTDBmR3U4VTF0QTlXcktMSUNyT2FXZWY2UmViR0Ex?=
 =?utf-8?B?OXRuQjhxV3BZeEpGeVExWlBGZDRHaHE1c1R2M1ppVGhINktPRnZKRXJCTlNG?=
 =?utf-8?B?QUVBV1cwZWFpd0RZU3BUYTFDK1dOaDFuMktidVJwYkZkT0J3a09NVG1PRXJx?=
 =?utf-8?B?aC91RThuU3dSNzlXQ2ptWjc1QWsvcGF0UjhzWEFDSHZzZ21iai9razB3YjVJ?=
 =?utf-8?B?UHdBSG03V1BSd0lKT0FGdENGSnJ5d1JBdDhMcFphd1kvWWJpRHdSTjdFT0JS?=
 =?utf-8?B?d25uV3BlanhESlp4Uis4QStXV1NBb1drLzVRbWdpOHl5RnRuNHdoSW9qcFc4?=
 =?utf-8?B?YU53SlFyVjlGRHU5cWRjSmxiTk5WUi92T1laOW8za0gvblJ3MVJSTlpmSkpj?=
 =?utf-8?B?SitFRmlvdUtpRGlQeTAwdG1tS1NHWTFqRENGc3BXaVpTTG9vMHo2bmdsYmdZ?=
 =?utf-8?B?UVI3L05zZzJmMWlXKzF2OUdsTDdLM05WYytLN3pITEROUU1TdG43bERPZXUy?=
 =?utf-8?B?Z1BrYTZ2andkbHo0WnJMbEpQYVBmVEdXdnJtYm9DNDRreDdUcHZEL0k1U0Zt?=
 =?utf-8?B?UmwxZFNvam1GelZrOXpGSVZVVnpQMGxQZndjSDcweWdRWUtCcEp4Z09hVlND?=
 =?utf-8?B?VEhRY3daNEFaUDlRcXVpTHN0ejZ4UGNXYVpnSmRZTlRrR3pXdmFadnNSSnhR?=
 =?utf-8?B?T25aa2JLaDRmT3EvT2F1bjJmQzNFTURpbWRpUFRQd1FEbS9uS1dIcENKakNN?=
 =?utf-8?B?N0hYZkY1b0t5N09FTm1tSldjdythV0Q5Wmk4Y3ZRbjNJdStSNWRPclZscnl2?=
 =?utf-8?B?YW9zVTNURFZKVFZUOVMxOGVjQ1NhZVVtZVFvV0VjVkxHNG4veGRWL0gzZWpr?=
 =?utf-8?B?dWlLTi92cmlISm9FK1hBdGhjZDVoR1dGbFMvbFljYjI1b2NtbzdyTGVYeEsw?=
 =?utf-8?B?cVk2TFFadVczQWd1YS8vbWRPdHFFUWUzY1dHUUVqNU92Z1pEVVZMcHMxMmpB?=
 =?utf-8?B?NUtyM2NHZFZ6RW5OMHBJVTFhZC9nRXNlM1FIb1cxVEcyU1dqVjgvK1UrczJq?=
 =?utf-8?B?MTJCRzM3cWdsa3hMcXlBQnZMTnkzZERRbmtOUE5QdlVDVG5RUThWdzlSK1pS?=
 =?utf-8?B?MkJ2UU13SE1ZM2xqMmNNL2tJalplMWU4bE43QlpZOThTblN5SUhDYzVNQlZW?=
 =?utf-8?B?THAzMmF3U00wb2RiZmpZWnk4bUJYeTNVVndNQlRqTlhFOXMyTFJYS0wrejJw?=
 =?utf-8?B?V1BXSlBORG14WlVvZFJpUUM4N09OelpUaHJLVTZkTW5MMUtDQTFjeHAwaFZm?=
 =?utf-8?B?WGhNdCs1aXN6cjVrQUl1MXdmemN6NFIxVWFFYkNSRWdiWUV5NGJPSktkL3V4?=
 =?utf-8?B?WmlCNGN4K1pDMkp4aE53S1d5VDNXK0lLclN4MTk2OHEyRVlEb25lTndiMHJk?=
 =?utf-8?Q?4ACeUyMPXEKzX1rcMzf42ss=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 71512d5b-bbe9-4363-de37-08dbbe4eaa60
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2023 05:08:48.1301 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2fV7biAKN2YVML15NNaxBn3Ks255jtElrKvPztTi+EIocrwXnUtU6W1G7kVs4CfOwpwy74ru+3ZA4Edr90P8qhdgBAkXPSP/4emHyKJCaRQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5455
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v5 2/4] drm/xe: Log and count the GT hardware
 errors.
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
Cc: Jani Nikula <jani.nikula@intel.com>, Matt Roper <matthew.d.roper@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>


On 26-09-2023 09:50, Aravind Iddamsetty wrote:
> On 23/08/23 14:28, Himal Prasad Ghimiray wrote:
>> For the errors reported by GT unit, read the GT error register.
>> Log and count these errors and clear the error register.
>>
>> Bspec: 53088, 53089, 53090
>>
>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> Cc: Matt Roper <matthew.d.roper@intel.com>
>> Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
>> Cc: Jani Nikula <jani.nikula@intel.com>
>> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>> ---
>>   drivers/gpu/drm/xe/regs/xe_gt_error_regs.h | 13 +++
>>   drivers/gpu/drm/xe/xe_device_types.h       |  1 +
>>   drivers/gpu/drm/xe/xe_gt_types.h           |  7 ++
>>   drivers/gpu/drm/xe/xe_hw_error.c           | 96 +++++++++++++++++++++-
>>   drivers/gpu/drm/xe/xe_hw_error.h           | 24 ++++++
>>   5 files changed, 140 insertions(+), 1 deletion(-)
>>   create mode 100644 drivers/gpu/drm/xe/regs/xe_gt_error_regs.h
>>
>> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_error_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_error_regs.h
>> new file mode 100644
>> index 000000000000..6180704a6149
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/regs/xe_gt_error_regs.h
>> @@ -0,0 +1,13 @@
>> +/* SPDX-License-Identifier: MIT */
>> +/*
>> + * Copyright © 2023 Intel Corporation
>> + */
>> +#ifndef XE_GT_ERROR_REGS_H_
>> +#define XE_GT_ERROR_REGS_H_
>> +
>> +#define _ERR_STAT_GT_COR                0x100160
>> +#define _ERR_STAT_GT_NONFATAL           0x100164
>> +#define ERR_STAT_GT_REG(x)              XE_REG(_PICK_EVEN((x), \
>> +						_ERR_STAT_GT_COR, \
>> +						_ERR_STAT_GT_NONFATAL))
>> +#endif
>> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
>> index 4e4184977709..96029d3348b3 100644
>> --- a/drivers/gpu/drm/xe/xe_device_types.h
>> +++ b/drivers/gpu/drm/xe/xe_device_types.h
>> @@ -368,6 +368,7 @@ struct xe_device {
>>   	/** @hardware_errors_regs: list of hw error regs*/
>>   	struct hardware_errors_regs {
>>   		const struct err_msg_cntr_pair *dev_err_stat[HARDWARE_ERROR_MAX];
>> +		const struct err_msg_cntr_pair *err_stat_gt[HARDWARE_ERROR_MAX];
> same here should we make it part of struct xe_gt?
Same comment as in previous patch.
>>   	} hw_err_regs;
>>   
>>   	/* private: */
>> diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
>> index 35b8c19fa8bf..5daff5c434c7 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_types.h
>> +++ b/drivers/gpu/drm/xe/xe_gt_types.h
>> @@ -9,10 +9,12 @@
>>   #include "xe_force_wake_types.h"
>>   #include "xe_gt_idle_sysfs_types.h"
>>   #include "xe_hw_engine_types.h"
>> +#include "xe_hw_error.h"
>>   #include "xe_hw_fence_types.h"
>>   #include "xe_reg_sr_types.h"
>>   #include "xe_sa_types.h"
>>   #include "xe_uc_types.h"
>> +#include "regs/xe_gt_error_regs.h"
>>   
>>   struct xe_exec_queue_ops;
>>   struct xe_migrate;
>> @@ -346,6 +348,11 @@ struct xe_gt {
>>   		/** @oob: bitmap with active OOB workaroudns */
>>   		unsigned long *oob;
>>   	} wa_active;
>> +
>> +	/** @gt_hw_errors: hardware errors reported for the gt */
>> +	struct gt_hw_errors {
>> +		 unsigned long count[XE_GT_HW_ERROR_MAX];
>> +	} errors;
>>   };
>>   
>>   #endif
>> diff --git a/drivers/gpu/drm/xe/xe_hw_error.c b/drivers/gpu/drm/xe/xe_hw_error.c
>> index 357d0f962d91..10aad0c396fb 100644
>> --- a/drivers/gpu/drm/xe/xe_hw_error.c
>> +++ b/drivers/gpu/drm/xe/xe_hw_error.c
>> @@ -118,14 +118,48 @@ static const struct err_msg_cntr_pair dev_err_stat_correctable_reg[] = {
>>   	[1 ... 31]  =  {"Undefined",		XE_TILE_HW_ERR_UNKNOWN_CORR},
>>   };
>>   
>> +static const struct err_msg_cntr_pair err_stat_gt_fatal_reg[] = {
>> +	[0]         =  {"Undefined",		XE_GT_HW_ERR_UNKNOWN_FATAL},
>> +	[1]         =  {"Array BIST",		XE_GT_HW_ERR_ARR_BIST_FATAL},
>> +	[2]         =  {"Undefined",		XE_GT_HW_ERR_UNKNOWN_FATAL},
>> +	[3]         =  {"FPU",			XE_GT_HW_ERR_FPU_FATAL},
>> +	[4]         =  {"L3 Double",		XE_GT_HW_ERR_L3_DOUB_FATAL},
>> +	[5]         =  {"L3 ECC Checker",	XE_GT_HW_ERR_L3_ECC_CHK_FATAL},
>> +	[6]         =  {"GUC SRAM",		XE_GT_HW_ERR_GUC_FATAL},
>> +	[7]         =  {"Undefined",		XE_GT_HW_ERR_UNKNOWN_FATAL},
>> +	[8]         =  {"IDI PARITY",		XE_GT_HW_ERR_IDI_PAR_FATAL},
>> +	[9]	    =  {"SQIDI",		XE_GT_HW_ERR_SQIDI_FATAL},
>> +	[10 ... 11] =  {"Undefined",		XE_GT_HW_ERR_UNKNOWN_FATAL},
>> +	[12]        =  {"SAMPLER",		XE_GT_HW_ERR_SAMPLER_FATAL},
>> +	[13]        =  {"SLM",			XE_GT_HW_ERR_SLM_FATAL},
>> +	[14]        =  {"EU IC",		XE_GT_HW_ERR_EU_IC_FATAL},
>> +	[15]        =  {"EU GRF",		XE_GT_HW_ERR_EU_GRF_FATAL},
>> +	[16 ... 31] =  {"Undefined",            XE_GT_HW_ERR_UNKNOWN_FATAL},
>> +};
> as the fatal error path is different, these shall be enabled in the patch that enables
> fatal error processing.
Will squash patch 1 and 4. so fatal reporting will be retained here.
>> +
>> +static const struct err_msg_cntr_pair err_stat_gt_correctable_reg[] = {
>> +	[0]         = {"L3 SINGLE",		XE_GT_HW_ERR_L3_SNG_CORR},
>> +	[1]         = {"SINGLE BIT GUC SRAM",	XE_GT_HW_ERR_GUC_CORR},
>> +	[2 ... 11]  = {"Undefined",		XE_GT_HW_ERR_UNKNOWN_CORR},
>> +	[12]        = {"SINGLE BIT SAMPLER",	XE_GT_HW_ERR_SAMPLER_CORR},
>> +	[13]        = {"SINGLE BIT SLM",	XE_GT_HW_ERR_SLM_CORR},
>> +	[14]        = {"SINGLE BIT EU IC",	XE_GT_HW_ERR_EU_IC_CORR},
>> +	[15]        = {"SINGLE BIT EU GRF",	XE_GT_HW_ERR_EU_GRF_CORR},
>> +	[16 ... 31] = {"Undefined",             XE_GT_HW_ERR_UNKNOWN_CORR},
>> +};
>> +
>>   void xe_assign_hw_err_regs(struct xe_device *xe)
>>   {
>>   	const struct err_msg_cntr_pair **dev_err_stat = xe->hw_err_regs.dev_err_stat;
>> +	const struct err_msg_cntr_pair **err_stat_gt = xe->hw_err_regs.err_stat_gt;
>>   
>>   	if (xe->info.platform == XE_DG2) {
>>   		dev_err_stat[HARDWARE_ERROR_CORRECTABLE] = dg2_err_stat_correctable_reg;
>>   		dev_err_stat[HARDWARE_ERROR_NONFATAL] = dg2_err_stat_nonfatal_reg;
>>   		dev_err_stat[HARDWARE_ERROR_FATAL] = dg2_err_stat_fatal_reg;
>> +
>> +		err_stat_gt[HARDWARE_ERROR_CORRECTABLE] = err_stat_gt_correctable_reg;
>> +		err_stat_gt[HARDWARE_ERROR_FATAL] = err_stat_gt_fatal_reg;
>>   	} else if (xe->info.platform == XE_PVC) {
>>   		dev_err_stat[HARDWARE_ERROR_CORRECTABLE] = pvc_err_stat_correctable_reg;
>>   		dev_err_stat[HARDWARE_ERROR_NONFATAL] = pvc_err_stat_nonfatal_reg;
>> @@ -135,9 +169,67 @@ void xe_assign_hw_err_regs(struct xe_device *xe)
>>   		dev_err_stat[HARDWARE_ERROR_CORRECTABLE] = dev_err_stat_correctable_reg;
>>   		dev_err_stat[HARDWARE_ERROR_NONFATAL] = dev_err_stat_nonfatal_reg;
>>   		dev_err_stat[HARDWARE_ERROR_FATAL] = dev_err_stat_fatal_reg;
>> +
>> +		err_stat_gt[HARDWARE_ERROR_CORRECTABLE] = err_stat_gt_correctable_reg;
>> +		err_stat_gt[HARDWARE_ERROR_FATAL] = err_stat_gt_fatal_reg;
> what platforms are targeted as part of else?
Assumption is all platforms will support GT error reporting.
>>   	}
>>   }
>>   
>> +static void
>> +xe_gt_hw_error_handler(struct xe_gt *gt, const enum hardware_error hw_err)
> the function is defined here and changed in next patch can't we have a
> common one between these.
WIll address.
>> +{
>> +	const char *hw_err_str = hardware_error_type_to_str(hw_err);
>> +	const struct err_msg_cntr_pair *errstat;
>> +	struct hardware_errors_regs *err_regs;
>> +	unsigned long errsrc;
>> +	const char *errmsg;
>> +	u32 indx;
>> +	u32 errbit;
>> +
>> +	if (gt_to_xe(gt)->info.platform == XE_PVC)
>> +		return;
>> +
>> +	lockdep_assert_held(&gt_to_xe(gt)->irq.lock);
>> +	err_regs = &gt_to_xe(gt)->hw_err_regs;
>> +	errsrc = xe_mmio_read32(gt, ERR_STAT_GT_REG(hw_err));
>> +	if (!errsrc) {
>> +		drm_err_ratelimited(&gt_to_xe(gt)->drm, HW_ERR
>> +				    "GT%d detected ERR_STAT_GT_REG_%s blank!\n",
>> +				    gt->info.id, hw_err_str);
>> +		return;
>> +	}
>> +
>> +	drm_info(&gt_to_xe(gt)->drm, HW_ERR "GT%d ERR_STAT_GT_REG_%s=0x%08lx\n",
>> +		 gt->info.id, hw_err_str, errsrc);
> will drm_dbg makes more sense here and everywhere else to dump the register contents
Ya sure.
>> +
>> +	if (hw_err == HARDWARE_ERROR_NONFATAL) {
>> +		/*  The GT Non Fatal Error Status Register has only reserved bits
>> +		 *  Nothing to service.
>> +		 */
>> +		drm_err_ratelimited(&gt_to_xe(gt)->drm, HW_ERR "GT%d detected %s error\n",
>> +				    gt->info.id, hw_err_str);
>> +		goto clear_reg;
>> +	}
>> +
>> +	errstat = err_regs->err_stat_gt[hw_err];
>> +	for_each_set_bit(errbit, &errsrc, 32) {
>> +		errmsg = errstat[errbit].errmsg;
>> +		indx = errstat[errbit].cntr_indx;
>> +
>> +		if (hw_err == HARDWARE_ERROR_FATAL)
>> +			drm_err_ratelimited(&gt_to_xe(gt)->drm, HW_ERR
>> +					    "GT%d detected %s %s error, bit[%d] is set\n",
>> +					    gt->info.id, errmsg, hw_err_str, errbit);
> this shall be part of last patch in the series, where the fatal errors are processed.
>> +		else
>> +			drm_warn(&gt_to_xe(gt)->drm, HW_ERR
>> +				 "GT%d detected %s %s error, bit[%d] is set\n",
>> +				 gt->info.id, errmsg, hw_err_str, errbit);
>> +
>> +		gt->errors.count[indx]++;
>> +	}
>> +clear_reg: xe_mmio_write32(gt, ERR_STAT_GT_REG(hw_err), errsrc);
> a new line after a label is preferred.
ok.
>> +}
>> +
>>   static void
>>   xe_hw_error_source_handler(struct xe_tile *tile, const enum hardware_error hw_err)
>>   {
>> @@ -174,7 +266,6 @@ xe_hw_error_source_handler(struct xe_tile *tile, const enum hardware_error hw_er
>>   			drm_warn(&tile_to_xe(tile)->drm,
>>   				 HW_ERR "TILE%d detected %s %s error, bit[%d] is set\n",
>>   				 tile->id, errmsg, hw_err_str, errbit);
>> -
>>   		else
>>   			drm_err_ratelimited(&tile_to_xe(tile)->drm,
>>   					    HW_ERR "TILE%d detected %s %s error, bit[%d] is set\n",
>> @@ -182,6 +273,9 @@ xe_hw_error_source_handler(struct xe_tile *tile, const enum hardware_error hw_er
>>   		tile->errors.count[indx]++;
>>   	}
>>   
>> +	if (errsrc & REG_BIT(0))
> define the BIT and use it here.
Hmm
>> +		xe_gt_hw_error_handler(tile->primary_gt, hw_err);
>> +
>>   	xe_mmio_write32(mmio, DEV_ERR_STAT_REG(hw_err), errsrc);
>>   unlock:
>>   	spin_unlock_irqrestore(&tile_to_xe(tile)->irq.lock, flags);
>> diff --git a/drivers/gpu/drm/xe/xe_hw_error.h b/drivers/gpu/drm/xe/xe_hw_error.h
>> index c0c05b9130eb..82c947247c27 100644
>> --- a/drivers/gpu/drm/xe/xe_hw_error.h
>> +++ b/drivers/gpu/drm/xe/xe_hw_error.h
>> @@ -51,6 +51,30 @@ enum xe_tile_hw_errors {
>>   	XE_TILE_HW_ERROR_MAX,
>>   };
>>   
>> +/* Count of GT Correctable and FATAL HW ERRORS */
>> +enum xe_gt_hw_errors {
>> +	XE_GT_HW_ERR_L3_SNG_CORR,
>> +	XE_GT_HW_ERR_GUC_CORR,
>> +	XE_GT_HW_ERR_SAMPLER_CORR,
>> +	XE_GT_HW_ERR_SLM_CORR,
>> +	XE_GT_HW_ERR_EU_IC_CORR,
>> +	XE_GT_HW_ERR_EU_GRF_CORR,
>> +	XE_GT_HW_ERR_UNKNOWN_CORR,
>> +	XE_GT_HW_ERR_ARR_BIST_FATAL,
>> +	XE_GT_HW_ERR_FPU_FATAL,
>> +	XE_GT_HW_ERR_L3_DOUB_FATAL,
>> +	XE_GT_HW_ERR_L3_ECC_CHK_FATAL,
>> +	XE_GT_HW_ERR_GUC_FATAL,
>> +	XE_GT_HW_ERR_IDI_PAR_FATAL,
>> +	XE_GT_HW_ERR_SQIDI_FATAL,
>> +	XE_GT_HW_ERR_SAMPLER_FATAL,
>> +	XE_GT_HW_ERR_SLM_FATAL,
>> +	XE_GT_HW_ERR_EU_IC_FATAL,
>> +	XE_GT_HW_ERR_EU_GRF_FATAL,
>> +	XE_GT_HW_ERR_UNKNOWN_FATAL,
>> +	XE_GT_HW_ERROR_MAX,
>> +};
> same here, define all fatals where they are actually used.
>> +
>>   struct err_msg_cntr_pair {
>>   	const char *errmsg;
>>   	const u32 cntr_indx;
> Thanks,
> Aravind.
