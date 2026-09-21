Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8148C982EE
	for <intel-xe@archiver.kernel.org>; Mon, 21 Sep 2026 13:03:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB87F10E658;
	Mon, 21 Sep 2026 13:03:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="G9/ja121";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E75210E3B0;
 Mon, 21 Sep 2026 13:03:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789995785; x=1821531785;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=hiG8aLNlxEfKZ09jxXy2ZWQe2WWInmvegMgVVlwSh6M=;
 b=G9/ja121+yJtjLny22Ca7eWIMYJ2xMtywzrt8PsudMHPHyio1YpjvNC+
 +DXpxuKlnvxO6R9PG5hHkbG3bqHUy5F5I9jWAYi7WptfitwnR6ARLPTKj
 HDsNTkJZvUgZ9XVDMooxm7wd6OHYbOjWLT2e0FQpO2ZzIvYucW8P3Ajm1
 r7Igs2jy/ZohwibUp5uKOooVupZX3Uj+dxupZq2SrOWLZOFGkqcdMvr81
 5idEICGdIo8jXrCH9EswjjKfaVPvO74N+cXN3NgcvqCqmN0noKplfLLkk
 36721fA3mWD0NliTTCZRCQjjQr6hOmsO40eauz8LzETBHAH0BHY7fQiDO w==;
X-CSE-ConnectionGUID: SpWKoNgaS5i6xXr4khrMfw==
X-CSE-MsgGUID: MfuxHmbATLm02cpzxCDecw==
X-IronPort-AV: E=McAfee;i="6800,10657,11911"; a="89431832"
X-IronPort-AV: E=Sophos;i="6.27,114,1787036400"; d="scan'208";a="89431832"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2026 06:03:04 -0700
X-CSE-ConnectionGUID: 6vBQ9tpJQ9yEkAtvKH1njw==
X-CSE-MsgGUID: dRfR38DdQMWIz+JteN5HWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,114,1787036400"; d="scan'208";a="277437093"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2026 06:03:04 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 21 Sep 2026 06:03:03 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Mon, 21 Sep 2026 06:03:03 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.66) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 21 Sep 2026 06:03:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X7V9Phd0UHsOgcJ4k/MNSyrVRYonhDw2elR84kxrpOGozrKlreGUqenelFfbKkmuKYESGK5ledeNF4+PsgVt7ajyMS7LfOx0mVAjQwKwSz5eghIMlx2dkM24B+Ddqf1vl7CVrHjwIq8nr4g8O05okV3FZmd8PXGUye2dizdfE77S5+XTtZdlcuoorCvrlYWTmw0oI7BxMAByW0P1eZscVNoMDSeep7pPy3mvRbmX6NZTI68LnBveq2qRNu9mBIAFjeWzfX+fkBQVyYVHIsyDm1H2YqUaELEOlx3Rh6jay3HzPulCs5fgEhTbSh0shXTHUOdxuUCE70PusgEGPUVZ/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oiWYnG8/oXu0589oMr49pox+tpP37vHS/eKN99nNwuY=;
 b=kc8Q9gvjrLfU2rT4EOOQhje7v1naixpDAZlJHQefe2VMosnEqhbrZkG70KBVzaUHthqWEjlX8+aOm5xUDfkUs3I9+owGf7g1GdlSSWhRZzrx2Io2SsNn0vbSi7IB96R5T5EaZtYZi4rkGiqXuhSzrQxyQqpDEqH1zHzwO5dnqmf41dnyIIE62Ah1Pp7qWqnfxC9uTtS6Z5R2oMn2Al+qwKCwQ44YWYQ22Pc9VGKLRyg8MTtnsEsNQyJFga4rnhXpJXzWiPqrzAmRk3QQS907PbIrd/fpHjhIv3du8EcdPpYI0hzhY3UbXGLadXLXvcf7sktJA1qBcBg8muDdrar1Bw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV2PR11MB148960.namprd11.prod.outlook.com
 (2603:10b6:408:40f::21) by BL1PR11MB5221.namprd11.prod.outlook.com
 (2603:10b6:208:310::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.16; Mon, 21 Sep
 2026 13:03:02 +0000
Received: from LV2PR11MB148960.namprd11.prod.outlook.com
 ([fe80::9761:b20d:6f27:5460]) by LV2PR11MB148960.namprd11.prod.outlook.com
 ([fe80::9761:b20d:6f27:5460%5]) with mapi id 15.21.0428.015; Mon, 21 Sep 2026
 13:03:02 +0000
Message-ID: <1e2f1d5d-2b67-4fc0-8db2-e68a36989b19@intel.com>
Date: Mon, 21 Sep 2026 18:32:54 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] drm/i915/dp: Handle VSC SDP revision 7 in unpack
To: Gil Dekel <gildekel@google.com>, "Borah, Chaitanya Kumar"
 <chaitanya.kumar.borah@intel.com>
