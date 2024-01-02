Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B54AC46CD2
	for <intel-xe@archiver.kernel.org>; Tue,  2 Jan 2024 14:19:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF51B10E1C5;
	Tue,  2 Jan 2024 14:19:37 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C14D710E1C5
 for <intel-xe@lists.freedesktop.org>; Tue,  2 Jan 2024 14:19:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704205177; x=1735741177;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:to:date:message-id:mime-version;
 bh=KyrYjsifC79+RkQ8mmDsoxsdQ5D8GWi79EytWED1Bc4=;
 b=HAmrFcAHjryyPMAHtnOAK2MyLwfbjNhXx3nMxnb10MNazEDMTUCMkhaH
 YbUgqV6BJ+UdgHWXQbwReFDXyJxx8ZFPr6NjjiWLV7vpeMw6CkbscYJ8e
 NDQwSqb0FD4wOXX4DX0763h+0svTiRiSFNihI2CUZDd/boi4GHPAQQAVr
 uwQpP4Whj/FLCnWgHvYbfFoxC2Z+cij9gd1v37LFwAEarIik/K6j6O2h5
 tBS757mk4NkUSy59OfWqkUzVcNUH4XXqZBoBQ5gm5+MK2OALGNmlETI98
 dU7UdBAfbBkwIj48I3WC6vqqVqJY+9QBp/7m+1xRYAtFDbK70mbicfu2i g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10941"; a="18423388"
