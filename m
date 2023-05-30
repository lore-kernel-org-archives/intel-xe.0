Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB565C77B7A
	for <intel-xe@archiver.kernel.org>; Tue, 30 May 2023 18:30:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C366410E3ED;
	Tue, 30 May 2023 18:30:31 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E4DD10E3ED
 for <intel-xe@lists.freedesktop.org>; Tue, 30 May 2023 18:30:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685471429; x=1717007429;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:cc:to:date:message-id:mime-version;
 bh=T9rT7wC9piRGYd2cdQSJI2Qnuu7Qsq6vIFOOOo8UVO4=;
 b=ECxu2toiqKe3ct8/pePlEXJVHhIAmPdtK/kORdwC1/Ww4K6BW1D2D8Sz
 eIdO1lcl24G0r/ZRHjxnXNOp6ZeC0tJGwNHmVh4i6NdcN7pOyVVkRtVrD
 qPKcWzU71rGN+L1c+skEA8KJjbFVZHXeSm2BASyd4lWhnT0yo/PihzGpk
 /nfA7wEhxaZeRjKsMOPou5jXr5J4+fuyRWqcxwoJJM3N28oczSH3BknJ/
 niRfQAaGN1kOVB6Bq42443xEppOFv3WvOVmJwdRfZi+C3NCfGPYMDyF1J
 4/FvuZzpoqCR2mzsdNEIsTntnQtJfY6HF6vH0C/WWFEazWx+6Up/UF/IL Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10726"; a="358266179"