CC: Juasheem Sultan <jdsultan@google.com>, <intel-gfx@lists.freedesktop.org>, 
 <intel-xe@lists.freedesktop.org>, Jani Nikula <jani.nikula@linux.intel.com>
References: <20260601212613.3682640-1-jdsultan@google.com>
 <20260602205422.1792007-1-jdsultan@google.com>
 <68143a59-ca3f-4e57-997a-8342021ffd53@intel.com>
 <CA++eeRM5PbFq79Yw9xECRaat_Ju759Xrc_7=F-R1viCsLFREfg@mail.gmail.com>
Content-Language: en-US
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <CA++eeRM5PbFq79Yw9xECRaat_Ju759Xrc_7=F-R1viCsLFREfg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0232.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1b1::16) To LV2PR11MB148960.namprd11.prod.outlook.com
 (2603:10b6:408:40f::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR11MB148960:EE_|BL1PR11MB5221:EE_
X-MS-Office365-Filtering-Correlation-Id: 510be019-b245-4f6d-827f-08df17e0aaf1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|23010399003|11063799006|56012099006|4143699003|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: iSetkwPDdAv5f/6pZIxzpA1e+aBJ5+h7wadOeJ53+ZrlIYk8AOGBD2jJC8LHhU+78C9RzehHd9dQkt9e8Kj6kP27jwzlCiSsbV8j9+lPINIub32zWFSLNyXK8UOKK6pts15xsAJuxtCtXFhGxkWX4JAXwIJk2ZuV5nsv47FvfE5ef/iIfWChFvsp+1YilFTKUH3QS+AZBDhvGckR9RoBNBlRFIeU68sYzOr7JhQsTevZlfM6+ysmpAHQhBmekCyFoS5jvsv7grpNA65SSAxrFv+sfp5PXyhrmD2VmGrseg+Y65blbvhe4+/cN4UcMKVeK2zmNMtJcZaaHGPVJnNn6zXmn/msFgM8FBlPyMTDARz6MJACRHORNiz46xPg3loU8XXztFMMZJWlGjuXTt0qBxTuYTKeZy4M4vKjj+0MH1tmH69Yl/cBP3Ia2nnhm3wJZXtwRBPlef/FquFPJswy106EVXrg4V/0PkJ4l5q4B38nmqU6Ruuf/grhzGzwH1wV91qTh6Wtaa+3V7CqEQ7oT0YwbhfS7Z2bCyewgCFtzOuWEAQtgZNdYepM9aS3SeRcZVCwpxRnCEvBbh+mit+ShcoVvmZhDMta8xkpgsMf0MRCJCTSOcFjRyop1KUrjMWkvqyS5IEZTP2guucYUQI4dS0peFvDC9AYLHM7W/nwapY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV2PR11MB148960.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(11063799006)(56012099006)(4143699003)(10067099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MzBlak43WUIyMXcrdnNnR3VOUDFkUXF4akc2cFQ2SmZHaUpsSTZ0RVBUK3hX?=
 =?utf-8?B?amhuSmh2cmhEN09yeWpLeDVjclBKU2M0S0xyenBNTWtiV3VXS3diSld4c212?=
 =?utf-8?B?aWxLSEs0TEJOMURWUjZRckVIZ2VHTXBPUnpuZU40U2RPZUJ5VUFpM0R3dGt4?=
 =?utf-8?B?S2lFV0ZTZ3VLL3RFVWhwcXNIYThJR1FGTDU2TmJpOERLZ2ZPRm9kYngvQlpi?=
 =?utf-8?B?MGRsZnY5MWR2bDVnZkZwa0pOVE4wcER3ZHdiODhzOUJaSWZmT2FqYjI0THlr?=
 =?utf-8?B?VWpWQndhbUxmY2JMTDVxcXVmc0hYRy9aMi9CbE9kbi9nRkpjNTdRd3h3TC9m?=
 =?utf-8?B?SGlJajQvdHBKSnR4Qkcra1pSQ2syd09lNk9sbFZJM3BMWDlDWmFqTkl2Nmhk?=
 =?utf-8?B?Um00dmJjcTk0OTRIbmNlaHVaSmtEc25PMkZqa0JrcHV3RytWTnVjVCsvUHRB?=
 =?utf-8?B?VEdHdDkwV2UydE9Wd1pIbVhXdU1udkhLTHhYcWxEd1E2TXRFeVNISCtVcFpx?=
 =?utf-8?B?ZXcvazFETFpaVnlvdHJZUVZCUUlQaWxQU2tTZzVnaFVHeERFa1M3cVBYS0Zo?=
 =?utf-8?B?bGdjbDVLN0t3K0U0YW9wd1doN1ltMDVxRmg1MzZkNDBXdFZaTWYrc3o1YnpD?=
 =?utf-8?B?RnlaMHRycnJvdkRRWE1FQ09Da2RQOHJBaGsrRjV5UlVpb3hJZmRSNS9jOEdK?=
 =?utf-8?B?Y3FMVEZyU0FKMEJDU1h4cmhoV2E0Vm91YThSb1ArV0V4UDdkdmREWnlMNE1Q?=
 =?utf-8?B?Zks2UWxYQ2lVSHF4NmFseGlPdlR6VmI4NEY0alM1T3NkRTQ3TFJ0RTBMUURm?=
 =?utf-8?B?ZUNWTVh6N2FKeGhHQ0JadjRNN1ZDRnd5cXgxOHUxdDJGU0RQMVRDbXFJQnlh?=
 =?utf-8?B?aUhOL1FCczVQVFBTSDR4N2FUTTZPTVNVWFp5NkszSlhYYS93Q2NSUmdpaC9o?=
 =?utf-8?B?TVBUZ3VoZ1k5YjVtd3NSdFhoR2dBR3l1UnZnVk1PTE1hNzZYZlg0clRlVS9L?=
 =?utf-8?B?VzNmY0htcFhGSmpGYm0zUVhiVjFySEEraDVESU5RVUtkeHdSa0NpdlRMdnlB?=
 =?utf-8?B?STEyYnBSTkd6ZnhHZlZuemRQU0NBUW5xd3ladU5BVjMzMWdDamhhR1dGWi9J?=
 =?utf-8?B?b293aXVaQzAyNFNXWEFob2NBRy9wOHZpZTlLMWgvL2hTN1RTT1NuR0RNZ0l0?=
 =?utf-8?B?MXp6THl4Rm4yblR0TEtrQWdKeW5mQ2MrNXhweTRoREdia3JTdWdKbXFmSHg5?=
 =?utf-8?B?UHpVQWp3U2Z6bnc0SUlNdm52YkxJajh3aU9VbENlakdQRGxqc0NycjJZbkQ5?=
 =?utf-8?B?VzkrdnhxYkRGUTRiZ1pyVUd5VGVqREJPQUhNYUNjZE1hQVpQcHd5QXZjd2E2?=
 =?utf-8?B?ZGVaZE5CSHZyeFRJN3pqbjErV0JROXJQd01VbVEzTXJLQzcwNUkvODNnTGRV?=
 =?utf-8?B?d3ZVUEhQMkhYbUFzZWdqOExvNlg3SVhQVFBlMTQxdzBXQjh2bXY5N2Y0SjN5?=
 =?utf-8?B?bnRLV3RXdUJ6aDBCS2tESzVvM01CbktzNWhuaXFSYWNzR1JNcDVHSmNPRklX?=
 =?utf-8?B?aFMzWmhKS013ek5ndytObU1raWJhakxqN0doZXVHL0RoNHhqcXRMVHRNTHlv?=
 =?utf-8?B?UlVxektlMXJEQ0tpbDZON3RmYkQwWDhGZDZGNVhkaU9GR2Voa2lhZ2hLaURv?=
 =?utf-8?B?QVhDUU0xeVBEaTBua0RNM3RONk0zUHlncUszNHFEWmVsSTMwbGZodk9PaE1P?=
 =?utf-8?B?ODhXY29FYklwMkVrVG10U21IdnY1S3dQZXBkVi9WbjZ1aTdmaTliWUNOWVR4?=
 =?utf-8?B?UjBrbkNLdTRBUWFVY1VpVnN1eTgxVWRVODRoMlk3NVFXUjJmeWtaZXMrb1ZJ?=
 =?utf-8?B?M1hXNFpER040VVl6TWppM09oS1ZhZkNOSDM2TGpvOTJ1MGpBQkNKazFjNFFN?=
 =?utf-8?B?UDZxc1gvSHVpaVdDcEcza0hSWEFsS1FvVTgvSDgzOG5MQXJpdkVvaDk5VTZk?=
 =?utf-8?B?Nlc0TFY4TGNTdmQwRFU1VHhManN5TndOMGE4c0xUNXdnV0dOSEc4L1VlcTJ2?=
 =?utf-8?B?U1lXYklscXUyTTI2Zy9nQzlXa203cFp0K3hrbTRTdXQvSkpzQ0FlNFVLb3ZG?=
 =?utf-8?B?UFpaOEFoVXlFYnJmRmhKZDQ3ZFB4dWtxQmJ3SEgwa3lCOHJsb0d6TmJCUFNm?=
 =?utf-8?B?UElmUDBBcnM0Q3dwOWg5N0N3REpCZEwrYm9IV2luK2k2OXFEWmcvdFdzZ2tX?=
 =?utf-8?B?RmdLRkppOXQzUCtWSEprR3NURGZoaTJJdkNQcGo3LzVLOWhRUHd1RzRSejEx?=
 =?utf-8?B?cFhhRXdpbTRRWmo4eEtZekpZVlFsZ2ZtQ2lXdUp1amI4QURFWURqbi9WUVg2?=
 =?utf-8?Q?rh1835VAC3Z5VUCM=3D?=
X-Exchange-RoutingPolicyChecked: fk6wgIWPzXeCNqPHWVrdEQLNCigI2FHb2TZegdmzNMTfHpQX444nUQItvbKwmBGi+EF19ISFyJxTzS1K38s4w5JIZkebYhBY8Ue07YLy2zOPTUDGAK05NdN7CWIyhjQPtkgM2grPJY9nuicQthbzMFGjUDPSwSAm434QaWdSeUrnIRzdg6X36SHiDwyDlP7/VwkcPF2fzRjgGiHUnYN2GUI0RbSTI+Kw0hKt1diTUysVOi5IRYLOvS7ZNRfzLw3/k87TDnsVBapUX1GY2IoSojntan1bTyoMMwL117M/3b14GxBSHZBFyWblka0pZQ4vPWbocFcf/LVbQu+pzcSxig==
X-MS-Exchange-CrossTenant-Network-Message-Id: 510be019-b245-4f6d-827f-08df17e0aaf1
X-MS-Exchange-CrossTenant-AuthSource: LV2PR11MB148960.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2026 13:03:02.1015 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OBl3geIuncLRk3mL+e1vLeoln9fl+ulahvjU9ocvoELw1+GkXiEOZSKGkBDnuRSqx8hdMIkyV6h/ihq8vugcUKlxDHr76AWaMVBVO33ySAE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5221
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


On 9/19/2026 1:07 AM, Gil Dekel wrote:
> Hi all,
> If I'm reading this correctly, it seems like this patch was LGTMd but 
> hasn't been merged yet.
> We would really like to pull this patch into our kernels as it is the 
> source of a lot of log spam around seamless modesets.
>
> Is there a reason this hasn't been merged yet?
> Thank you in advance.


Thanks for the patch and the reviews. Pushed to drm-intel-next.

Regards,

Ankit


>
> Sincerely,
>
> On Wed, Jun 3, 2026 at 7:40 AM Borah, Chaitanya Kumar 
> <chaitanya.kumar.borah@intel.com> wrote:
>
>     On 6/3/2026 2:24 AM, Juasheem Sultan wrote:
>     > VSC SDP revision 7 (Panel Replay + Pixel Encoding/Colorimetry
>     Format)
>     > unpacking is missing in intel_dp_vsc_sdp_unpack(). This causes pipe
>     > state mismatches during state readout because the VSC SDP state
>     is not
>     > properly recovered when Panel Replay is active with colorimetry.
>     >
>     > Add the missing case for revision 7 to intel_dp_vsc_sdp_unpack()
>     > so that the state is correctly recovered.
>     >
>     > v2: Rebase onto latest upstream
>     > v3: Fix git commit description
>     >
>
>     LGTM.
>     Reviewed-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
>
>     > Cc: Jani Nikula <jani.nikula@linux.intel.com>
>     > Cc: Chaitanya Borah <chaitanya.kumar.borah@intel.com>
>     > Cc: Gil Dekel <gildekel@google.com>
>     > Signed-off-by: Juasheem Sultan <jdsultan@google.com>
>     > ---
>     >   drivers/gpu/drm/i915/display/intel_dp.c | 6 +++++-
>     >   1 file changed, 5 insertions(+), 1 deletion(-)
>     >
>     > diff --git a/drivers/gpu/drm/i915/display/intel_dp.c
>     b/drivers/gpu/drm/i915/display/intel_dp.c
>     > index 6ef2a0043cda..b8746dab051c 100644
>     > --- a/drivers/gpu/drm/i915/display/intel_dp.c
>     > +++ b/drivers/gpu/drm/i915/display/intel_dp.c
>     > @@ -5343,11 +5343,15 @@ static int
>     intel_dp_vsc_sdp_unpack(struct drm_dp_vsc_sdp *vsc,
>     >                *   VSC SDP supporting 3D stereo + Panel Replay.
>     >                */
>     >               return 0;
>     > -     } else if (sdp->sdp_header.HB2 == 0x5 &&
>     sdp->sdp_header.HB3 == 0x13) {
>     > +     } else if ((sdp->sdp_header.HB2 == 0x5 ||
>     sdp->sdp_header.HB2 == 0x7) &&
>     > +                     sdp->sdp_header.HB3 == 0x13) {
>     >               /*
>     >                * - HB2 = 0x5, HB3 = 0x13
>     >                *   VSC SDP supporting 3D stereo + PSR2 + Pixel
>     Encoding/Colorimetry
>     >                *   Format.
>     > +              * - HB2 = 0x7, HB3 = 0x13
>     > +              *   VSC SDP supporting 3D stereo + Panel Replay +
>     Pixel Encoding/Colorimetry
>     > +              *   Format.
>     >                */
>     >               vsc->pixelformat = (sdp->db[16] >> 4) & 0xf;
>     >               vsc->colorimetry = sdp->db[16] & 0xf;
>
>
>
> -- 
>
>
> 	
> Gil Dekel
> *AluminiumOS*
> Desktop Experience
> Laptop & Tablets Display
>
> Software Engineer
> gildekel@google.com
> +1 (650) 861-2933
>