X-IronPort-AV: E=Sophos;i="6.04,325,1695711600"; d="scan'208";a="18423388"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jan 2024 06:19:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10941"; a="755928669"
X-IronPort-AV: E=Sophos;i="6.04,325,1695711600"; d="scan'208";a="755928669"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 02 Jan 2024 06:19:35 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 2 Jan 2024 06:19:35 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 2 Jan 2024 06:19:35 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 2 Jan 2024 06:19:35 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 2 Jan 2024 06:19:34 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WrLMGOSfUmaUMdJ6rXLX5r3MM7C+f5rjCJgs1JWwAzv890krMWFVoCm02FjIch/AuspwyzqpPDAaOygTaZVzU42syMA8p6TMgnIjSuH+PQO+/hsvt9XY2xBa//5ftYWVr+1E4Dl7K8P7bm4USdSBCmPuQgF5KRrMLLlmRO6mIavbwCV2A8ZgKlVnF3gY/s9vbwocyQYlyaMVtq3trB/dC1xp3N5bbbUBFXRfJ/9NnExn8qfuEz8NS+TvuHlW2C2a1XEcJ/gjHlKhpMckkpeYb3c7Ey1TI7ZsmRJkrsVcG31YCNNBpegGos7uawaywlw//ELnB+DdOdRqSzVu6e09dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KyrYjsifC79+RkQ8mmDsoxsdQ5D8GWi79EytWED1Bc4=;
 b=ZgdDhj2neP4cUpMVcgJ15qw8s16NyGqO5+Kv+T5hU0SiRJbezLkNTQgfN6/gW0mCvZSQFNjHnd3mkQGf21YtSSedVoPOu59wyBlBXzyqWocsRb53hdrDcwUzxya6Y322/9Zs57Y73vePfNnZe/pmgYYRS+pgjEVgN/ikwXHrlpxykIL72pQnIWZhXlhHCXS8P8UG0yD5D7eRjFk9wD8+L30FvbyaeoeLPlMYq1sFE5B1xzn0QGEKFtX7ncpX9u3s/LafBxM1/QP3QXJovjOke45RLZMRfPa5locIA00LtdVc+aJSAMcJRwVdQhe/Xtom7rnkPS1nrfSvHcyjiQ4n2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN8PR11MB3556.namprd11.prod.outlook.com (2603:10b6:408:8d::31)
 by SA3PR11MB7433.namprd11.prod.outlook.com (2603:10b6:806:31e::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7135.25; Tue, 2 Jan
 2024 14:19:32 +0000
Received: from BN8PR11MB3556.namprd11.prod.outlook.com
 ([fe80::ac50:a00f:447e:a3a5]) by BN8PR11MB3556.namprd11.prod.outlook.com
 ([fe80::ac50:a00f:447e:a3a5%6]) with mapi id 15.20.7159.013; Tue, 2 Jan 2024
 14:19:32 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <877ckyk1l9.fsf@intel.com>
References: <20231228110934.383623-1-luciano.coelho@intel.com>
 <d1025642c5e47fcf8338bda82d3d31930877848b.camel@intel.com>
 <877ckyk1l9.fsf@intel.com>
Subject: Re: [RFC] drm/i915/display: add support for DMC wakelocks
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: "Coelho, Luciano" <luciano.coelho@intel.com>, Jani Nikula
 <jani.nikula@intel.com>, <intel-xe@lists.freedesktop.org>
Date: Tue, 2 Jan 2024 11:19:26 -0300
Message-ID: <170420516668.33674.8799325013653495953@gjsousa-mobl2>
User-Agent: alot/0.10
X-ClientProxiedBy: BYAPR03CA0025.namprd03.prod.outlook.com
 (2603:10b6:a02:a8::38) To BN8PR11MB3556.namprd11.prod.outlook.com
 (2603:10b6:408:8d::31)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR11MB3556:EE_|SA3PR11MB7433:EE_
X-MS-Office365-Filtering-Correlation-Id: 0a63dd66-f4fe-459d-39de-08dc0b9dd6eb
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OSk7tI8+LGDMEjl8/fWothyy3ubYSlzgF5seNHzqjs2cctSJWzQ0BlGWIin2rKFswSh9M38f0ZZYgRhxTyG/llQFHNLcMWAfPtYORs3tzwdrxtKR02Gra1ZOxlwRCYFJ+vhuZFVs39wjYtxh3G8HRB8l0YUjnOrm3kQCJbDFaHi3WOADn1Vn8bRhA25Ft34cYeNLkoFXvz+gPMlmYuXw4UopMNlhyo/Y5C6P55CbJRHeIZ2cxqILXbvOkz2vfxKEf86eTbxAUHYnxNoeAWMF/8nS1JiMKLetx7KlHBO0U8VPXX2r4neQ/vg3QhhxPdv3w19co4KYB0C0oSfr2gBAbLKlefxPYZwn82Zy8FUQYnLxu3btUVR7HBVuLKOgOnkOQC1weiZBYQ7YcGRsMTuExE4FnQ320hZwUgm5tIRHR3/7qiBKGEI19wEGS0/u5+MYwDRTKjO2ll+Cazb0Vj2QNn10E+jnlfytYRIJCFy4tgjbJJ9VBLNXaXYJYvFHnplOkE4dKJc/F+FvjhqFZNNZGt6LwjtF+qE+rhraiBKSrZ6ZwfKvvih12tROdyNff7Dq
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR11MB3556.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(366004)(39860400002)(346002)(136003)(376002)(396003)(230922051799003)(451199024)(1800799012)(64100799003)(186009)(26005)(83380400001)(6506007)(9686003)(6512007)(4744005)(44832011)(33716001)(41300700001)(4001150100001)(2906002)(478600001)(6486002)(8936002)(66556008)(66946007)(66476007)(110136005)(316002)(8676002)(5660300002)(82960400001)(86362001)(38100700002)(6666004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K2V2N29WREFEMVBIZ2loUk5xZkdpNldhN2NxMDlFaXF6MEx0YXRUZlRiQXJI?=
 =?utf-8?B?Y01KclM5OStYaytoY1JBOHFrMERZMVBZVkJYbzkrYW14SzgzSGVwK2dUbWNU?=
 =?utf-8?B?N3o4SkZ3a0hNdDdUSFhackF5S0NhMmVkQm96UG8zOEVXRTVVY0dCY0d2bm5o?=
 =?utf-8?B?SXBrTDBwTm1Vc2M5b0dXMmhuVjRlTkkva0tkQm9TRGNwZGZBd0pSWFFicjRy?=
 =?utf-8?B?Qng0ZURaYUxHdGhldjNCVzQ1cC9WNzZYanZia1U0Q1d1Q0hEMkZZN1RxcGgx?=
 =?utf-8?B?Vk9UQ21iM1U3UDNmdmZQcUYwd1ZPQ3MwT1FLZFhXZk9nanNMeDlUNnVWM1lm?=
 =?utf-8?B?cTZTUC9Nb2dmSzhFeUNLVGhISk9xWGxwSHM2U2lHdGY1d0d3SzZGc0tYZjdV?=
 =?utf-8?B?UUVJakZFaE5iRlorS1FURlBmWFU5d3NkZldpSWNWd1lMY0hUTFRDT2RLV3d5?=
 =?utf-8?B?a01KaUVzZUpkV0NsL3F1dSs0dVBTTm9hYUpDaWxsZklxY2dLQlZ4MnhLaSsr?=
 =?utf-8?B?ZmsxOU9TMHltY3FOa3BvSFVxY1NvVEFIUzBHanNNdTNNbmZIK3RPZ1BoUEg4?=
 =?utf-8?B?dkV4RXdKT01CUFFPcnFkdFMraElWZGRNd1ZGaDNZd3d4OXpHaDJ5Zk1iQi9v?=
 =?utf-8?B?RFRocFg5OWg0MzBYTU5PdWIxZHhmeXo0TmtUbDcyK1cxSDdoRE9FT01yQlFq?=
 =?utf-8?B?TGpKemlXV0ZsS2xwM0dnMnFkbXBlRXk2SWVyNi9TNkRNTGE1cmkzMEJnVHY1?=
 =?utf-8?B?aE1DcWFIZ294YWRsTDYzUUl4ZGZDdytwVk1ZWTNjbFVzYlcvYkE0ZUVudTl5?=
 =?utf-8?B?ZG9NMWdVbkNIOFNaN09mTW9JaWZnYlRaQ2dadmdYSTU0aGJtMHl0UDhMb1Jn?=
 =?utf-8?B?dXlPUkNTQysyNnJyRTRqQ1JCbFFQY0xBelpCLzVaTWZiWGNSVFFnaWRJWFBT?=
 =?utf-8?B?WE40WW05R0dRYkduWC8yd1pxUEU1Z251MjhrKzE2Zi9SOFRXZDh2QkRSQXJT?=
 =?utf-8?B?S3c4VGJBT01nVXRWTzViYU1DNVlwdlliVFR3SkJOaXFkcmw2Y1htZHpjNEo0?=
 =?utf-8?B?ampaKy9JS1Joa3RBcmh5NjNQZldxcFpGY214Nm1Kd1VueHF5QTAvSWhaU2xV?=
 =?utf-8?B?d3RENit4SkdrZ3pQcHpXQ0kvZDdqWjV4VUZMbEFJYngyZHFnR1JzUnBteGJM?=
 =?utf-8?B?SmJwb2pqNG5ocVdLanNnSWIzaDE0c25KR05CeHIzUkUzV3RQbnFCdjcxVEND?=
 =?utf-8?B?V3pwdFhyS04rd2dHSXpLb0ZUZVprN2dRQ0dwaWQ5MG12YzVqN0NJWng3Q05X?=
 =?utf-8?B?NmdnNVEvYjhzMHMyUmNmNHFGZ2ZXeFpPR0hCVXRDcHdteHp0RFNqM1dEMkc1?=
 =?utf-8?B?L1N1VUpMYnhiWmN2bFk0Q0xZK21GT1VLSXJWYm5OV0J6U3hEOTArV0xTdFdJ?=
 =?utf-8?B?ZG1vMmZ0MDlHaEZIM2NUUlhoSi9LTUJvZ1FaSzZXRjhmQWk4ODd1V0VRK0Qv?=
 =?utf-8?B?dFJ1N1kyRlRobjNIWjFzSnRsQWdJMktscmJtaXAvK2Jlc0srcjBXRXR0YmMr?=
 =?utf-8?B?THZVL0IxWTh3U2E5UlFkbWF0bVlNQkNrY2I4M3dlNjB5aU1nR0JYQVo5a3JX?=
 =?utf-8?B?OVMzYjY2YUo5N3JOSE1MK0o5eUFxY1BJNUh6MXBTLzQrc2lGcEJNYUtMcVNl?=
 =?utf-8?B?aS9KZUZpSXdlQVROK3lXR0RaV0JmdmRrQWdXNlRCV3JxVDVTQUtER3JjRkJ6?=
 =?utf-8?B?ZkU0Wm5zcmlzVktwbEdtVG9tR1FrWWhzNkZwSHZuazF4WU9xem5oS3ZHUWNw?=
 =?utf-8?B?bmtkWGNkRGlSYUlMdzVPYkpPU2pKYmdBbDJSazhNN21KRnR0RXBLQml0RGhP?=
 =?utf-8?B?SC8xNW9yTU1KSkp0bGVXZnd5UVZybDV2ZmdCZDRFTU8veTNUNDF1TFQwSTdm?=
 =?utf-8?B?U25kVGwwVnRUWCthN01xL09Qb1plSWlUOERjVUlmS1luRzZLbHBwZnlidHNt?=
 =?utf-8?B?Z1dnS2ZBdG40N3hiR1lQdUhoenl6UXlMdlJSUXpSejlDZGwxZHJjSWF6cWVQ?=
 =?utf-8?B?MTRLMHBIUUtmZi9ETFZUK2l5KzlISFVGaGVuLzFDeGk5NWJLaXd2Mk4xOENG?=
 =?utf-8?B?UkthNEtUMW5wOTVhZUQyRm01ajU2ekZnbWRJTUt2Ykt3Qk4rclBSTVdjRkhH?=
 =?utf-8?B?ckE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a63dd66-f4fe-459d-39de-08dc0b9dd6eb
X-MS-Exchange-CrossTenant-AuthSource: BN8PR11MB3556.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jan 2024 14:19:32.6656 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Sir7rEu5+DEpVgqWfPi3Qy9ZxZAHWMqhF82cSLxYdzCrlREX50nsqgUdDwyIcUlwx0oX3FjGieRtKu6Tiu4iXA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7433
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

Quoting Jani Nikula (2023-12-28 08:28:50-03:00)
>On Thu, 28 Dec 2023, "Coelho, Luciano" <luciano.coelho@intel.com> wrote:
>> For some strange reason, git-send-email didn't add Uma and Ville in CC,
>> even though I specified it in the command line.
>
>Everything worked as expected, but it might seem a bit surprising. ;)
>
>Mailman has a personal setting on whether to filter your address from Cc
>in messages sent to the list. I have it disabled, while apparently Uma
>and Ville have it enabled. You're probably looking at the copy of the
>mail that you received via the mailing list. It only has me in Cc, and
>Uma and Ville have been filtered. The copy I received directly has all
>three of us in Cc.
>
>This is one of the reasons I Cc all of my patches directly to myself, so
>I also have a copy that wasn't modified by mailman.
>
>
>HTH,

Ah! It certainly helped me. Thanks! :-)

I was also puzzled by this a while ago...

--
Gustavo Sousa