X-IronPort-AV: E=Sophos;i="6.00,205,1681196400"; d="scan'208";a="358266179"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2023 11:30:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10726"; a="796373666"
X-IronPort-AV: E=Sophos;i="6.00,205,1681196400"; d="scan'208";a="796373666"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by FMSMGA003.fm.intel.com with ESMTP; 30 May 2023 11:30:27 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 30 May 2023 11:30:27 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Tue, 30 May 2023 11:30:27 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Tue, 30 May 2023 11:30:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PMl42juyVVEjp8CMMKdqzRapmhJMh/fBgU094dgDaL56/7uBPggVxwqOLdDXWPD1W5JQuALo5fh2MGG/0Mr9XtwFGOp1RtJ27pLtqEuRVRAB/My9XgQ9GRh2qSjHaSJagGynXbhOoYs2Fhs61BbXOSOPvFwDQb0Zh46HmeMN+NB4Z+XyEhhWwZ5lroDJP89TgTTidyAf6noDlAX7YlagGtu6uJTuZnkvJKHyOrxnyvCj8a+lY/eIufDgMfUvcNgueT264K+fdcCU/imuN+xnbT1vK9Kp/+B/tc4jjADdZLiGdFB0howydlPthXA1Das7n82gGkndvwPeQGkkmpalNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0ncoImT43cytwIxoWw5ewDeNgY+j/IqQ+uioq0T6v2E=;
 b=Ou7z3CgEOB8GuU2IDOmXstr1rydW95Gt3qKRlYDe5shICuNYcavUI+/8njto/1J0rcoU5xGRwLaTNDwF/N1lp4q2tVcNM4O7dTumwdVGBPzQ6k/4zVqGCcyn3sqMOm2jJOOnHh4f2PZjB2+S2H6N2kxABGfSJWTP0acxDHYkjS9huUdRrQ08dyDOqzYOScuU0nh7fLsMHiesRW59sIexlZ/JxNIBLXBev0YY5JTeW6QKtfhn5cDDIidPvW3EG95xYoB1qGBHCHqFsPebWBpaa9MNtmKl5CA66R+WNShukOohbwn/McTt0XYxuoyynCnzT6AGSkTKlX5Z/Ypa+cuSEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN8PR11MB3556.namprd11.prod.outlook.com (2603:10b6:408:8d::31)
 by SJ0PR11MB4878.namprd11.prod.outlook.com (2603:10b6:a03:2d8::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.23; Tue, 30 May
 2023 18:30:25 +0000
Received: from BN8PR11MB3556.namprd11.prod.outlook.com
 ([fe80::7c95:635b:8059:9e68]) by BN8PR11MB3556.namprd11.prod.outlook.com
 ([fe80::7c95:635b:8059:9e68%4]) with mapi id 15.20.6455.020; Tue, 30 May 2023
 18:30:24 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230530170432.GS10045@mdroper-desk1.amr.corp.intel.com>
References: <20230529150831.259733-1-gustavo.sousa@intel.com>
 <20230530170432.GS10045@mdroper-desk1.amr.corp.intel.com>
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Date: Tue, 30 May 2023 15:30:17 -0300
Message-ID: <168547141788.51912.6080115137980636760@gjsousa-mobl2>
User-Agent: alot/0.10
X-ClientProxiedBy: SJ0PR13CA0136.namprd13.prod.outlook.com
 (2603:10b6:a03:2c6::21) To BN8PR11MB3556.namprd11.prod.outlook.com
 (2603:10b6:408:8d::31)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR11MB3556:EE_|SJ0PR11MB4878:EE_
X-MS-Office365-Filtering-Correlation-Id: 1c75396a-0782-4102-cf4f-08db613bee84
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TQ5oYqAAtDYBACfYEsISZ7ruL3akFdeB/X2NdXGDf3V4ln66pD374lXffW88JItwR7nQUbB/6uiEGvTtSto648QAa2MNEjCGXw3HX/ichM3Wp9q2vruAu84fpPnaVKOut8RPzNLdD3BrdTsl85DfvZg4jnBQMQ1N2GZeS4nwT5OHKO108jAYbY6Wf9NsTusamLUfP5pMR/WtlFw/reCJxAHDZ56tXYpzlUZO6LdXXbRfeFvjWqWNee/WJMA+RZd6xtYCrYAW5pnJjGoxyQ8QBnivRLvD25m+2J9EJDZXvM7cS/6eQdDoZ/5InHLOVLMOrixQR54AMa1JfKumyGGqPpq6hW4cgCtX5JlS1bQbglIbItF8i72PvQQi7HskdU6l9RcXYxSBwQT+FW/9IpJvLbY2cDcW5xX7xsBRvtSM006gFssQyBtLjPireVy26LG+GywVPhxZicLaI0OxzF6w1D46KzJ9OTrZkbbUevue74HVW0ThIF4NCzYNVblhx1p8pka9eJ5i1uPXvh74DhEUy7ZhzFrFxe02tH+KuliBScPi/2FqFAJe8NnN2iH6rkeN
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR11MB3556.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(366004)(39860400002)(136003)(376002)(346002)(396003)(451199021)(26005)(107886003)(38100700002)(41300700001)(6486002)(6666004)(186003)(83380400001)(6512007)(6506007)(9686003)(478600001)(54906003)(6636002)(66556008)(82960400001)(66946007)(4326008)(66476007)(316002)(5660300002)(8676002)(6862004)(8936002)(44832011)(2906002)(33716001)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N2hvSzB3dXhTK2tzVkFMY1RFSTd4TmYyMXd4L29oTGRockFXbENGN0dtekEv?=
 =?utf-8?B?Vi9DMmRxZGRhZzFaN1A0YUN0RjBCelBuaTh5MjVmTGtBZnJhNDZZVTIvZ1Vs?=
 =?utf-8?B?eG1kTXd6SlhDNjZMMWJQaGZHQUpscVB1R1k1YXRCc3ZpUVp5d1pYYUd5aUxh?=
 =?utf-8?B?enBybGhVcFBCemhIK09PMEFGUzVhaURKRUgxUHhDVk1oTmZCNnViZ1g3dUI1?=
 =?utf-8?B?Z1FCTmhPSWdraFhIRDBQZVZFYWZLQ2JNUUR1VVJxTjRJNGdCUTNQZUNuL0lP?=
 =?utf-8?B?R0plS2ZjOG81MTg5SFUwT3E0c0lHSU1saHVCU3Jac1MzMkN5SUJvMVlHYmd2?=
 =?utf-8?B?Q25NTnpXNjExeURCd3ZNc3ZWZm5XdDdEN0VJS0MxaElqOWo2RWxyQUgvdkEr?=
 =?utf-8?B?b0dCNElrRlA5RURCR0ZtdTdUTzc5aitwNFo0MEhxT25EdFVDNUc4RGZkUGJO?=
 =?utf-8?B?NnlFM2R4UkFQeTZSK3hCWWY1MGhDdEM5YUxTamZJTGxBakdscjladUZOcjlK?=
 =?utf-8?B?WHk3SjF4S2ZhdUhDcXJpRzBoQ2JlYU4vTmdJU2U4aUhmbTRDdEVkQXhtNjNT?=
 =?utf-8?B?aEg4WS9FOVlmSXcxSFBubzZhYjJUeUhhMUp1VDl1bHFSblRDUkFPVWhhV2hM?=
 =?utf-8?B?cklhSFFkaEFXdTF0UjcyTzE3NkdTZjFpTFB4VzY4akgxUjFrYit4dzhzM0k5?=
 =?utf-8?B?TnI5emRvNzRoeGpNTDJDZUd2UUZ2NFNXaGNSTTE4ZkowdCtuVzl3bE96MXlH?=
 =?utf-8?B?Mzg4em9iZUpaZktaeHhaaGpCOFh4U2tMYitqdnRSZG1TQkNHV0E4VFVjMk1Q?=
 =?utf-8?B?cSs4c3Bkc0ZVRENyTmhkWjhXbmsyRkF2K3YrcHpuc0VTeUs5OFlRQnZBQnV5?=
 =?utf-8?B?TTBNazBOclp2cTZqclV3byt3ZThPU1JVWWJ1UWlVZ0FLczRsWlVIY01LczRk?=
 =?utf-8?B?TGVuenpRMmtlN1JsZGppNE1yaTVISUp2Vmh1cGJaUVBMVFU0YStCS2dSa3pT?=
 =?utf-8?B?ZW1aMnRBQTV0TjRJa3gvYlluZEEwc2ZxR1RNWXkreHphR1FiVGJCcU5BZWdV?=
 =?utf-8?B?MzhxejBXNHJreEx6TE9mUTRPQmZFN3kyOVdjQS8xMzVUMlB3ekFmOVBkMk4y?=
 =?utf-8?B?QnY4M2pETldxTnFXSWcwR2xaQ2YvZWZyWkJZOVhlYlRlMTZreGp6eWE3T0Nv?=
 =?utf-8?B?T2N5OW45TzgwczZzTjdCVFFpWmd5Q2pHeEt6OTQ3OTFBOTZydlhmVWVpMDlS?=
 =?utf-8?B?dkN6WUE5eTI4UzlNUXdpRERQWnUxMytBVk9nSW4rUk95Ym5CL1hNZVB1VTlx?=
 =?utf-8?B?NzRycHgzNjB5cjI2NFFQM0EvS0JmMnpjanhCOGtxaFdiMU16UjR2QU1aZWh5?=
 =?utf-8?B?ekZBMWZ3MTVHZW1hN3N2bjlDTnZOZDdxMG9VZnhaaHJtQ3Ewem14Sys5SERo?=
 =?utf-8?B?NXczZktpZVhoM2F2TmRVWlM0MitXYWNpTVJkVWJ4d0ZFZE0vc2JhTHZpSHpF?=
 =?utf-8?B?c2hyS3p4STVtTVJFcTZ1WGplN0hNSE1BaHpPek15SmJzSDlZTW4vK1RpemMr?=
 =?utf-8?B?aGZMOTFHOWdiNkszLzNZSHBjOXdwRkpoVE0ySlBObmY3MWdpOUlWTUFQdkVG?=
 =?utf-8?B?WVBBZHNsMU5kK3U0U1FGbWJrTzRnenpldzM4a2ZqTkw5RTdIaEtxcGh2ek1U?=
 =?utf-8?B?NFVYZ2ZFS2UwakhnR0ZlMHB3bFoyL3o5VlVLTGdWZEZRS0xScTlGNjQ0ZE4w?=
 =?utf-8?B?d0dVakRBaGJGdk5YL09SSm9zK2RJaUZyRlFRVlNUTGZoYVFKRmo0RGJyK05S?=
 =?utf-8?B?d1Y1M2x3ckNia3F3Q0E5cWdPTVlnRkNrZ0NtMjJEOVA5czZjSTk1MG5KUFpE?=
 =?utf-8?B?YTZYYk93UmRFdmttalRNcnpLbGFxTDU1L08rdXZWdXhIc2xWTjFhQUFNUWpq?=
 =?utf-8?B?YjVlejZ1dm5xRDA2OTIzV0hTRy81UEZDNmhLTTJEb1ZRSTRId3BnOW5JdDFC?=
 =?utf-8?B?bTF6bkZ0UXNpemlNaW1YNFl5cFRvZnIyTkM5RkxXM1BVejgxQ0NZSkVLS0ta?=
 =?utf-8?B?ZWlRbzZpMTBLblI4a0dWRGV1bGlRTHFKRkdydUhtTFdBQmp1c1ZvUVhFUVE4?=
 =?utf-8?B?NUgwU3AyaDB5QndObkNpOEt3dlVUMVNBcHlQMjArNFVKaldPVndoTFJmWS9p?=
 =?utf-8?B?YWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c75396a-0782-4102-cf4f-08db613bee84
X-MS-Exchange-CrossTenant-AuthSource: BN8PR11MB3556.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2023 18:30:24.0742 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AjD36KyKqtBtKDTNvevkOZOtbkySeWwmH3TQ3QwF0iiVc7c4KMPzEbq6wHvv+iH2Na80V7//+NQXJEGW6OL8UQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4878
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe: Replace DRM_ERROR() with drm_err()
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
Cc: Jani Nikula <jani.nikula@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Quoting Matt Roper (2023-05-30 14:04:32-03:00)
>On Mon, May 29, 2023 at 12:08:31PM -0300, Gustavo Sousa wrote:
>> DRM_ERROR() has been deprecated in favor of pr_err(). However, we should
>> prefer to use drm_err() whenever possible so we get device-specific
>> output with the error message.
>>=20
>> Adding an "xe" member to struct xe_reg_sr does not seem very
>> justifiable, since the only as of now is to register a clean up function
>> and, with this change, print error messages. So let's just add a
>> parameter to xe_reg_sr_add().
>>=20
>> v2:
>>   - Prefer drm_err() over pr_err(). (Matt, Jani)
>>=20
>> Cc: Matt Roper <matthew.d.roper@intel.com>
>> Cc: Jani Nikula <jani.nikula@intel.com>
>> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>> Cc: Haridhar Kalvala <haridhar.kalvala@intel.com>
>> Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
>> ---
>>  drivers/gpu/drm/xe/xe_reg_sr.c | 14 ++++++++------
>>  drivers/gpu/drm/xe/xe_reg_sr.h |  3 ++-
>>  drivers/gpu/drm/xe/xe_rtp.c    |  2 +-
>>  drivers/gpu/drm/xe/xe_vm.c     |  3 ++-
>>  4 files changed, 13 insertions(+), 9 deletions(-)
>>=20
>> diff --git a/drivers/gpu/drm/xe/xe_reg_sr.c b/drivers/gpu/drm/xe/xe_reg_=
sr.c
>> index 24d9c73ef279..02ba95223d7b 100644
>> --- a/drivers/gpu/drm/xe/xe_reg_sr.c
>> +++ b/drivers/gpu/drm/xe/xe_reg_sr.c
>> @@ -90,7 +90,8 @@ static void reg_sr_inc_error(struct xe_reg_sr *sr)
>>  }
>> =20
>>  int xe_reg_sr_add(struct xe_reg_sr *sr,
>> -                  const struct xe_reg_sr_entry *e)
>> +                  const struct xe_reg_sr_entry *e,
>> +                  struct xe_device *xe)
>
>I think we traditionally try to keep the device pointer as the first
>parameter in the list.  It looks a bit strange to have it here at the
>end.

