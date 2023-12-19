Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C60DC41535
	for <intel-xe@archiver.kernel.org>; Tue, 19 Dec 2023 16:41:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8EBF10E1C2;
	Tue, 19 Dec 2023 16:41:33 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7571F10E1C2
 for <intel-xe@lists.freedesktop.org>; Tue, 19 Dec 2023 16:41:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1703004092; x=1734540092;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=JE/1aS3WRcn2s20aPTRoNivlCvkA+kUMH8DZK/7OK48=;
 b=knuhtwxjIHhIl3vImt0WXkQ1rqufERp/Z7elOtHps2kHzl5CTmz///ZK
 4L9KaHezmokbQN1QdevH6NMM7Ekj/Q9pT25EIT36Hpn+POGph35BI75M3
 JHzUEFRKWYExOfNXdi5Pl/KOYqSc371bb5XNPHwvg0jag5XSjQegxLaxs
 sDtQKY4pf0F6VxEDLNi1vyhmUtaQQ1qUir9wyl+LMbNNlgFZquDrHO3sI
 4Vbc2GXGir3Lg3BSWZNpWBD8Swopg8Mb8wKcK/iHbtydL68Z4/LtNQnf5
 VyOe2UfWMYmGPAhXhi5+SSgYVYdQcPzO1Me0/zMC+FHJ1sMBmkDhOUem2 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10929"; a="9058846"
X-IronPort-AV: E=Sophos;i="6.04,288,1695711600"; 
   d="scan'208";a="9058846"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2023 08:41:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10929"; a="866694976"
X-IronPort-AV: E=Sophos;i="6.04,288,1695711600"; d="scan'208";a="866694976"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by FMSMGA003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Dec 2023 08:41:30 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 19 Dec 2023 08:40:58 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 19 Dec 2023 08:40:57 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 19 Dec 2023 08:40:57 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.101)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 19 Dec 2023 08:40:57 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bhu/wj6ro5i4ZnjsG2Fyx8fznInJwEi8O63cyGNqr7MgbUOGNN7riVY0QZtgE6/x/+tAefmMp4TQJjxJjoPC5EnS2rZPoR9vneuA2YcZy54zb1blcpnhkQG8ez7dyNlDGtt8B15W6FGS/Bgm7Bf/eGaka8J0Cj3Yq01iuCIGC5qpX6eyG2mZPT1Z4x1tmU6tr70XJxz782FlekKPf/wMaD4SJCF/Upt7YrvGnVZMoqzLlEFkz29ttBSmdgigl0XLialhPGsbLqheGExj8YKY3R1alTo7HLpsgsCvzj/seZbUT6E8o5Hlw0WGLkqsiqu189Op571W5ZVFS6xaq6rqNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jKVylBmFk4lAmdY6fQIGxmPcRCk/BWsRqilDO+P8Up0=;
 b=TRot/U11C2RHwKrSpujZ9TEGfZwNmDlfaRa9InHgC5+JiizQMU7fXDyvR/aFe4ifCR3raGHXmbRnTPoZQs4uqYgofe5jwXc1jcKYKrTttzSsp20ddv2nawI5MNA92/PNyJyGDsKqlNxe7yAEWjTlAnGIgm3gGb4KhydMEEtA+BZ0Un44BLbkI2UJXwXNxXXZnzbLgtFwxi7HlFkwibFLCJyYIc/34GQn7jmNWrb5tntnLntG161BbUfYlvnNl93Wun3nR/+ot/bzcz5tV9mYm7AlNOZRZBHI+BXtoMiHPJqI6S8gAYGT+XfPjjD1L3otq1g+KxDKGEshl+37ALXy/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM6PR11MB2987.namprd11.prod.outlook.com (2603:10b6:5:65::14) by
 DM4PR11MB5293.namprd11.prod.outlook.com (2603:10b6:5:390::20) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7091.38; Tue, 19 Dec 2023 16:40:54 +0000
Received: from DM6PR11MB2987.namprd11.prod.outlook.com
 ([fe80::e73e:dcc0:c5bb:49b9]) by DM6PR11MB2987.namprd11.prod.outlook.com
 ([fe80::e73e:dcc0:c5bb:49b9%7]) with mapi id 15.20.7113.016; Tue, 19 Dec 2023
 16:40:54 +0000