Hm... But xe is only used as an auxiliary thing so we get richer error mess=
age,
right?

By the way, I tried to follow what is already being done in this file:
xe_reg_sr_init() kinda does the same.

Let me know if xe as the first argument is still the preferred style here. =
Then
I can fix this one and send a patch for xe_reg_sr_init().

>
>>  {
>>          unsigned long idx =3D e->reg.addr;
>>          struct xe_reg_sr_entry *pentry =3D xa_load(&sr->xa, idx);
>> @@ -123,11 +124,12 @@ int xe_reg_sr_add(struct xe_reg_sr *sr,
>>          return 0;
>> =20
>>  fail:
>> -        DRM_ERROR("Discarding save-restore reg %04lx (clear: %08x, set:=
 %08x, masked: %s, mcr: %s): ret=3D%d\n",
>> -                  idx, e->clr_bits, e->set_bits,
>> -                  str_yes_no(e->reg.masked),
>> -                  str_yes_no(e->reg.mcr),
>> -                  ret);
>> +        drm_err(&xe->drm,
>> +                "Discarding save-restore reg %04lx (clear: %08x, set: %=
08x, masked: %s, mcr: %s): ret=3D%d\n",
>> +                idx, e->clr_bits, e->set_bits,
>> +                str_yes_no(e->reg.masked),
>> +                str_yes_no(e->reg.mcr),
>> +                ret);
>>          reg_sr_inc_error(sr);
>> =20
>>          return ret;
>> diff --git a/drivers/gpu/drm/xe/xe_reg_sr.h b/drivers/gpu/drm/xe/xe_reg_=
sr.h
>> index 0bfe66ea29bf..3e337f174ae3 100644
>> --- a/drivers/gpu/drm/xe/xe_reg_sr.h
>> +++ b/drivers/gpu/drm/xe/xe_reg_sr.h
>> @@ -19,7 +19,8 @@ struct drm_printer;
>>  int xe_reg_sr_init(struct xe_reg_sr *sr, const char *name, struct xe_de=
vice *xe);
>>  void xe_reg_sr_dump(struct xe_reg_sr *sr, struct drm_printer *p);
>> =20
>> -int xe_reg_sr_add(struct xe_reg_sr *sr, const struct xe_reg_sr_entry *e=
);
>> +int xe_reg_sr_add(struct xe_reg_sr *sr, const struct xe_reg_sr_entry *e=
,
>> +                  struct xe_device *xe);
>>  void xe_reg_sr_apply_mmio(struct xe_reg_sr *sr, struct xe_gt *gt);
>>  void xe_reg_sr_apply_whitelist(struct xe_reg_sr *sr, u32 mmio_base,
>>                                 struct xe_gt *gt);
>> diff --git a/drivers/gpu/drm/xe/xe_rtp.c b/drivers/gpu/drm/xe/xe_rtp.c
>> index 43a86358efb6..93067f4fd480 100644
>> --- a/drivers/gpu/drm/xe/xe_rtp.c
>> +++ b/drivers/gpu/drm/xe/xe_rtp.c
>> @@ -122,7 +122,7 @@ static void rtp_add_sr_entry(const struct xe_rtp_act=
ion *action,
>>          };
>> =20
>>          sr_entry.reg.addr +=3D mmio_base;
>> -        xe_reg_sr_add(sr, &sr_entry);
>> +        xe_reg_sr_add(sr, &sr_entry, gt_to_xe(gt));
>
>If we have a GT here, then it may be best to pass that down and use
>xe_gt_err() above instead.  That will include extra GT identification
>output that makes debugging easier when running on a platform that has
>more than one GT.

Yeah... I realized that a little too late. I'll send a new version once I g=
et an
actionable reply for my comment above.

Thanks!

--
Gustavo Sousa