Date: Tue, 19 Dec 2023 08:40:44 -0800
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Subject: Re: [PATCH 07/17] drm/xe/oa/uapi: Define and parse OA stream
 properties
Message-ID: <ZYHHjCKrUzdmpPMT@unerlige-ril>
References: <20231208064329.2387604-1-ashutosh.dixit@intel.com>
 <20231208064329.2387604-8-ashutosh.dixit@intel.com>
 <875y0uvqvm.wl-ashutosh.dixit@intel.com>
 <ZYHEHDMRyNW9et5o@unerlige-ril>
 <5b03cfb7-42c6-488a-8923-5a0b039e2049@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5b03cfb7-42c6-488a-8923-5a0b039e2049@intel.com>
X-ClientProxiedBy: SJ0PR13CA0011.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::16) To DM6PR11MB2987.namprd11.prod.outlook.com
 (2603:10b6:5:65::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB2987:EE_|DM4PR11MB5293:EE_
X-MS-Office365-Filtering-Correlation-Id: 6debc912-d8af-4095-5966-08dc00b14477
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UHN0AQYXEeAV+QS8sfsHSqWrztDrt7BgQ+7VC4HokXlelTcvOtulz0e2GTTNZF84+G1WCef0VUCqKKPn7pHEFGSLsuNHLEAsTjuIzTmHgIwvIEJwfmpVgSDBljeGfYbtClfIrT3WfI1+0g4/VzcoK79lXYCSWuqGsKC6u24ZNzz+8/oZtG3BWARVOKAU7/iaRWwzoHbFQ4Pp0z4EhWJNnAJVoK2vtqHLiD6ec2o/AnqRkXqmDzI0DDW86Y955QNVJ/U8OJ3a/8MqT66p9gvpvdmHuYNKs0OcSuzJD1HhQlCcbheUy2sh+F0KiOn8Ph+8LLHEAE6YyqIDteBn+iwxwvrs8MGxO2J9WKe45FNGqtsu2eu4Kta1AD4gmLfVnAXFk9z381WzXFUOOZ/TEuPwI1PS6P7nY3bnaBa8VqzHfqt0zLxKZAnlfSjDdxQhpxVK+8tOEvxEBZq6W+Ddspg8QG41f038rywaJkvBSe8zl6XiYpdv3qtN2NtYjaUuhSbHEpkxZA+mTRLUSroJNwc8XiSBnZmjI3yCXldD165SJQOJcPw8zrrWqNiH+E3hHnPZ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB2987.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(396003)(346002)(39860400002)(366004)(376002)(136003)(230922051799003)(1800799012)(451199024)(64100799003)(186009)(83380400001)(6512007)(9686003)(6506007)(4326008)(5660300002)(6862004)(41300700001)(26005)(2906002)(6666004)(478600001)(316002)(8676002)(54906003)(6486002)(8936002)(33716001)(6636002)(66476007)(66556008)(86362001)(66946007)(82960400001)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NVI3aTcyMEFUNm1sMXMrY3lJK1k2cndxOGF1ZEkvaEYxR3NBUjNFaWVPN2xz?=
 =?utf-8?B?WVVFZXZQdDRCUllLUzk5dGNmNTBqQTlRZmhKOElETzlBTHdIV0MrMzlRcW1V?=
 =?utf-8?B?Tm9pMnRVRGdpOW1DbW9jaTg1UXdCVlA0SWhvNnNzNlJZWU9xaVFZQ1lYWlJZ?=
 =?utf-8?B?Zkp0NWUvcG5nQUEzeldBNDV1WSt4SGNIMWt1Q0hsc3NMZ0lnYmtYdE1STm5H?=
 =?utf-8?B?YnVtR0Q3cTkwTmJJSHQ1dDIrVjVXbTBRMWFOblVYbWE2emJjVEFwQ1ptTVcr?=
 =?utf-8?B?anBza2N3aEhUMUhrTEtheU1ReWJmYWJXeWFlUE53dnhnSGNkbEF3cU10SGtp?=
 =?utf-8?B?dGRPTFduTDBWNjVlSEpFZTRtWWhveXFYWERYdE1wdnY0SE16OGhBbjlhNW1X?=
 =?utf-8?B?ajJsUUtyKzZTVFE3TURkTi9oc1BqRnJYWnk3aHVrTjE3QzhhU0Y1SERLV245?=
 =?utf-8?B?eTVQQ3B6SzVXVWJGVEovaG5hZElrbU94cklBNU1jRWM2MDhtdmVJMzZSVUVu?=
 =?utf-8?B?cE5HRWxNZngxQ1FqV3FhZzZTY3lOaXUzMUVuQzA0aGlJeE5ZRzhxcklBNXdQ?=
 =?utf-8?B?cUkzWEdlSEdEbUtJd09Kb1p1c3BKYWJ5cE5hWmRMdEszWGZiNDV5U1F4RnFT?=
 =?utf-8?B?dnQrblN3elpobzl6VWdnWUNPM3JwTzhqOUN5Qk5pS3NSU1RQbWpoRWdKMEhz?=
 =?utf-8?B?OSt4YVo2cnRCOEo1T08va0V0K3Q0TG1RNjd0MmxQQlR3ZGlYMGQ3VytvakJv?=
 =?utf-8?B?aVJlU2V2QTNaY000dFpzZGY0RUswWmljZTVBYUNDNzJLRGxFam5zMVA4UmFs?=
 =?utf-8?B?dlU4WCswdi9XRUx2SFNCdmhCanNkWVFSV3c4bGVHUS9KU2NPNHk0MzFPMEFT?=
 =?utf-8?B?dzljSkZRY01rNXUwQmJIa3paeTBNUElZS2FTbkNCVCtRb0k5S05ZVml6enhj?=
 =?utf-8?B?cWE0N002cnJ4a3Rxb1Z6elVjWGJkZVJ5Y1JjYll5RGVnLzVweEYyTXl2N29R?=
 =?utf-8?B?WXBtU1hHQVBiaExOOTdUVWJ6WkNBQm04SXhzZTQxd3pCME9ZVGpvZEhRczlU?=
 =?utf-8?B?em9FQzZpOFF5Y1lDdFd0aVdFWTN6M29SRGdnaFNmalU3OSs5MU9TM3pOcXVt?=
 =?utf-8?B?YUxVZE0yOVJNVGtoa3dNOEZKMm5pWTVXM0lRTmRpQndVTjBMMUVyWU5pa3hO?=
 =?utf-8?B?c1VodGJqRzEySjRFTk4wS2E3WG9HME1pbGdMNFB0bW9IdEhwZFZPOWZUOTdM?=
 =?utf-8?B?RWNuZkNMd1NoeXB1WHl5cXltV0RSZEQxVlZJN1JpUHFHRjNjamVYL3VIQkFW?=
 =?utf-8?B?allmb0Z2OEhiVm8ySDJWUmswUlVHVmk4ZjBLN2F5ZiszbHRycE5BY0hKOTVV?=
 =?utf-8?B?MFlvdFFhUXoxbCtiS1IvcTNJMHJnakY5VXlUQzBJRGMwUmZ0UkFPaE8vazhH?=
 =?utf-8?B?THI0WDZuck5OMkdLTEUvVi9WZG94OGNmM2FSa25pVlBUaUFKVFN5OW1TRTkv?=
 =?utf-8?B?bkorSVgwYWtUL1E3dG5yQ2lmNUZOakFzS29BVTNYY2lvaFljSlhuL0wyQUx1?=
 =?utf-8?B?V2c5akJyazNRMW04U1BXSTBJVEw1bGZSckNkbnUybzc2ekJYTGtNeUpuYTc3?=
 =?utf-8?B?WHM3SytoYkRPVW16RHZDYXVOSWwwQzFrRHdhMTZiME5NMk82Q3pBVHlrdzU5?=
 =?utf-8?B?QWhFclJsN1BPc1NnMlhVK0FpdGZDdlMrOW12cEx6VzRHZUIrRng0VUhNU1ZI?=
 =?utf-8?B?TUZ2bHd0d1R6bzZNRWR4cXFrZFU3Y1BqcUpZekJXdW5yVkVGYWhVeVF0aHE5?=
 =?utf-8?B?SUlkdDd1eGxKTy84bjE3V3MvSFhkUW1vYXYzWTRMb1U1THkwblFOMVdHakFo?=
 =?utf-8?B?VGRrZjJidWhtL3lzNVREeWRKaFVrYTZ3VEJoYnFlRDFHTWJwMGE2c296SHRw?=
 =?utf-8?B?d1FjTUcrNTVCbTdCU09zanByTCt2dnorckhtd2VXK09kTjVVQndqdlRzbW1T?=
 =?utf-8?B?K0pMU0dMclVzaWZuZVVXWWQzUERQVTV6bU1kN3VLVFpGQitOdWdFVmdzWXZo?=
 =?utf-8?B?UFdZVlMwQUpsNWtyV3lvdkZSNWFSaGhvMDFuQWhUTzlCOGtCNVNMSTFqWWNo?=
 =?utf-8?B?a1ZWZVQ4eFpheWJWY1I2elhBalF6ZlJnR0d2dVgwMW0zeno1cWhVWUtlMjhv?=
 =?utf-8?Q?sI3SDuggqDzQSMCB8TR7Tt0=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6debc912-d8af-4095-5966-08dc00b14477
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB2987.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2023 16:40:53.9065 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bMEXEVOElrLBizufrdn03RHR3GcwcbcJfK2GAsFNcfGSaxkPnl2yFhTcUI1Ay6OJb8f3K7udTTb1G+KaV6rCbetjH3ZbH2q4aq2Hvjc/kks=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5293
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
Cc: Harish Chegondi <harish.chegondi@intel.com>, intel-xe@lists.freedesktop.org,
 gzadicario@habana.ai, Robert Krzemien <robert.krzemien@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, Dec 19, 2023 at 06:29:56PM +0200, Lionel Landwerlin wrote:
>On 19/12/2023 18:26, Umesh Nerlige Ramappa wrote:
>>On Mon, Dec 18, 2023 at 06:59:57PM -0800, Dixit, Ashutosh wrote:
>>>On Thu, 07 Dec 2023 22:43:19 -0800, Ashutosh Dixit wrote:
>>>>
>>>>+    /**
>>>>+     * @DRM_XE_OA_PROPERTY_OPEN_FLAGS: CLOEXEC and NONBLOCK flags are
>>>>+     * directly applied to returned OA fd. DISABLED opens the 
>>>>OA stream in a
>>>>+     * DISABLED state (see @DRM_XE_PERF_IOCTL_ENABLE).
>>>>+     */
>>>>+    DRM_XE_OA_PROPERTY_OPEN_FLAGS,
>>>>+#define DRM_XE_OA_FLAG_FD_CLOEXEC    (1 << 0)
>>>>+#define DRM_XE_OA_FLAG_FD_NONBLOCK    (1 << 1)
>>>>+#define DRM_XE_OA_FLAG_DISABLED        (1 << 2)
>>>
>>>I am wondering why these flags should be part of this uapi:
>>>
>>>* O_CLOEXEC and O_NONBLOCK can be set on the returned stream fd 
>>>using fcntl
>>> (see man 2 fcntl)
>>
>>I think the O_CLOEXEC was used so that a fork doesn't carry over the 
>>fd to the child. For the OA use case, we want to prevent that.  
>>However, these flags don't really need to be passed separately. They 
>>can be flags in the stream open property.
>>
>>Umesh
>>
>
>You know that the application can set those flags by using the fcntl() 
>syscall?
>
>It doesn't look like it's a useful feature to add in the driver.
>

Right. It does look like it's not needed in the driver.

I just don't know if there was a reason to include it in the same call 
as stream open ioctl. My guess is that we didn't want them to be 
separate calls due the nature of OA use case - privileged and single 
user. The application could just open a stream fd and fork a bunch of 
threads and all threads would have access to the stream fd (even if they 
drop root?).

Or I might be overthinking this. Maybe it's just there in the driver 
because fcntl mentions some races that may/may not apply to our use 
case. In practice, the application will likely call the fcntl right away 
and since OA does not support multiple users, the above concerns are not 
relevant, so fine to do it in fcntl.

Thanks,
Umesh
>
>-Lionel
>
>
>>>* DRM_XE_OA_FLAG_DISABLED can just be a stream open property, 
>>>doesn't need
>>> to be a fd flag.
>>>
>>>Comments?
>>
>>
>>>
>>>Thanks.
>>>-- 
>>>Ashutosh
>
>
