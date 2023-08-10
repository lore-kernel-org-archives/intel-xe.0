Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3B7CC001E0
	for <intel-xe@archiver.kernel.org>; Thu, 10 Aug 2023 11:21:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C13310E50A;
	Thu, 10 Aug 2023 11:21:03 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C370810E501
 for <intel-xe@lists.freedesktop.org>; Thu, 10 Aug 2023 11:21:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1691666460; x=1723202460;
 h=from:to:subject:date:message-id:references:in-reply-to:
 mime-version; bh=JwAsAtjK4LY25oPogFuW3dCR3sKzg1BTSCAIQPJcS5Y=;
 b=hI89IpTagsnfSFSNfwpyZzbRSWIOEJJ/4TA0p5Eqq6laJhz/uWVswrfN
 f7o1WHXKpbGXWn/H39izD1YAkJcrTVp5yCtUWg41qZ+mHBUaOMvg0eLQp
 M6roDecdBDt3lcrezn6ZXSY5HxX+qm0N7w/o4NkI0a89okKt34GoOP0ZB
 O7PMP6yd2ADQlzHgDphTI/Uzz1XhAJ83pR3gGAJpe43y5aPitNkDanKCW
 Az7mK2w/fGZYfPr2vde1fXMt9QShKUbYUf6396NQarSP9t9W0e0xV77I8
 0THTcvxJT3jO9SmAIRcmQaEZ4rxT8/fXnX39M6RJzlgNOhb1uCoLCCmNN w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10797"; a="350956102"
X-IronPort-AV: E=Sophos;i="6.01,162,1684825200"; 
 d="scan'208,217";a="350956102"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Aug 2023 04:20:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10797"; a="802172001"
X-IronPort-AV: E=Sophos;i="6.01,162,1684825200"; 
 d="scan'208,217";a="802172001"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga004.fm.intel.com with ESMTP; 10 Aug 2023 04:20:59 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 10 Aug 2023 04:20:59 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Thu, 10 Aug 2023 04:20:59 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.41) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Thu, 10 Aug 2023 04:20:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MDCBdLgwmtMG2wfTxRVrRR2lScd8B9CFEt0xmXHhYdWtltPzbsYyMXqTKYdSu4vf/jpS5YUDTFiRE2fZf39lhbBx/sAZpPXAL9ckN+QaiIu7S1rS7l2Qb0xCX3wHANjl0jti2dS/Rg6cibJP8vq9JuIGVUb2MOqj/WHc4j8SpI1LG8WGIicUm1Og4M6la/GuInHvPCJ6cnIp2HNxsFCQvnZoYg1pFC7zc2YTAE8YwgNKBGyAla/1QLYgSQsNYWobkiDIPkkZctkmdnAfyl6XO7wXRKIZAj7JV2CTG45vkDuFo4F9LCz2p/jloFsXvZMTW/4O5ovfI4ICk6R26Evr8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0hKOhlI+VsW5iFvuuj8oNVZFvBRUkxToOhCkp/Ijr+o=;
 b=jwxL1x29g4lNKq9wsF5A5wDS43Xl+/SNFHao9vO+pfNqrhf35qUxct4NVs0NC8/Fl0WTDC13Hj6sPQuhxKSWh5HfbRv0JPLJNos7MN6Gue2foxytEwYnGbukKbV3j33PVScBYdO/ivq7G9pko5n884GKgeWtk4n9hgwYETNLna0A1m8xk4NzMqAn1kVmVirTpOKVne4/a5henbrlu01CfSpOSikWH3P5vAsPRKvgHFjE4uOtD2hiqMoHG+DaGktYG9X0tWJuNu7krOVltPzzSk1OPIBe0bjJLlyNZNJva7LXk2vgKUOD2TLNq1YyK4627gEEh7AbTGs6on47dpcYnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by SA0PR11MB4622.namprd11.prod.outlook.com (2603:10b6:806:9c::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.30; Thu, 10 Aug
 2023 11:20:57 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::1ed2:437d:1d6c:da25]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::1ed2:437d:1d6c:da25%6]) with mapi id 15.20.6652.029; Thu, 10 Aug 2023
 11:20:56 +0000
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
To: "Nikula, Jani" <jani.nikula@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
Thread-Topic: [PATCH v2 1/4] drm/xe: Handle errors from various components.
Thread-Index: AQHZy0f0hd9I0nxhAkOwPDdzU+6cWq/jKVgAgAAa5wCAAAHogIAACw8AgAAQ0Vg=
Date: Thu, 10 Aug 2023 11:20:56 +0000
Message-ID: <MW4PR11MB7056CDA2898D6F47ADFA57D0B313A@MW4PR11MB7056.namprd11.prod.outlook.com>
References: <20230810050755.715775-1-himal.prasad.ghimiray@intel.com>
 <20230810050755.715775-2-himal.prasad.ghimiray@intel.com>
 <877cq3s567.fsf@intel.com> <ac574fd9-dce4-4f1e-a209-f4a400263273@intel.com>
 <78b0e2d2-3c4c-484f-bcd4-fa896adef534@intel.com> <87y1ijqjzx.fsf@intel.com>
In-Reply-To: <87y1ijqjzx.fsf@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW4PR11MB7056:EE_|SA0PR11MB4622:EE_
x-ms-office365-filtering-correlation-id: 6e056e79-e15f-4bb6-ca3e-08db9993de0e
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: gAW6yMt3s4vV3J5dEzbbfvCDA7qncemGrh47hh7Kwf5c5FapE8unO5LMKbrATS4ukdqs90WMTqIHIXIlr04rtx1MG9LARgxzz0bM6lThWWx6v0n/SNoCOrjsmPj2jHHmhMD6I/3+NLPe923mPbNlFVMEx+D5NFuEr3taF3HOPGqywtW16AaGo/nX5x41V2te97FG4j+giMaUEJ4y2FIyNh8AXV+NA2l5wV5G/qTP69yZVGiivIbX8xQV3j3fM/OgMsP6AhIwXDrrwlJMO9dzulQGCVmPCzwISQdNmd8tDal1Tafi3PemrT+G3pBlyJay0eBhiZ5MqrzWbG28yuXpFyN93dw28n59yzx84uV7mZ1dANSNTrir+ZKgg5kbj5b2/KXT+zRDOZMSE5kCqB8JjK4MXpslqQjJHQDdqpuaPb749htpbWg0oflC8VFPb87d8wcqBvWTis4+H85Lp5/E4rxUlwYA7fkF8Xet3EKMzHnSQi0CvXHWJv6aLMNmzpmudxzG1QlTpoiwH5OJ6fXlF83vO+UbVBHZbenv2LADLizkVm4NuUcHqNabKXp0lbRVy7V4jjExeDDuMnnpIoC+h1PuObOQ0jzcbxiNd+SWChI=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(366004)(376002)(39860400002)(346002)(396003)(136003)(186006)(1800799006)(451199021)(83380400001)(166002)(30864003)(38100700002)(122000001)(76116006)(2906002)(55016003)(82960400001)(8676002)(33656002)(316002)(5660300002)(8936002)(66556008)(41300700001)(66476007)(66446008)(64756008)(66946007)(53546011)(40265005)(52536014)(86362001)(110136005)(478600001)(26005)(9686003)(6506007)(966005)(71200400001)(38070700005)(7696005)(579004);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?x2h3jVWpk54+OV3WfaYpZZKf2JXxbJnpzHKgpgSgTJTC5yOIgMwseh69Yj?=
 =?iso-8859-1?Q?DhaHayrW8Op5+YevB0Ev/wf4SiDcasVVO8jud2lQH50fnq8dDIhKaDE5Ce?=
 =?iso-8859-1?Q?UN2+9qyz6oxPxSffYAlWdFzilvV9AWS5UBszi6V6KWIf2zsXKhejvkqQZb?=
 =?iso-8859-1?Q?KiV9zbdNYHlVeGoNZzLCzK14JvkYb9QtmimQwRyOa3lh79ZRB6yhSepS7u?=
 =?iso-8859-1?Q?IB4DearHSx61sqGVZGNJzW1z0dF0175UVocWU0fQj3BPrC8Mdz3YxJO9U4?=
 =?iso-8859-1?Q?KRjGMvLFqyywz83DJ/+OiWNgBTjUfMx3Yx+woFiUmiAcU+y8wp0nNR39BJ?=
 =?iso-8859-1?Q?2hVooJyUs1ur0FItxqIRalXLsOyv9g0bQbIzvJxn89+eYm4DPiRV2uLIGi?=
 =?iso-8859-1?Q?+NzyN9OraGqGWLc0BIqp9ulCytZzm3F/05keMgUghq0sYpH3IkfKIY8wX5?=
 =?iso-8859-1?Q?6bFc0GYJylP6TwQ7IAHHprYudi0xuHE8K3SmlBM9kfO97/Q27rr+wByIbK?=
 =?iso-8859-1?Q?iC5sVpXynOOZdRHcQciLymxdM/IGBl1ajvc2lA1PXHsKg3VR091Lcuua1C?=
 =?iso-8859-1?Q?8juTGCn+dKpdHyrMksxL7mfl1dHH6dCg8eb3a2L7vQvOOgQijV8Nl/PJvz?=
 =?iso-8859-1?Q?baG67TMtArZED2IN2i2iKqHOGJbWs8SuxhF89yb5dNwvqVFvYiLGkoZhXI?=
 =?iso-8859-1?Q?6+mEkBQVBxQ4One1T+g59/HGJDLE7wCXg9TWpSoDbmrugnflpipFgRYaQn?=
 =?iso-8859-1?Q?7VJfHSyafWD//jQ0yFdrw6WOdsHGmXk6/ujFlDBnBSZnsld4YC6uCV7YIa?=
 =?iso-8859-1?Q?iXe6qPXEkIAbPyGN/h0zZ9NqmyMkbRFRUxhi0Vum2wak3iAgtCECMxa+wS?=
 =?iso-8859-1?Q?NQFr2log4KfxKqdPyqjykakJaBepqgEFbg/oSIPbgSRvSZzogH9xcdcINh?=
 =?iso-8859-1?Q?6+Y5mLs/YPz6aKdoMq9g+5qfk3UKpSjXHPVVNZTogrQK2I9LoJFjkLHS7u?=
 =?iso-8859-1?Q?8PZWRTsxoC+Tq7D8oL8Lz69fgZasFCw7aHbN7M3waPCd/Vb+lwgHLlpUQT?=
 =?iso-8859-1?Q?vs5/figjRVb+ACNyjJmUi9YQAnckaG06qMIAcK87t8nybqgmUpgL22ml8A?=
 =?iso-8859-1?Q?FaydKSYqSuSb3Mi3pG104M5g14CzueAqQg00mqURA7tkejyPPq9GkqT6gu?=
 =?iso-8859-1?Q?stopidC82CjjqVJ13wRwz4zYGfxB1KAXBqWpgigGo6rGvYXfjE+BaL2yEu?=
 =?iso-8859-1?Q?CQbQSf6OUoni41XYV4jgKg4s1aEPOIS9zLPut4K/u+g5RZfGHJ35P2aupC?=
 =?iso-8859-1?Q?RAm2R9737P3oOKwKWLL1DSyGMgKsthya9hxMJEAhAIK75XPtW8jijpnkrY?=
 =?iso-8859-1?Q?wYV+0l+lUOcPnW5iSYlik5gCyghRFgaD7JYPe3MSfJQ1rtjsyItQHv7r0N?=
 =?iso-8859-1?Q?P4TKA+Ndgc5ldVWWpmdIC75Da8+SQk2GxRAKT//tKztfXH9eS1aBBA+d0s?=
 =?iso-8859-1?Q?1xNN6sLjxTrPJsZ8e7mM1CSEVqDBpR8AglvqRsULluYA2uYxvaCy/Gx7Ri?=
 =?iso-8859-1?Q?T4nujnq1EVKoDTEEx7if/MEBVS5isoGxZrDwwudY0BvySaYt0LbdB2EuOZ?=
 =?iso-8859-1?Q?nQ9xfXggDck/waWlg3YCMQ2/NhW/DhlpqEdCbSGkok8S5+jsWzQAyLvifj?=
 =?iso-8859-1?Q?9+OnNZXMQlTcaK6IWq0=3D?=
Content-Type: multipart/alternative;
 boundary="_000_MW4PR11MB7056CDA2898D6F47ADFA57D0B313AMW4PR11MB7056namp_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e056e79-e15f-4bb6-ca3e-08db9993de0e
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Aug 2023 11:20:56.7419 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RQPnbC5BNICXde15vLIyMRz9+mYPALtHKZdRhwVOZzvypTzHCc1D/YuUkPDeqnL0BqE2FTKv7F2Tz8cBMFfQcYTRi1j3/bLMO69wRCWRYB4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4622
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 1/4] drm/xe: Handle errors from various
 components.
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

--_000_MW4PR11MB7056CDA2898D6F47ADFA57D0B313AMW4PR11MB7056namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi Nikula,

I had missed adding mailing list to reply done to you.

Below mail is  cc addition to mailing list without change in content sent t=
o you as reply.

BR
Himal

________________________________
From: Nikula, Jani <jani.nikula@intel.com>
Sent: Thursday, August 10, 2023 3:47:49 pm
To: Ghimiray, Himal Prasad <himal.prasad.ghimiray@intel.com>; intel-xe@list=
s.freedesktop.org <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v2 1/4] drm/xe: Handle errors from various components.


Is there any new content here? This is what it looks like to me:

https://lore.kernel.org/r/78b0e2d2-3c4c-484f-bcd4-fa896adef534@intel.com

BR,
Jani

On Thu, 10 Aug 2023, "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.=
com> wrote:
> On 10-08-2023 15:01, Ghimiray, Himal Prasad wrote:
>>
>>
>> On 10-08-2023 13:24, Jani Nikula wrote:
>>> On Thu, 10 Aug 2023, Himal Prasad Ghimiray<himal.prasad.ghimiray@intel.=
com>  wrote:
>>>> The GFX device can generate numbers of classes of error under the new
>>>> infrastructure: correctable, non-fatal, and fatal errors.
>>>>
>>>> The non-fatal and fatal error classes distinguish between levels of
>>>> severity for uncorrectable errors. Driver will only handle logging
>>>> of errors and updating counters from various components within the
>>>> graphics device. Anything more will be handled at system level.
>>>>
>>>> For errors that will route as interrupts, three bits in the Master
>>>> Interrupt Register will be used to convey the class of error.
>>>>
>>>> For each class of error: Determine source of error (IP block) by readi=
ng
>>>> the Device Error Source Register (RW1C) that
>>>> corresponds to the class of error being serviced.
>>>>
>>>> Bspec: 50875, 53073, 53074, 53075
>>>>
>>>> Cc: Rodrigo Vivi<rodrigo.vivi@intel.com>
>>>> Cc: Aravind Iddamsetty<aravind.iddamsetty@intel.com>
>>>> Cc: Matthew Brost<matthew.brost@intel.com>
>>>> Cc: Matt Roper<matthew.d.roper@intel.com>
>>>> Cc: Joonas Lahtinen<joonas.lahtinen@linux.intel.com>
>>>> Cc: Jani Nikula<jani.nikula@intel.com>
>>>> Signed-off-by: Himal Prasad Ghimiray<himal.prasad.ghimiray@intel.com>
>>>> ---
>>>>   drivers/gpu/drm/xe/regs/xe_regs.h            |   7 +
>>>>   drivers/gpu/drm/xe/regs/xe_tile_error_regs.h | 108 +++++++++
>>>>   drivers/gpu/drm/xe/xe_device_types.h         |   6 +
>>>>   drivers/gpu/drm/xe/xe_irq.c                  | 220 +++++++++++++++++=
++
>>>>   4 files changed, 341 insertions(+)
>>>>   create mode 100644 drivers/gpu/drm/xe/regs/xe_tile_error_regs.h
>>>>
>>>> diff --git a/drivers/gpu/drm/xe/regs/xe_regs.h b/drivers/gpu/drm/xe/re=
gs/xe_regs.h
>>>> index ec45b1ba9db1..9901e55fc89c 100644
>>>> --- a/drivers/gpu/drm/xe/regs/xe_regs.h
>>>> +++ b/drivers/gpu/drm/xe/regs/xe_regs.h
>>>> @@ -87,7 +87,14 @@
>>>>   #define   GU_MISC_IRQ                            REG_BIT(29)
>>>>   #define   DISPLAY_IRQ                            REG_BIT(16)
>>>>   #define   GT_DW_IRQ(x)                           REG_BIT(x)
>>>> +#define   XE_ERROR_IRQ(x)                 REG_BIT(26 + (x))
>>>>
>>>>   #define PVC_RP_STATE_CAP                 XE_REG(0x281014)
>>>>
>>>> +enum hardware_error {
>>>> +  HARDWARE_ERROR_CORRECTABLE =3D 0,
>>>> +  HARDWARE_ERROR_NONFATAL =3D 1,
>>>> +  HARDWARE_ERROR_FATAL =3D 2,
>>>> +  HARDWARE_ERROR_MAX,
>>>> +};
>>> This file is about registers. IMO enums belong somewhere else. Define
>>> hardware registers using macros.
>>
>> Hmm. Will look for better placeholder for this enum.
>>
>>>>   #endif
>>>> diff --git a/drivers/gpu/drm/xe/regs/xe_tile_error_regs.h b/drivers/gp=
u/drm/xe/regs/xe_tile_error_regs.h
>>>> new file mode 100644
>>>> index 000000000000..fbb794b2f183
>>>> --- /dev/null
>>>> +++ b/drivers/gpu/drm/xe/regs/xe_tile_error_regs.h
>>>> @@ -0,0 +1,108 @@
>>>> +/* SPDX-License-Identifier: MIT */
>>>> +/*
>>>> + * Copyright =A9 2023 Intel Corporation
>>>> + */
>>>> +#ifndef XE_TILE_ERROR_REGS_H_
>>>> +#define XE_TILE_ERROR_REGS_H_
>>>> +
>>>> +#include <linux/stddef.h>
>>>> +
>>>> +#define _DEV_ERR_STAT_NONFATAL                         0x100178
>>>> +#define _DEV_ERR_STAT_CORRECTABLE                      0x10017c
>>>> +#define DEV_ERR_STAT_REG(x)                            XE_REG(_PICK_E=
VEN((x), \
>>>> +                                                          _DEV_ERR_ST=
AT_CORRECTABLE, \
>>>> +                                                          _DEV_ERR_ST=
AT_NONFATAL))
>>>> +
>>>> +#define  DEV_ERR_STAT_MAX_ERROR_BIT         (21)
>>>> +
>>>> +/* Count of  Correctable and Uncorrectable errors reported on tile */
>>>> +enum xe_tile_hw_errors {g
>>>> +  XE_TILE_HW_ERR_GT_FATAL =3D 0,
>>>> +  XE_TILE_HW_ERR_SGGI_FATAL,
>>>> +  XE_TILE_HW_ERR_DISPLAY_FATAL,
>>>> +  XE_TILE_HW_ERR_SGDI_FATAL,
>>>> +  XE_TILE_HW_ERR_SGLI_FATAL,
>>>> +  XE_TILE_HW_ERR_SGUNIT_FATAL,
>>>> +  XE_TILE_HW_ERR_SGCI_FATAL,
>>>> +  XE_TILE_HW_ERR_GSC_FATAL,
>>>> +  XE_TILE_HW_ERR_SOC_FATAL,
>>>> +  XE_TILE_HW_ERR_MERT_FATAL,
>>>> +  XE_TILE_HW_ERR_SGMI_FATAL,
>>>> +  XE_TILE_HW_ERR_UNKNOWN_FATAL,
>>>> +  XE_TILE_HW_ERR_SGGI_NONFATAL,
>>>> +  XE_TILE_HW_ERR_DISPLAY_NONFATAL,
>>>> +  XE_TILE_HW_ERR_SGDI_NONFATAL,
>>>> +  XE_TILE_HW_ERR_SGLI_NONFATAL,
>>>> +  XE_TILE_HW_ERR_GT_NONFATAL,
>>>> +  XE_TILE_HW_ERR_SGUNIT_NONFATAL,
>>>> +  XE_TILE_HW_ERR_SGCI_NONFATAL,
>>>> +  XE_TILE_HW_ERR_GSC_NONFATAL,
>>>> +  XE_TILE_HW_ERR_SOC_NONFATAL,
>>>> +  XE_TILE_HW_ERR_MERT_NONFATAL,
>>>> +  XE_TILE_HW_ERR_SGMI_NONFATAL,
>>>> +  XE_TILE_HW_ERR_UNKNOWN_NONFATAL,
>>>> +  XE_TILE_HW_ERR_GT_CORR,
>>>> +  XE_TILE_HW_ERR_DISPLAY_CORR,
>>>> +  XE_TILE_HW_ERR_SGUNIT_CORR,
>>>> +  XE_TILE_HW_ERR_GSC_CORR,
>>>> +  XE_TILE_HW_ERR_SOC_CORR,
>>>> +  XE_TILE_HW_ERR_UNKNOWN_CORR,
>>>> +};
>>> Ditto about enums and regs.
>> Will address.
>>>> +
>>>> +#define XE_TILE_HW_ERROR_MAX (XE_TILE_HW_ERR_UNKNOWN_CORR + 1)
>>> If it's an enum, adding that last in the enum does the trick.
>> Makes sense.
>>>> +
>>>> +#define PVC_DEV_ERR_STAT_FATAL_MASK \
>>>> +          (REG_BIT(0) | \
>>>> +           REG_BIT(1) | \
>>>> +           REG_BIT(8) | \
>>>> +           REG_BIT(9) | \
>>>> +           REG_BIT(13) | \
>>>> +           REG_BIT(16) | \
>>>> +           REG_BIT(20))
>>>> +
>>>> +#define PVC_DEV_ERR_STAT_NONFATAL_MASK \
>>>> +          (REG_BIT(0) | \
>>>> +           REG_BIT(1) | \
>>>> +           REG_BIT(8) | \
>>>> +           REG_BIT(9) | \
>>>> +           REG_BIT(13) | \
>>>> +           REG_BIT(16) | \
>>>> +           REG_BIT(20))
>>>> +
>>>> +#define PVC_DEV_ERR_STAT_CORRECTABLE_MASK \
>>>> +          (REG_BIT(0) | \
>>>> +           REG_BIT(8))
>>>> +
>>>> +#define DG2_DEV_ERR_STAT_FATAL_MASK \
>>>> +          (REG_BIT(0) | \
>>>> +           REG_BIT(4) | \
>>>> +           REG_BIT(8) | \
>>>> +           REG_BIT(12) | \
>>>> +           REG_BIT(16))
>>>> +
>>>> +#define DG2_DEV_ERR_STAT_NONFATAL_MASK \
>>>> +          (REG_BIT(0) | \
>>>> +           REG_BIT(4) | \
>>>> +           REG_BIT(8) | \
>>>> +           REG_BIT(12) | \
>>>> +           REG_BIT(16) | \
>>>> +           REG_BIT(20))
>>>> +
>>>> +#define DG2_DEV_ERR_STAT_CORRECTABLE_MASK \
>>>> +          (REG_BIT(0) | \
>>>> +           REG_BIT(4) | \
>>>> +           REG_BIT(8) | \
>>>> +           REG_BIT(12) | \
>>>> +           REG_BIT(16))
>>> Are the above supposed to match what's in xe_tile_hw_errors? Seems
>>> rather unmaintainable.
>> xe_tile_hw_errors contains superset of applicable platforms and mask det=
ermines
>> what are applicable bits for a platform.
>>>> +
>>>> +#define REG_SIZE 32
>>>> +
>>>> +#define xe_tile_log_hw_err(tile, fmt, ...) \
>>>> +  drm_err_ratelimited(&tile_to_xe(tile)->drm, HW_ERR "TILE%d detected=
 " fmt, \
>>>> +                      tile->id, ##__VA_ARGS__)
>>>> +
>>>> +#define xe_tile_log_hw_warn(tile, fmt, ...) \
>>>> +  drm_warn(&tile_to_xe(tile)->drm, HW_ERR "TILE%d detected " fmt, \
>>>> +           tile->id, ##__VA_ARGS__)
>>> Do we really want to keep adding new macros for all possible scenarios
>>> in the driver? This is getting out of hand.
>>>
>>> Where's HW_ERR defined?
>> include/linux/printk.h defines HW_ERR.
>>>> +
>>>> +#endif
>>>> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe=
/xe_device_types.h
>>>> index f84ecb976f5d..1335ba74981a 100644
>>>> --- a/drivers/gpu/drm/xe/xe_device_types.h
>>>> +++ b/drivers/gpu/drm/xe/xe_device_types.h
>>>> @@ -16,6 +16,7 @@
>>>>   #include "xe_gt_types.h"
>>>>   #include "xe_platform_types.h"
>>>>   #include "xe_step_types.h"
>>>> +#include "regs/xe_tile_error_regs.h"
>>>>
>>>>   #if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
>>>>   #include "ext/intel_device_info.h"
>>>> @@ -166,6 +167,11 @@ struct xe_tile {
>>>>
>>>>     /** @sysfs: sysfs' kobj used by xe_tile_sysfs */
>>>>     struct kobject *sysfs;
>>>> +
>>>> +  /** @tile_hw_errors: hardware errors reported for the tile */
>>>> +  struct tile_hw_errors {
>>>> +          unsigned long hw[XE_TILE_HW_ERROR_MAX];
>>> Even with the documentation comment, I have to look up the source code
>>> to realize this is the *number* of errors for each class.
>>>
>>> Maybe "count" is more informative than "hw".
>> Ok.
>>>> +  } errors;
>>>>   };
>>>>
>>>>   /**
>>>> diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
>>>> index 2022a5643e01..04a665faea23 100644
>>>> --- a/drivers/gpu/drm/xe/xe_irq.c
>>>> +++ b/drivers/gpu/drm/xe/xe_irq.c
>>>> @@ -362,6 +362,223 @@ static void dg1_intr_enable(struct xe_device *xe=
, bool stall)
>>>>             xe_mmio_read32(mmio, DG1_MSTR_TILE_INTR);
>>>>   }
>>>>
>>>> +static const char *
>>>> +hardware_error_type_to_str(const enum hardware_error hw_err)
>>>> +{
>>>> +  switch (hw_err) {
>>>> +  case HARDWARE_ERROR_CORRECTABLE:
>>>> +          return "CORRECTABLE";
>>>> +  case HARDWARE_ERROR_NONFATAL:
>>>> +          return "NONFATAL";
>>>> +  case HARDWARE_ERROR_FATAL:
>>>> +          return "FATAL";
>>>> +  default:
>>>> +          return "UNKNOWN";
>>>> +  }
>>>> +}
>>>> +
>>>> +struct error_msg_counter_pair {
>>>> +  const char *errmsg;
>>>> +  int errcounter;
>>> Counter? Or type/class/whatever?
>>>
>>>> +};
>>>> +
>>>> +struct error_msg_counter_pair dev_err_stat_fatal_reg[] =3D {
>>>> +  {"GT",                  XE_TILE_HW_ERR_GT_FATAL                 /* =
Bit Pos 0 */},
>>> Does this again tie the enums and the bit positions together, similar t=
o
>>> how the mask macros also do above?
>>>
>>> There needs to be a single point of truth for all of this.
>>>
>>> I think this needs a redesign.
>>
>> As commented above this is array which defines all valid bit positions
>> irrespective of platform. Mask was
>>
>> to determine platform specific applicability.
>>
>>> BR,
>>> Jani.
>>>
>>>> +  {"SGGI Cmd Parity",     XE_TILE_HW_ERR_SGGI_FATAL               /* =
Bit Pos 1 */},
>>>> +  {"Undefined",           XE_TILE_HW_ERR_UNKNOWN_FATAL},
>>>> +  {"Undefined",           XE_TILE_HW_ERR_UNKNOWN_FATAL},
>>>> +  {"DISPLAY",             XE_TILE_HW_ERR_DISPLAY_FATAL            /* =
Bit Pos 4 */},
>>>> +  {"Undefined",           XE_TILE_HW_ERR_UNKNOWN_FATAL},
>>>> +  {"Undefined",           XE_TILE_HW_ERR_UNKNOWN_FATAL},
>>>> +  {"Undefined",           XE_TILE_HW_ERR_UNKNOWN_FATAL},
>>>> +  {"GSC error",           XE_TILE_HW_ERR_GSC_FATAL                /* =
Bit Pos 8 */},
>>>> +  {"SGLI Cmd Parity",     XE_TILE_HW_ERR_SGLI_FATAL               /* =
Bit Pos 9 */},
>>>> +  {"Undefined",           XE_TILE_HW_ERR_UNKNOWN_FATAL},
>>>> +  {"Undefined",           XE_TILE_HW_ERR_UNKNOWN_FATAL},
>>>> +  {"SGUNIT",              XE_TILE_HW_ERR_SGUNIT_FATAL             /* =
Bit Pos 12 */},
>>>> +  {"SGCI Cmd Parity",     XE_TILE_HW_ERR_SGCI_FATAL               /* =
Bit Pos 13 */},
>>>> +  {"Undefined",           XE_TILE_HW_ERR_UNKNOWN_FATAL},
>>>> +  {"Undefined",           XE_TILE_HW_ERR_UNKNOWN_FATAL},
>>>> +  {"SOC ERROR",           XE_TILE_HW_ERR_SOC_FATAL                /* =
Bit Pos 16 */},
>>>> +  {"Undefined",           XE_TILE_HW_ERR_UNKNOWN_FATAL},
>>>> +  {"Undefined",           XE_TILE_HW_ERR_UNKNOWN_FATAL},
>>>> +  {"Undefined",           XE_TILE_HW_ERR_UNKNOWN_FATAL},
>>>> +  {"MERT Cmd Parity",     XE_TILE_HW_ERR_MERT_FATAL               /* =
Bit Pos 20 */},
>>>> +};
>>>> +
>>>> +struct error_msg_counter_pair dev_err_stat_nonfatal_reg[] =3D {
>>>> +  {"GT",                  XE_TILE_HW_ERR_GT_NONFATAL              /* =
Bit Pos 0 */},
>>>> +  {"SGGI Data Parity",    XE_TILE_HW_ERR_SGGI_NONFATAL            /* =
Bit Pos 1 */},
>>>> +  {"Undefined",           XE_TILE_HW_ERR_UNKNOWN_NONFATAL},
>>>> +  {"Undefined",           XE_TILE_HW_ERR_UNKNOWN_NONFATAL},
>>>> +  {"DISPLAY",             XE_TILE_HW_ERR_DISPLAY_NONFATAL         /* =
Bit Pos 4 */},
>>>> +  {"SGDI Data Parity",    XE_TILE_HW_ERR_SGDI_NONFATAL            /* =
Bit Pos 5 */},
>>>> +  {"Undefined",           XE_TILE_HW_ERR_UNKNOWN_NONFATAL},
>>>> +  {"Undefined",           XE_TILE_HW_ERR_UNKNOWN_NONFATAL},
>>>> +  {"GSC",                 XE_TILE_HW_ERR_GSC_NONFATAL             /* =
Bit Pos 8 */},
>>>> +  {"SGLI Data Parity",    XE_TILE_HW_ERR_SGLI_NONFATAL            /* =
Bit Pos 9 */},
>>>> +  {"Undefined",           XE_TILE_HW_ERR_UNKNOWN_NONFATAL},
>>>> +  {"Undefined",           XE_TILE_HW_ERR_UNKNOWN_NONFATAL},
>>>> +  {"SGUNIT",              XE_TILE_HW_ERR_SGUNIT_NONFATAL          /* =
Bit Pos 12 */},
>>>> +  {"SGCI Data Parity",    XE_TILE_HW_ERR_SGCI_NONFATAL            /* =
Bit Pos 13 */},
>>>> +  {"Undefined",           XE_TILE_HW_ERR_UNKNOWN_NONFATAL},
>>>> +  {"Undefined",           XE_TILE_HW_ERR_UNKNOWN_NONFATAL},
>>>> +  {"SOC",                 XE_TILE_HW_ERR_SOC_NONFATAL             /* =
Bit Pos 16 */},
>>>> +  {"Undefined",           XE_TILE_HW_ERR_UNKNOWN_NONFATAL         /* =
Bit Pos 17 */},
>>>> +  {"Undefined",           XE_TILE_HW_ERR_UNKNOWN_NONFATAL},
>>>> +  {"Undefined",           XE_TILE_HW_ERR_UNKNOWN_NONFATAL},
>>>> +  {"MERT Data Parity",    XE_TILE_HW_ERR_MERT_NONFATAL            /* =
Bit Pos 20 */},
>>>> +};
>>>> +
>>>> +struct error_msg_counter_pair dev_err_stat_correctable_reg[] =3D {
>>>> +  {"GT",                  XE_TILE_HW_ERR_GT_CORR                  /* =
Bit Pos 0 */},
>>>> +  {"Undefined",           XE_TILE_HW_ERR_UNKNOWN_CORR},
>>>> +  {"Undefined",           XE_TILE_HW_ERR_UNKNOWN_CORR},
>>>> +  {"Undefined",           XE_TILE_HW_ERR_UNKNOWN_CORR},
>>>> +  {"DISPLAY",             XE_TILE_HW_ERR_DISPLAY_CORR             /* =
Bit Pos 4 */},
>>>> +  {"Undefined",           XE_TILE_HW_ERR_UNKNOWN_CORR},
>>>> +  {"Undefined",           XE_TILE_HW_ERR_UNKNOWN_CORR},
>>>> +  {"Undefined",           XE_TILE_HW_ERR_UNKNOWN_CORR},
>>>> +  {"GSC",                 XE_TILE_HW_ERR_GSC_CORR                 /* =
Bit Pos 8 */},
>>>> +  {"Undefined",           XE_TILE_HW_ERR_UNKNOWN_CORR},
>>>> +  {"Undefined",           XE_TILE_HW_ERR_UNKNOWN_CORR},
>>>> +  {"Undefined",           XE_TILE_HW_ERR_UNKNOWN_CORR},
>>>> +  {"SGUNIT",              XE_TILE_HW_ERR_SGUNIT_CORR              /* =
Bit Pos 12 */},
>>>> +  {"Undefined",           XE_TILE_HW_ERR_UNKNOWN_CORR},
>>>> +  {"Undefined",           XE_TILE_HW_ERR_UNKNOWN_CORR},
>>>> +  {"Undefined",           XE_TILE_HW_ERR_UNKNOWN_CORR},
>>>> +  {"SOC",                 XE_TILE_HW_ERR_SOC_CORR                 /* =
Bit Pos 16 */},
>>>> +  {"Undefined",           XE_TILE_HW_ERR_UNKNOWN_CORR},
>>>> +  {"Undefined",           XE_TILE_HW_ERR_UNKNOWN_CORR},
>>>> +  {"Undefined",           XE_TILE_HW_ERR_UNKNOWN_CORR},
>>>> +  {"Undefined",           XE_TILE_HW_ERR_UNKNOWN_CORR},
>>>> +};
>>>> +
>>>> +static void update_valid_error_regs(struct xe_device *xe)
>>>> +{
>>>> +  unsigned long mask =3D 0;
>>>> +
>>>> +  u32 i;
>>>> +
>>>> +  if (xe->info.platform =3D=3D XE_DG2) {
>>>> +          mask =3D ~(0 | DG2_DEV_ERR_STAT_FATAL_MASK);
>>>> +          for_each_set_bit(i, &mask, DEV_ERR_STAT_MAX_ERROR_BIT)
>>>> +                  dev_err_stat_fatal_reg[i] =3D (struct error_msg_cou=
nter_pair)
>>>> +                  {.errmsg =3D "Undefined", .errcounter =3D XE_TILE_H=
W_ERR_UNKNOWN_FATAL};
>>> Nope. For one thing, the arrays really should be static const, placed i=
n
>>> rodata, and not mutable.
>> My Idea of keeping it mutable is to avoid multiple platform specific
>> arrays.
>>> For another, if you have a platform with two or more different devices,
>>> whichever gets probed last clobbers the data.
>>
>> Thanks for pointing it out. I had missed this particular scenario.  I
>> believe defining platform specific array is better
>>
>> because then we can ensure them to be immutable and we will not be
>> required to have platform specific mask also.
>>
>> I believe this will help with maintainability too.
>>
>> BR
>>
>> Himal Ghimiray
>>
>>>> +
>>>> +          mask =3D ~(0 | DG2_DEV_ERR_STAT_NONFATAL_MASK);
>>>> +          for_each_set_bit(i, &mask, DEV_ERR_STAT_MAX_ERROR_BIT)
>>>> +                  dev_err_stat_nonfatal_reg[i] =3D (struct error_msg_=
counter_pair)
>>>> +                  {.errmsg =3D "Undefined", .errcounter =3D XE_TILE_H=
W_ERR_UNKNOWN_NONFATAL};
>>>> +
>>>> +          mask =3D ~(0 | DG2_DEV_ERR_STAT_CORRECTABLE_MASK);
>>>> +          for_each_set_bit(i, &mask, DEV_ERR_STAT_MAX_ERROR_BIT)
>>>> +                  dev_err_stat_correctable_reg[i] =3D (struct error_m=
sg_counter_pair)
>>>> +                  {.errmsg =3D "Undefined", .errcounter =3D XE_TILE_H=
W_ERR_UNKNOWN_CORR};
>>>> +  } else if (xe->info.platform =3D=3D XE_PVC) {
>>>> +          mask =3D ~(0 | PVC_DEV_ERR_STAT_FATAL_MASK);
>>>> +          for_each_set_bit(i, &mask, DEV_ERR_STAT_MAX_ERROR_BIT)
>>>> +                  dev_err_stat_fatal_reg[i] =3D (struct error_msg_cou=
nter_pair)
>>>> +                  {.errmsg =3D "Undefined", .errcounter =3D XE_TILE_H=
W_ERR_UNKNOWN_FATAL};
>>>> +
>>>> +          mask =3D ~(0 | PVC_DEV_ERR_STAT_NONFATAL_MASK);
>>>> +          for_each_set_bit(i, &mask, DEV_ERR_STAT_MAX_ERROR_BIT)
>>>> +                  dev_err_stat_nonfatal_reg[i] =3D (struct error_msg_=
counter_pair)
>>>> +                  {.errmsg =3D "Undefined", .errcounter =3D XE_TILE_H=
W_ERR_UNKNOWN_NONFATAL};
>>>> +
>>>> +          mask =3D ~(0 | PVC_DEV_ERR_STAT_CORRECTABLE_MASK);
>>>> +          for_each_set_bit(i, &mask, DEV_ERR_STAT_MAX_ERROR_BIT)
>>>> +                  dev_err_stat_correctable_reg[i] =3D (struct error_m=
sg_counter_pair)
>>>> +                  {.errmsg =3D "Undefined", .errcounter =3D XE_TILE_H=
W_ERR_UNKNOWN_CORR};
>>>> +  }
>>>> +}
>>>> +
>>>> +static void
>>>> +xe_hw_error_source_handler(struct xe_tile *tile, const enum hardware_=
error hw_err)
>>>> +{
>>>> +  const char *hw_err_str =3D hardware_error_type_to_str(hw_err);
>>>> +  struct error_msg_counter_pair *errstat;
>>>> +  unsigned long errsrc;
>>>> +  unsigned long flags;
>>>> +  const char *errmsg;
>>>> +  struct xe_gt *mmio;
>>>> +  u32 counter;
>>>> +  u32 errcntr;
>>>> +  u32 errbit;
>>>> +
>>>> +  switch (hw_err) {
>>>> +  case HARDWARE_ERROR_FATAL:
>>>> +          errstat =3D (struct error_msg_counter_pair *)dev_err_stat_f=
atal_reg;
>>> Why the casts?
>>>
>>>> +          counter =3D XE_TILE_HW_ERR_UNKNOWN_FATAL;
>>>> +          break;
>>>> +  case HARDWARE_ERROR_NONFATAL:
>>>> +          errstat =3D (struct error_msg_counter_pair *)dev_err_stat_n=
onfatal_reg;
>>>> +          counter =3D XE_TILE_HW_ERR_UNKNOWN_NONFATAL;
>>>> +          break;
>>>> +  case HARDWARE_ERROR_CORRECTABLE:
>>>> +          errstat =3D (struct error_msg_counter_pair *)dev_err_stat_c=
orrectable_reg;
>>>> +          counter =3D XE_TILE_HW_ERR_UNKNOWN_CORR;
>>>> +          break;
>>>> +  default:
>>>> +          return;
>>>> +  }
>>>> +
>>>> +  spin_lock_irqsave(&tile_to_xe(tile)->irq.lock, flags);
>>>> +  mmio =3D tile->primary_gt;
>>>> +  errsrc =3D xe_mmio_read32(mmio, DEV_ERR_STAT_REG(hw_err));
>>>> +
>>>> +  if (!errsrc) {
>>>> +          xe_tile_log_hw_err(tile, "DEV_ERR_STAT_REG_%s blank!\n", hw=
_err_str);
>>>> +          goto unlock;
>>>> +  }
>>>> +
>>>> +  for_each_set_bit(errbit, &errsrc, REG_SIZE) {
>>>> +          if (errbit < DEV_ERR_STAT_MAX_ERROR_BIT) {
>>>> +                  errmsg =3D errstat[errbit].errmsg;
>>>> +                  errcntr =3D errstat[errbit].errcounter;
>>>> +          } else {
>>>> +                  errmsg =3D "Undefined";
>>>> +                  errcntr =3D counter;
>>>> +          }
>>>> +
>>>> +          if (hw_err =3D=3D HARDWARE_ERROR_CORRECTABLE)
>>>> +                  xe_tile_log_hw_warn(tile, "%s %s error bit[%d] is s=
et\n",
>>>> +                                      errmsg, hw_err_str, errbit);
>>>> +          else
>>>> +                  xe_tile_log_hw_err(tile, "%s %s error bit[%d] is se=
t\n",
>>>> +                                     errmsg, hw_err_str, errbit);
>>>> +
>>>> +          tile->errors.hw[errcntr]++;
>>>> +  }
>>>> +
>>>> +  xe_mmio_write32(mmio, DEV_ERR_STAT_REG(hw_err), errsrc);
>>>> +unlock:
>>>> +  spin_unlock_irqrestore(&tile_to_xe(tile)->irq.lock, flags);
>>>> +}
>>>> +
>>>> +/*
>>>> + * XE Platforms adds three Error bits to the Master Interrupt
>>>> + * Register to support error handling. These three bits are
>>>> + * used to convey the class of error:
>>>> + * FATAL, NONFATAL, or CORRECTABLE.
>>>> + *
>>>> + * To process an interrupt:
>>>> + *       Determine source of error (IP block) by reading
>>>> + *         the Device Error Source Register (RW1C) that
>>>> + *         corresponds to the class of error being serviced
>>>> + *         and log the error.
>>>> + */
>>>> +static void
>>>> +xe_hw_error_irq_handler(struct xe_tile *tile, const u32 master_ctl)
>>>> +{
>>>> +  enum hardware_error hw_err;
>>>> +
>>>> +  for (hw_err =3D 0; hw_err < HARDWARE_ERROR_MAX; hw_err++) {
>>>> +          if (master_ctl & XE_ERROR_IRQ(hw_err))
>>>> +                  xe_hw_error_source_handler(tile, hw_err);
>>>> +  }
>>>> +}
>>>> +
>>>>   /*
>>>>    * Top-level interrupt handler for Xe_LP+ and beyond.  These platfor=
ms have
>>>>    * a "master tile" interrupt register which must be consulted before=
 the
>>>> @@ -413,6 +630,7 @@ static irqreturn_t dg1_irq_handler(int irq, void *=
arg)
>>>>             xe_mmio_write32(mmio, GFX_MSTR_IRQ, master_ctl);
>>>>
>>>>             gt_irq_handler(tile, master_ctl, intr_dw, identity);
>>>> +          xe_hw_error_irq_handler(tile, master_ctl);
>>>>
>>>>             /*
>>>>              * Display interrupts (including display backlight operati=
ons
>>>> @@ -561,6 +779,8 @@ int xe_irq_install(struct xe_device *xe)
>>>>             return -EINVAL;
>>>>     }
>>>>
>>>> +  update_valid_error_regs(xe);
>>>> +
>>>>     xe->irq.enabled =3D true;
>>>>
>>>>     xe_irq_reset(xe);

--
Jani Nikula, Intel Open Source Graphics Center


--_000_MW4PR11MB7056CDA2898D6F47ADFA57D0B313AMW4PR11MB7056namp_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
</head>
<body>
<div dir=3D"auto">Hi Nikula,</div>
<div dir=3D"auto"><br>
</div>
<div dir=3D"auto">I had missed adding mailing list to reply done to you.&nb=
sp;</div>
<div dir=3D"auto"><br>
</div>
<div dir=3D"auto">Below mail is&nbsp; cc addition to ma<span>iling list wit=
hout change in content sent to you as reply.&nbsp;</span></div>
<div dir=3D"auto"><span><br>
</span></div>
<div dir=3D"auto"><span>BR</span></div>
<div dir=3D"auto"><span>Himal&nbsp;</span></div>
<div id=3D"mail-editor-reference-message-container" dir=3D"auto"><br>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" style=3D"font-size: 11pt;"><strong>From:</strong>=
 Nikula, Jani &lt;jani.nikula@intel.com&gt;<br>
<strong>Sent:</strong> Thursday, August 10, 2023 3:47:49 pm<br>
<strong>To:</strong> Ghimiray, Himal Prasad &lt;himal.prasad.ghimiray@intel=
.com&gt;; intel-xe@lists.freedesktop.org &lt;intel-xe@lists.freedesktop.org=
&gt;<br>
<strong>Subject:</strong> Re: [PATCH v2 1/4] drm/xe: Handle errors from var=
ious components.<br>
</div>
<br>
<meta name=3D"Generator" content=3D"Microsoft Exchange Server">
<!-- converted from text --><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText"><br>
Is there any new content here? This is what it looks like to me:<br>
<br>
<a href=3D"https://lore.kernel.org/r/78b0e2d2-3c4c-484f-bcd4-fa896adef534@i=
ntel.com">https://lore.kernel.org/r/78b0e2d2-3c4c-484f-bcd4-fa896adef534@in=
tel.com</a><br>
<br>
BR,<br>
Jani<br>
<br>
On Thu, 10 Aug 2023, &quot;Ghimiray, Himal Prasad&quot; &lt;himal.prasad.gh=
imiray@intel.com&gt; wrote:<br>
&gt; On 10-08-2023 15:01, Ghimiray, Himal Prasad wrote:<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; On 10-08-2023 13:24, Jani Nikula wrote:<br>
&gt;&gt;&gt; On Thu, 10 Aug 2023, Himal Prasad Ghimiray&lt;himal.prasad.ghi=
miray@intel.com&gt;&nbsp; wrote:<br>
&gt;&gt;&gt;&gt; The GFX device can generate numbers of classes of error un=
der the new<br>
&gt;&gt;&gt;&gt; infrastructure: correctable, non-fatal, and fatal errors.<=
br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; The non-fatal and fatal error classes distinguish between =
levels of<br>
&gt;&gt;&gt;&gt; severity for uncorrectable errors. Driver will only handle=
 logging<br>
&gt;&gt;&gt;&gt; of errors and updating counters from various components wi=
thin the<br>
&gt;&gt;&gt;&gt; graphics device. Anything more will be handled at system l=
evel.<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; For errors that will route as interrupts, three bits in th=
e Master<br>
&gt;&gt;&gt;&gt; Interrupt Register will be used to convey the class of err=
or.<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; For each class of error: Determine source of error (IP blo=
ck) by reading<br>
&gt;&gt;&gt;&gt; the Device Error Source Register (RW1C) that<br>
&gt;&gt;&gt;&gt; corresponds to the class of error being serviced.<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; Bspec: 50875, 53073, 53074, 53075<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; Cc: Rodrigo Vivi&lt;rodrigo.vivi@intel.com&gt;<br>
&gt;&gt;&gt;&gt; Cc: Aravind Iddamsetty&lt;aravind.iddamsetty@intel.com&gt;=
<br>
&gt;&gt;&gt;&gt; Cc: Matthew Brost&lt;matthew.brost@intel.com&gt;<br>
&gt;&gt;&gt;&gt; Cc: Matt Roper&lt;matthew.d.roper@intel.com&gt;<br>
&gt;&gt;&gt;&gt; Cc: Joonas Lahtinen&lt;joonas.lahtinen@linux.intel.com&gt;=
<br>
&gt;&gt;&gt;&gt; Cc: Jani Nikula&lt;jani.nikula@intel.com&gt;<br>
&gt;&gt;&gt;&gt; Signed-off-by: Himal Prasad Ghimiray&lt;himal.prasad.ghimi=
ray@intel.com&gt;<br>
&gt;&gt;&gt;&gt; ---<br>
&gt;&gt;&gt;&gt;&nbsp;&nbsp; drivers/gpu/drm/xe/regs/xe_regs.h&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp; 7 +<br>
&gt;&gt;&gt;&gt;&nbsp;&nbsp; drivers/gpu/drm/xe/regs/xe_tile_error_regs.h |=
 108 +++++++++<br>
&gt;&gt;&gt;&gt;&nbsp;&nbsp; drivers/gpu/drm/xe/xe_device_types.h&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp; 6 +<br>
&gt;&gt;&gt;&gt;&nbsp;&nbsp; drivers/gpu/drm/xe/xe_irq.c&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp; | 220 +++++++++++++++++++<br>
&gt;&gt;&gt;&gt;&nbsp;&nbsp; 4 files changed, 341 insertions(+)<br>
&gt;&gt;&gt;&gt;&nbsp;&nbsp; create mode 100644 drivers/gpu/drm/xe/regs/xe_=
tile_error_regs.h<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; diff --git a/drivers/gpu/drm/xe/regs/xe_regs.h b/drivers/g=
pu/drm/xe/regs/xe_regs.h<br>
&gt;&gt;&gt;&gt; index ec45b1ba9db1..9901e55fc89c 100644<br>
&gt;&gt;&gt;&gt; --- a/drivers/gpu/drm/xe/regs/xe_regs.h<br>
&gt;&gt;&gt;&gt; +++ b/drivers/gpu/drm/xe/regs/xe_regs.h<br>
&gt;&gt;&gt;&gt; @@ -87,7 +87,14 @@<br>
&gt;&gt;&gt;&gt;&nbsp;&nbsp; #define&nbsp;&nbsp; GU_MISC_IRQ&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; RE=
G_BIT(29)<br>
&gt;&gt;&gt;&gt;&nbsp;&nbsp; #define&nbsp;&nbsp; DISPLAY_IRQ&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; RE=
G_BIT(16)<br>
&gt;&gt;&gt;&gt;&nbsp;&nbsp; #define&nbsp;&nbsp; GT_DW_IRQ(x)&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; REG_BIT=
(x)<br>
&gt;&gt;&gt;&gt; +#define&nbsp;&nbsp; XE_ERROR_IRQ(x)&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
REG_BIT(26 + (x))<br>
&gt;&gt;&gt;&gt;&nbsp;&nbsp; <br>
&gt;&gt;&gt;&gt;&nbsp;&nbsp; #define PVC_RP_STATE_CAP&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
XE_REG(0x281014)<br>
&gt;&gt;&gt;&gt;&nbsp;&nbsp; <br>
&gt;&gt;&gt;&gt; +enum hardware_error {<br>
&gt;&gt;&gt;&gt; +&nbsp; HARDWARE_ERROR_CORRECTABLE =3D 0,<br>
&gt;&gt;&gt;&gt; +&nbsp; HARDWARE_ERROR_NONFATAL =3D 1,<br>
&gt;&gt;&gt;&gt; +&nbsp; HARDWARE_ERROR_FATAL =3D 2,<br>
&gt;&gt;&gt;&gt; +&nbsp; HARDWARE_ERROR_MAX,<br>
&gt;&gt;&gt;&gt; +};<br>
&gt;&gt;&gt; This file is about registers. IMO enums belong somewhere else.=
 Define<br>
&gt;&gt;&gt; hardware registers using macros.<br>
&gt;&gt;<br>
&gt;&gt; Hmm. Will look for better placeholder for this enum.<br>
&gt;&gt;<br>
&gt;&gt;&gt;&gt;&nbsp;&nbsp; #endif<br>
&gt;&gt;&gt;&gt; diff --git a/drivers/gpu/drm/xe/regs/xe_tile_error_regs.h =
b/drivers/gpu/drm/xe/regs/xe_tile_error_regs.h<br>
&gt;&gt;&gt;&gt; new file mode 100644<br>
&gt;&gt;&gt;&gt; index 000000000000..fbb794b2f183<br>
&gt;&gt;&gt;&gt; --- /dev/null<br>
&gt;&gt;&gt;&gt; +++ b/drivers/gpu/drm/xe/regs/xe_tile_error_regs.h<br>
&gt;&gt;&gt;&gt; @@ -0,0 +1,108 @@<br>
&gt;&gt;&gt;&gt; +/* SPDX-License-Identifier: MIT */<br>
&gt;&gt;&gt;&gt; +/*<br>
&gt;&gt;&gt;&gt; + * Copyright =A9 2023 Intel Corporation<br>
&gt;&gt;&gt;&gt; + */<br>
&gt;&gt;&gt;&gt; +#ifndef XE_TILE_ERROR_REGS_H_<br>
&gt;&gt;&gt;&gt; +#define XE_TILE_ERROR_REGS_H_<br>
&gt;&gt;&gt;&gt; +<br>
&gt;&gt;&gt;&gt; +#include &lt;linux/stddef.h&gt;<br>
&gt;&gt;&gt;&gt; +<br>
&gt;&gt;&gt;&gt; +#define _DEV_ERR_STAT_NONFATAL&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0x100178<br>
&gt;&gt;&gt;&gt; +#define _DEV_ERR_STAT_CORRECTABLE&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; 0x10017c<br>
&gt;&gt;&gt;&gt; +#define DEV_ERR_STAT_REG(x)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; XE_REG(_PICK_EVEN=
((x), \<br>
&gt;&gt;&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; _DEV_ERR_STAT_=
CORRECTABLE, \<br>
&gt;&gt;&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; _DEV_ERR_STAT_=
NONFATAL))<br>
&gt;&gt;&gt;&gt; +<br>
&gt;&gt;&gt;&gt; +#define&nbsp; DEV_ERR_STAT_MAX_ERROR_BIT&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (21)<br>
&gt;&gt;&gt;&gt; +<br>
&gt;&gt;&gt;&gt; +/* Count of&nbsp; Correctable and Uncorrectable errors re=
ported on tile */<br>
&gt;&gt;&gt;&gt; +enum xe_tile_hw_errors {g<br>
&gt;&gt;&gt;&gt; +&nbsp; XE_TILE_HW_ERR_GT_FATAL =3D 0,<br>
&gt;&gt;&gt;&gt; +&nbsp; XE_TILE_HW_ERR_SGGI_FATAL,<br>
&gt;&gt;&gt;&gt; +&nbsp; XE_TILE_HW_ERR_DISPLAY_FATAL,<br>
&gt;&gt;&gt;&gt; +&nbsp; XE_TILE_HW_ERR_SGDI_FATAL,<br>
&gt;&gt;&gt;&gt; +&nbsp; XE_TILE_HW_ERR_SGLI_FATAL,<br>
&gt;&gt;&gt;&gt; +&nbsp; XE_TILE_HW_ERR_SGUNIT_FATAL,<br>
&gt;&gt;&gt;&gt; +&nbsp; XE_TILE_HW_ERR_SGCI_FATAL,<br>
&gt;&gt;&gt;&gt; +&nbsp; XE_TILE_HW_ERR_GSC_FATAL,<br>
&gt;&gt;&gt;&gt; +&nbsp; XE_TILE_HW_ERR_SOC_FATAL,<br>
&gt;&gt;&gt;&gt; +&nbsp; XE_TILE_HW_ERR_MERT_FATAL,<br>
&gt;&gt;&gt;&gt; +&nbsp; XE_TILE_HW_ERR_SGMI_FATAL,<br>
&gt;&gt;&gt;&gt; +&nbsp; XE_TILE_HW_ERR_UNKNOWN_FATAL,<br>
&gt;&gt;&gt;&gt; +&nbsp; XE_TILE_HW_ERR_SGGI_NONFATAL,<br>
&gt;&gt;&gt;&gt; +&nbsp; XE_TILE_HW_ERR_DISPLAY_NONFATAL,<br>
&gt;&gt;&gt;&gt; +&nbsp; XE_TILE_HW_ERR_SGDI_NONFATAL,<br>
&gt;&gt;&gt;&gt; +&nbsp; XE_TILE_HW_ERR_SGLI_NONFATAL,<br>
&gt;&gt;&gt;&gt; +&nbsp; XE_TILE_HW_ERR_GT_NONFATAL,<br>
&gt;&gt;&gt;&gt; +&nbsp; XE_TILE_HW_ERR_SGUNIT_NONFATAL,<br>
&gt;&gt;&gt;&gt; +&nbsp; XE_TILE_HW_ERR_SGCI_NONFATAL,<br>
&gt;&gt;&gt;&gt; +&nbsp; XE_TILE_HW_ERR_GSC_NONFATAL,<br>
&gt;&gt;&gt;&gt; +&nbsp; XE_TILE_HW_ERR_SOC_NONFATAL,<br>
&gt;&gt;&gt;&gt; +&nbsp; XE_TILE_HW_ERR_MERT_NONFATAL,<br>
&gt;&gt;&gt;&gt; +&nbsp; XE_TILE_HW_ERR_SGMI_NONFATAL,<br>
&gt;&gt;&gt;&gt; +&nbsp; XE_TILE_HW_ERR_UNKNOWN_NONFATAL,<br>
&gt;&gt;&gt;&gt; +&nbsp; XE_TILE_HW_ERR_GT_CORR,<br>
&gt;&gt;&gt;&gt; +&nbsp; XE_TILE_HW_ERR_DISPLAY_CORR,<br>
&gt;&gt;&gt;&gt; +&nbsp; XE_TILE_HW_ERR_SGUNIT_CORR,<br>
&gt;&gt;&gt;&gt; +&nbsp; XE_TILE_HW_ERR_GSC_CORR,<br>
&gt;&gt;&gt;&gt; +&nbsp; XE_TILE_HW_ERR_SOC_CORR,<br>
&gt;&gt;&gt;&gt; +&nbsp; XE_TILE_HW_ERR_UNKNOWN_CORR,<br>
&gt;&gt;&gt;&gt; +};<br>
&gt;&gt;&gt; Ditto about enums and regs.<br>
&gt;&gt; Will address.<br>
&gt;&gt;&gt;&gt; +<br>
&gt;&gt;&gt;&gt; +#define XE_TILE_HW_ERROR_MAX (XE_TILE_HW_ERR_UNKNOWN_CORR=
 + 1)<br>
&gt;&gt;&gt; If it's an enum, adding that last in the enum does the trick.<=
br>
&gt;&gt; Makes sense.<br>
&gt;&gt;&gt;&gt; +<br>
&gt;&gt;&gt;&gt; +#define PVC_DEV_ERR_STAT_FATAL_MASK \<br>
&gt;&gt;&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (R=
EG_BIT(0) | \<br>
&gt;&gt;&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; REG_BIT(1) | \<br>
&gt;&gt;&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; REG_BIT(8) | \<br>
&gt;&gt;&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; REG_BIT(9) | \<br>
&gt;&gt;&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; REG_BIT(13) | \<br>
&gt;&gt;&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; REG_BIT(16) | \<br>
&gt;&gt;&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; REG_BIT(20))<br>
&gt;&gt;&gt;&gt; +<br>
&gt;&gt;&gt;&gt; +#define PVC_DEV_ERR_STAT_NONFATAL_MASK \<br>
&gt;&gt;&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (R=
EG_BIT(0) | \<br>
&gt;&gt;&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; REG_BIT(1) | \<br>
&gt;&gt;&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; REG_BIT(8) | \<br>
&gt;&gt;&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; REG_BIT(9) | \<br>
&gt;&gt;&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; REG_BIT(13) | \<br>
&gt;&gt;&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; REG_BIT(16) | \<br>
&gt;&gt;&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; REG_BIT(20))<br>
&gt;&gt;&gt;&gt; +<br>
&gt;&gt;&gt;&gt; +#define PVC_DEV_ERR_STAT_CORRECTABLE_MASK \<br>
&gt;&gt;&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (R=
EG_BIT(0) | \<br>
&gt;&gt;&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; REG_BIT(8))<br>
&gt;&gt;&gt;&gt; +<br>
&gt;&gt;&gt;&gt; +#define DG2_DEV_ERR_STAT_FATAL_MASK \<br>
&gt;&gt;&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (R=
EG_BIT(0) | \<br>
&gt;&gt;&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; REG_BIT(4) | \<br>
&gt;&gt;&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; REG_BIT(8) | \<br>
&gt;&gt;&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; REG_BIT(12) | \<br>
&gt;&gt;&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; REG_BIT(16))<br>
&gt;&gt;&gt;&gt; +<br>
&gt;&gt;&gt;&gt; +#define DG2_DEV_ERR_STAT_NONFATAL_MASK \<br>
&gt;&gt;&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (R=
EG_BIT(0) | \<br>
&gt;&gt;&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; REG_BIT(4) | \<br>
&gt;&gt;&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; REG_BIT(8) | \<br>
&gt;&gt;&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; REG_BIT(12) | \<br>
&gt;&gt;&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; REG_BIT(16) | \<br>
&gt;&gt;&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; REG_BIT(20))<br>
&gt;&gt;&gt;&gt; +<br>
&gt;&gt;&gt;&gt; +#define DG2_DEV_ERR_STAT_CORRECTABLE_MASK \<br>
&gt;&gt;&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (R=
EG_BIT(0) | \<br>
&gt;&gt;&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; REG_BIT(4) | \<br>
&gt;&gt;&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; REG_BIT(8) | \<br>
&gt;&gt;&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; REG_BIT(12) | \<br>
&gt;&gt;&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; REG_BIT(16))<br>
&gt;&gt;&gt; Are the above supposed to match what's in xe_tile_hw_errors? S=
eems<br>
&gt;&gt;&gt; rather unmaintainable.<br>
&gt;&gt; xe_tile_hw_errors contains superset of applicable platforms and ma=
sk determines<br>
&gt;&gt; what are applicable bits for a platform.<br>
&gt;&gt;&gt;&gt; +<br>
&gt;&gt;&gt;&gt; +#define REG_SIZE 32<br>
&gt;&gt;&gt;&gt; +<br>
&gt;&gt;&gt;&gt; +#define xe_tile_log_hw_err(tile, fmt, ...) \<br>
&gt;&gt;&gt;&gt; +&nbsp; drm_err_ratelimited(&amp;tile_to_xe(tile)-&gt;drm,=
 HW_ERR &quot;TILE%d detected &quot; fmt, \<br>
&gt;&gt;&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; tile-=
&gt;id, ##__VA_ARGS__)<br>
&gt;&gt;&gt;&gt; +<br>
&gt;&gt;&gt;&gt; +#define xe_tile_log_hw_warn(tile, fmt, ...) \<br>
&gt;&gt;&gt;&gt; +&nbsp; drm_warn(&amp;tile_to_xe(tile)-&gt;drm, HW_ERR &qu=
ot;TILE%d detected &quot; fmt, \<br>
&gt;&gt;&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; tile-&gt;id, ##__VA_ARGS__)<br>
&gt;&gt;&gt; Do we really want to keep adding new macros for all possible s=
cenarios<br>
&gt;&gt;&gt; in the driver? This is getting out of hand.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Where's HW_ERR defined?<br>
&gt;&gt; include/linux/printk.h defines HW_ERR.<br>
&gt;&gt;&gt;&gt; +<br>
&gt;&gt;&gt;&gt; +#endif<br>
&gt;&gt;&gt;&gt; diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/driver=
s/gpu/drm/xe/xe_device_types.h<br>
&gt;&gt;&gt;&gt; index f84ecb976f5d..1335ba74981a 100644<br>
&gt;&gt;&gt;&gt; --- a/drivers/gpu/drm/xe/xe_device_types.h<br>
&gt;&gt;&gt;&gt; +++ b/drivers/gpu/drm/xe/xe_device_types.h<br>
&gt;&gt;&gt;&gt; @@ -16,6 +16,7 @@<br>
&gt;&gt;&gt;&gt;&nbsp;&nbsp; #include &quot;xe_gt_types.h&quot;<br>
&gt;&gt;&gt;&gt;&nbsp;&nbsp; #include &quot;xe_platform_types.h&quot;<br>
&gt;&gt;&gt;&gt;&nbsp;&nbsp; #include &quot;xe_step_types.h&quot;<br>
&gt;&gt;&gt;&gt; +#include &quot;regs/xe_tile_error_regs.h&quot;<br>
&gt;&gt;&gt;&gt;&nbsp;&nbsp; <br>
&gt;&gt;&gt;&gt;&nbsp;&nbsp; #if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)<br>
&gt;&gt;&gt;&gt;&nbsp;&nbsp; #include &quot;ext/intel_device_info.h&quot;<b=
r>
&gt;&gt;&gt;&gt; @@ -166,6 +167,11 @@ struct xe_tile {<br>
&gt;&gt;&gt;&gt;&nbsp;&nbsp; <br>
&gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp; /** @sysfs: sysfs' kobj used by xe=
_tile_sysfs */<br>
&gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp; struct kobject *sysfs;<br>
&gt;&gt;&gt;&gt; +<br>
&gt;&gt;&gt;&gt; +&nbsp; /** @tile_hw_errors: hardware errors reported for =
the tile */<br>
&gt;&gt;&gt;&gt; +&nbsp; struct tile_hw_errors {<br>
&gt;&gt;&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; un=
signed long hw[XE_TILE_HW_ERROR_MAX];<br>
&gt;&gt;&gt; Even with the documentation comment, I have to look up the sou=
rce code<br>
&gt;&gt;&gt; to realize this is the *number* of errors for each class.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Maybe &quot;count&quot; is more informative than &quot;hw&quot=
;.<br>
&gt;&gt; Ok.<br>
&gt;&gt;&gt;&gt; +&nbsp; } errors;<br>
&gt;&gt;&gt;&gt;&nbsp;&nbsp; };<br>
&gt;&gt;&gt;&gt;&nbsp;&nbsp; <br>
&gt;&gt;&gt;&gt;&nbsp;&nbsp; /**<br>
&gt;&gt;&gt;&gt; diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm=
/xe/xe_irq.c<br>
&gt;&gt;&gt;&gt; index 2022a5643e01..04a665faea23 100644<br>
&gt;&gt;&gt;&gt; --- a/drivers/gpu/drm/xe/xe_irq.c<br>
&gt;&gt;&gt;&gt; +++ b/drivers/gpu/drm/xe/xe_irq.c<br>
&gt;&gt;&gt;&gt; @@ -362,6 +362,223 @@ static void dg1_intr_enable(struct x=
e_device *xe, bool stall)<br>
&gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp; xe_mmio_read32(mmio, DG1_MSTR_TILE_INTR);<br>
&gt;&gt;&gt;&gt;&nbsp;&nbsp; }<br>
&gt;&gt;&gt;&gt;&nbsp;&nbsp; <br>
&gt;&gt;&gt;&gt; +static const char *<br>
&gt;&gt;&gt;&gt; +hardware_error_type_to_str(const enum hardware_error hw_e=
rr)<br>
&gt;&gt;&gt;&gt; +{<br>
&gt;&gt;&gt;&gt; +&nbsp; switch (hw_err) {<br>
&gt;&gt;&gt;&gt; +&nbsp; case HARDWARE_ERROR_CORRECTABLE:<br>
&gt;&gt;&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; re=
turn &quot;CORRECTABLE&quot;;<br>
&gt;&gt;&gt;&gt; +&nbsp; case HARDWARE_ERROR_NONFATAL:<br>
&gt;&gt;&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; re=
turn &quot;NONFATAL&quot;;<br>
&gt;&gt;&gt;&gt; +&nbsp; case HARDWARE_ERROR_FATAL:<br>
&gt;&gt;&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; re=
turn &quot;FATAL&quot;;<br>
&gt;&gt;&gt;&gt; +&nbsp; default:<br>
&gt;&gt;&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; re=
turn &quot;UNKNOWN&quot;;<br>
&gt;&gt;&gt;&gt; +&nbsp; }<br>
&gt;&gt;&gt;&gt; +}<br>
&gt;&gt;&gt;&gt; +<br>
&gt;&gt;&gt;&gt; +struct error_msg_counter_pair {<br>
&gt;&gt;&gt;&gt; +&nbsp; const char *errmsg;<br>
&gt;&gt;&gt;&gt; +&nbsp; int errcounter;<br>
&gt;&gt;&gt; Counter? Or type/class/whatever?<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; +};<br>
&gt;&gt;&gt;&gt; +<br>
&gt;&gt;&gt;&gt; +struct error_msg_counter_pair dev_err_stat_fatal_reg[] =
=3D {<br>
&gt;&gt;&gt;&gt; +&nbsp; {&quot;GT&quot;,&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; XE_TIL=
E_HW_ERR_GT_FATAL&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Bit Pos 0 */},<br>
&gt;&gt;&gt; Does this again tie the enums and the bit positions together, =
similar to<br>
&gt;&gt;&gt; how the mask macros also do above?<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; There needs to be a single point of truth for all of this.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; I think this needs a redesign.<br>
&gt;&gt;<br>
&gt;&gt; As commented above this is array which defines all valid bit posit=
ions <br>
&gt;&gt; irrespective of platform. Mask was<br>
&gt;&gt;<br>
&gt;&gt; to determine platform specific applicability.<br>
&gt;&gt;<br>
&gt;&gt;&gt; BR,<br>
&gt;&gt;&gt; Jani.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; +&nbsp; {&quot;SGGI Cmd Parity&quot;,&nbsp;&nbsp;&nbsp;&nb=
sp; XE_TILE_HW_ERR_SGGI_FATAL&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Bit Pos 1 */},<br>
&gt;&gt;&gt;&gt; +&nbsp; {&quot;Undefined&quot;,&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; XE_TILE_HW_ERR_UNKNOWN_FATAL},<br>
&gt;&gt;&gt;&gt; +&nbsp; {&quot;Undefined&quot;,&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; XE_TILE_HW_ERR_UNKNOWN_FATAL},<br>
&gt;&gt;&gt;&gt; +&nbsp; {&quot;DISPLAY&quot;,&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; XE_TILE_HW_ERR_DISPLAY_FATAL&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Bit Pos =
4 */},<br>
&gt;&gt;&gt;&gt; +&nbsp; {&quot;Undefined&quot;,&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; XE_TILE_HW_ERR_UNKNOWN_FATAL},<br>
&gt;&gt;&gt;&gt; +&nbsp; {&quot;Undefined&quot;,&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; XE_TILE_HW_ERR_UNKNOWN_FATAL},<br>
&gt;&gt;&gt;&gt; +&nbsp; {&quot;Undefined&quot;,&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; XE_TILE_HW_ERR_UNKNOWN_FATAL},<br>
&gt;&gt;&gt;&gt; +&nbsp; {&quot;GSC error&quot;,&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; XE_TILE_HW_ERR_GSC_FATAL&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /=
* Bit Pos 8 */},<br>
&gt;&gt;&gt;&gt; +&nbsp; {&quot;SGLI Cmd Parity&quot;,&nbsp;&nbsp;&nbsp;&nb=
sp; XE_TILE_HW_ERR_SGLI_FATAL&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Bit Pos 9 */},<br>
&gt;&gt;&gt;&gt; +&nbsp; {&quot;Undefined&quot;,&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; XE_TILE_HW_ERR_UNKNOWN_FATAL},<br>
&gt;&gt;&gt;&gt; +&nbsp; {&quot;Undefined&quot;,&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; XE_TILE_HW_ERR_UNKNOWN_FATAL},<br>
&gt;&gt;&gt;&gt; +&nbsp; {&quot;SGUNIT&quot;,&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; XE_TILE_HW_ERR_SGUNIT_FATA=
L&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /=
* Bit Pos 12 */},<br>
&gt;&gt;&gt;&gt; +&nbsp; {&quot;SGCI Cmd Parity&quot;,&nbsp;&nbsp;&nbsp;&nb=
sp; XE_TILE_HW_ERR_SGCI_FATAL&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Bit Pos 13 */},<br>
&gt;&gt;&gt;&gt; +&nbsp; {&quot;Undefined&quot;,&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; XE_TILE_HW_ERR_UNKNOWN_FATAL},<br>
&gt;&gt;&gt;&gt; +&nbsp; {&quot;Undefined&quot;,&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; XE_TILE_HW_ERR_UNKNOWN_FATAL},<br>
&gt;&gt;&gt;&gt; +&nbsp; {&quot;SOC ERROR&quot;,&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; XE_TILE_HW_ERR_SOC_FATAL&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /=
* Bit Pos 16 */},<br>
&gt;&gt;&gt;&gt; +&nbsp; {&quot;Undefined&quot;,&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; XE_TILE_HW_ERR_UNKNOWN_FATAL},<br>
&gt;&gt;&gt;&gt; +&nbsp; {&quot;Undefined&quot;,&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; XE_TILE_HW_ERR_UNKNOWN_FATAL},<br>
&gt;&gt;&gt;&gt; +&nbsp; {&quot;Undefined&quot;,&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; XE_TILE_HW_ERR_UNKNOWN_FATAL},<br>
&gt;&gt;&gt;&gt; +&nbsp; {&quot;MERT Cmd Parity&quot;,&nbsp;&nbsp;&nbsp;&nb=
sp; XE_TILE_HW_ERR_MERT_FATAL&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Bit Pos 20 */},<br>
&gt;&gt;&gt;&gt; +};<br>
&gt;&gt;&gt;&gt; +<br>
&gt;&gt;&gt;&gt; +struct error_msg_counter_pair dev_err_stat_nonfatal_reg[]=
 =3D {<br>
&gt;&gt;&gt;&gt; +&nbsp; {&quot;GT&quot;,&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; XE_TIL=
E_HW_ERR_GT_NONFATAL&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; /* Bit Pos 0 */},<br>
&gt;&gt;&gt;&gt; +&nbsp; {&quot;SGGI Data Parity&quot;,&nbsp;&nbsp;&nbsp; X=
E_TILE_HW_ERR_SGGI_NONFATAL&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp; /* Bit Pos 1 */},<br>
&gt;&gt;&gt;&gt; +&nbsp; {&quot;Undefined&quot;,&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; XE_TILE_HW_ERR_UNKNOWN_NONFATAL},<br>
&gt;&gt;&gt;&gt; +&nbsp; {&quot;Undefined&quot;,&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; XE_TILE_HW_ERR_UNKNOWN_NONFATAL},<br>
&gt;&gt;&gt;&gt; +&nbsp; {&quot;DISPLAY&quot;,&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; XE_TILE_HW_ERR_DISPLAY_NONFATAL=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Bit Pos 4 */},<br>
&gt;&gt;&gt;&gt; +&nbsp; {&quot;SGDI Data Parity&quot;,&nbsp;&nbsp;&nbsp; X=
E_TILE_HW_ERR_SGDI_NONFATAL&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp; /* Bit Pos 5 */},<br>
&gt;&gt;&gt;&gt; +&nbsp; {&quot;Undefined&quot;,&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; XE_TILE_HW_ERR_UNKNOWN_NONFATAL},<br>
&gt;&gt;&gt;&gt; +&nbsp; {&quot;Undefined&quot;,&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; XE_TILE_HW_ERR_UNKNOWN_NONFATAL},<br>
&gt;&gt;&gt;&gt; +&nbsp; {&quot;GSC&quot;,&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; XE_TILE_HW_=
ERR_GSC_NONFATAL&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp; /* Bit Pos 8 */},<br>
&gt;&gt;&gt;&gt; +&nbsp; {&quot;SGLI Data Parity&quot;,&nbsp;&nbsp;&nbsp; X=
E_TILE_HW_ERR_SGLI_NONFATAL&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp; /* Bit Pos 9 */},<br>
&gt;&gt;&gt;&gt; +&nbsp; {&quot;Undefined&quot;,&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; XE_TILE_HW_ERR_UNKNOWN_NONFATAL},<br>
&gt;&gt;&gt;&gt; +&nbsp; {&quot;Undefined&quot;,&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; XE_TILE_HW_ERR_UNKNOWN_NONFATAL},<br>
&gt;&gt;&gt;&gt; +&nbsp; {&quot;SGUNIT&quot;,&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; XE_TILE_HW_ERR_SGUNIT_NONF=
ATAL&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Bit Pos 12 */=
},<br>
&gt;&gt;&gt;&gt; +&nbsp; {&quot;SGCI Data Parity&quot;,&nbsp;&nbsp;&nbsp; X=
E_TILE_HW_ERR_SGCI_NONFATAL&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp; /* Bit Pos 13 */},<br>
&gt;&gt;&gt;&gt; +&nbsp; {&quot;Undefined&quot;,&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; XE_TILE_HW_ERR_UNKNOWN_NONFATAL},<br>
&gt;&gt;&gt;&gt; +&nbsp; {&quot;Undefined&quot;,&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; XE_TILE_HW_ERR_UNKNOWN_NONFATAL},<br>
&gt;&gt;&gt;&gt; +&nbsp; {&quot;SOC&quot;,&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; XE_TILE_HW_=
ERR_SOC_NONFATAL&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp; /* Bit Pos 16 */},<br>
&gt;&gt;&gt;&gt; +&nbsp; {&quot;Undefined&quot;,&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; XE_TILE_HW_ERR_UNKNOWN_NONFATAL&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Bit Pos 17 */},<br>
&gt;&gt;&gt;&gt; +&nbsp; {&quot;Undefined&quot;,&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; XE_TILE_HW_ERR_UNKNOWN_NONFATAL},<br>
&gt;&gt;&gt;&gt; +&nbsp; {&quot;Undefined&quot;,&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; XE_TILE_HW_ERR_UNKNOWN_NONFATAL},<br>
&gt;&gt;&gt;&gt; +&nbsp; {&quot;MERT Data Parity&quot;,&nbsp;&nbsp;&nbsp; X=
E_TILE_HW_ERR_MERT_NONFATAL&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp; /* Bit Pos 20 */},<br>
&gt;&gt;&gt;&gt; +};<br>
&gt;&gt;&gt;&gt; +<br>
&gt;&gt;&gt;&gt; +struct error_msg_counter_pair dev_err_stat_correctable_re=
g[] =3D {<br>
&gt;&gt;&gt;&gt; +&nbsp; {&quot;GT&quot;,&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; XE_TIL=
E_HW_ERR_GT_CORR&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Bit Pos 0 */},<br>
&gt;&gt;&gt;&gt; +&nbsp; {&quot;Undefined&quot;,&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; XE_TILE_HW_ERR_UNKNOWN_CORR},<br>
&gt;&gt;&gt;&gt; +&nbsp; {&quot;Undefined&quot;,&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; XE_TILE_HW_ERR_UNKNOWN_CORR},<br>
&gt;&gt;&gt;&gt; +&nbsp; {&quot;Undefined&quot;,&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; XE_TILE_HW_ERR_UNKNOWN_CORR},<br>
&gt;&gt;&gt;&gt; +&nbsp; {&quot;DISPLAY&quot;,&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; XE_TILE_HW_ERR_DISPLAY_CORR&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Bit=
 Pos 4 */},<br>
&gt;&gt;&gt;&gt; +&nbsp; {&quot;Undefined&quot;,&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; XE_TILE_HW_ERR_UNKNOWN_CORR},<br>
&gt;&gt;&gt;&gt; +&nbsp; {&quot;Undefined&quot;,&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; XE_TILE_HW_ERR_UNKNOWN_CORR},<br>
&gt;&gt;&gt;&gt; +&nbsp; {&quot;Undefined&quot;,&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; XE_TILE_HW_ERR_UNKNOWN_CORR},<br>
&gt;&gt;&gt;&gt; +&nbsp; {&quot;GSC&quot;,&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; XE_TILE_HW_=
ERR_GSC_CORR&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Bit Pos 8 */},<br>
&gt;&gt;&gt;&gt; +&nbsp; {&quot;Undefined&quot;,&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; XE_TILE_HW_ERR_UNKNOWN_CORR},<br>
&gt;&gt;&gt;&gt; +&nbsp; {&quot;Undefined&quot;,&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; XE_TILE_HW_ERR_UNKNOWN_CORR},<br>
&gt;&gt;&gt;&gt; +&nbsp; {&quot;Undefined&quot;,&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; XE_TILE_HW_ERR_UNKNOWN_CORR},<br>
&gt;&gt;&gt;&gt; +&nbsp; {&quot;SGUNIT&quot;,&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; XE_TILE_HW_ERR_SGUNIT_CORR=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; /* Bit Pos 12 */},<br>
&gt;&gt;&gt;&gt; +&nbsp; {&quot;Undefined&quot;,&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; XE_TILE_HW_ERR_UNKNOWN_CORR},<br>
&gt;&gt;&gt;&gt; +&nbsp; {&quot;Undefined&quot;,&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; XE_TILE_HW_ERR_UNKNOWN_CORR},<br>
&gt;&gt;&gt;&gt; +&nbsp; {&quot;Undefined&quot;,&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; XE_TILE_HW_ERR_UNKNOWN_CORR},<br>
&gt;&gt;&gt;&gt; +&nbsp; {&quot;SOC&quot;,&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; XE_TILE_HW_=
ERR_SOC_CORR&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Bit Pos 16 */},<br>
&gt;&gt;&gt;&gt; +&nbsp; {&quot;Undefined&quot;,&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; XE_TILE_HW_ERR_UNKNOWN_CORR},<br>
&gt;&gt;&gt;&gt; +&nbsp; {&quot;Undefined&quot;,&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; XE_TILE_HW_ERR_UNKNOWN_CORR},<br>
&gt;&gt;&gt;&gt; +&nbsp; {&quot;Undefined&quot;,&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; XE_TILE_HW_ERR_UNKNOWN_CORR},<br>
&gt;&gt;&gt;&gt; +&nbsp; {&quot;Undefined&quot;,&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; XE_TILE_HW_ERR_UNKNOWN_CORR},<br>
&gt;&gt;&gt;&gt; +};<br>
&gt;&gt;&gt;&gt; +<br>
&gt;&gt;&gt;&gt; +static void update_valid_error_regs(struct xe_device *xe)=
<br>
&gt;&gt;&gt;&gt; +{<br>
&gt;&gt;&gt;&gt; +&nbsp; unsigned long mask =3D 0;<br>
&gt;&gt;&gt;&gt; +<br>
&gt;&gt;&gt;&gt; +&nbsp; u32 i;<br>
&gt;&gt;&gt;&gt; +<br>
&gt;&gt;&gt;&gt; +&nbsp; if (xe-&gt;info.platform =3D=3D XE_DG2) {<br>
&gt;&gt;&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ma=
sk =3D ~(0 | DG2_DEV_ERR_STAT_FATAL_MASK);<br>
&gt;&gt;&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; fo=
r_each_set_bit(i, &amp;mask, DEV_ERR_STAT_MAX_ERROR_BIT)<br>
&gt;&gt;&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dev_err_stat_fatal_reg[i] =3D=
 (struct error_msg_counter_pair)<br>
&gt;&gt;&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {.errmsg =3D &quot;Undefined&=
quot;, .errcounter =3D XE_TILE_HW_ERR_UNKNOWN_FATAL};<br>
&gt;&gt;&gt; Nope. For one thing, the arrays really should be static const,=
 placed in<br>
&gt;&gt;&gt; rodata, and not mutable.<br>
&gt;&gt; My Idea of keeping it mutable is to avoid multiple platform specif=
ic <br>
&gt;&gt; arrays.<br>
&gt;&gt;&gt; For another, if you have a platform with two or more different=
 devices,<br>
&gt;&gt;&gt; whichever gets probed last clobbers the data.<br>
&gt;&gt;<br>
&gt;&gt; Thanks for pointing it out. I had missed this particular scenario.=
&nbsp; I <br>
&gt;&gt; believe defining platform specific array is better<br>
&gt;&gt;<br>
&gt;&gt; because then we can ensure them to be immutable and we will not be=
 <br>
&gt;&gt; required to have platform specific mask also.<br>
&gt;&gt;<br>
&gt;&gt; I believe this will help with maintainability too.<br>
&gt;&gt;<br>
&gt;&gt; BR<br>
&gt;&gt;<br>
&gt;&gt; Himal Ghimiray<br>
&gt;&gt;<br>
&gt;&gt;&gt;&gt; +<br>
&gt;&gt;&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ma=
sk =3D ~(0 | DG2_DEV_ERR_STAT_NONFATAL_MASK);<br>
&gt;&gt;&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; fo=
r_each_set_bit(i, &amp;mask, DEV_ERR_STAT_MAX_ERROR_BIT)<br>
&gt;&gt;&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dev_err_stat_nonfatal_reg[i] =
=3D (struct error_msg_counter_pair)<br>
&gt;&gt;&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {.errmsg =3D &quot;Undefined&=
quot;, .errcounter =3D XE_TILE_HW_ERR_UNKNOWN_NONFATAL};<br>
&gt;&gt;&gt;&gt; +<br>
&gt;&gt;&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ma=
sk =3D ~(0 | DG2_DEV_ERR_STAT_CORRECTABLE_MASK);<br>
&gt;&gt;&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; fo=
r_each_set_bit(i, &amp;mask, DEV_ERR_STAT_MAX_ERROR_BIT)<br>
&gt;&gt;&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dev_err_stat_correctable_reg[=
i] =3D (struct error_msg_counter_pair)<br>
&gt;&gt;&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {.errmsg =3D &quot;Undefined&=
quot;, .errcounter =3D XE_TILE_HW_ERR_UNKNOWN_CORR};<br>
&gt;&gt;&gt;&gt; +&nbsp; } else if (xe-&gt;info.platform =3D=3D XE_PVC) {<b=
r>
&gt;&gt;&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ma=
sk =3D ~(0 | PVC_DEV_ERR_STAT_FATAL_MASK);<br>
&gt;&gt;&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; fo=
r_each_set_bit(i, &amp;mask, DEV_ERR_STAT_MAX_ERROR_BIT)<br>
&gt;&gt;&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dev_err_stat_fatal_reg[i] =3D=
 (struct error_msg_counter_pair)<br>
&gt;&gt;&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {.errmsg =3D &quot;Undefined&=
quot;, .errcounter =3D XE_TILE_HW_ERR_UNKNOWN_FATAL};<br>
&gt;&gt;&gt;&gt; +<br>
&gt;&gt;&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ma=
sk =3D ~(0 | PVC_DEV_ERR_STAT_NONFATAL_MASK);<br>
&gt;&gt;&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; fo=
r_each_set_bit(i, &amp;mask, DEV_ERR_STAT_MAX_ERROR_BIT)<br>
&gt;&gt;&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dev_err_stat_nonfatal_reg[i] =
=3D (struct error_msg_counter_pair)<br>
&gt;&gt;&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {.errmsg =3D &quot;Undefined&=
quot;, .errcounter =3D XE_TILE_HW_ERR_UNKNOWN_NONFATAL};<br>
&gt;&gt;&gt;&gt; +<br>
&gt;&gt;&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ma=
sk =3D ~(0 | PVC_DEV_ERR_STAT_CORRECTABLE_MASK);<br>
&gt;&gt;&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; fo=
r_each_set_bit(i, &amp;mask, DEV_ERR_STAT_MAX_ERROR_BIT)<br>
&gt;&gt;&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dev_err_stat_correctable_reg[=
i] =3D (struct error_msg_counter_pair)<br>
&gt;&gt;&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {.errmsg =3D &quot;Undefined&=
quot;, .errcounter =3D XE_TILE_HW_ERR_UNKNOWN_CORR};<br>
&gt;&gt;&gt;&gt; +&nbsp; }<br>
&gt;&gt;&gt;&gt; +}<br>
&gt;&gt;&gt;&gt; +<br>
&gt;&gt;&gt;&gt; +static void<br>
&gt;&gt;&gt;&gt; +xe_hw_error_source_handler(struct xe_tile *tile, const en=
um hardware_error hw_err)<br>
&gt;&gt;&gt;&gt; +{<br>
&gt;&gt;&gt;&gt; +&nbsp; const char *hw_err_str =3D hardware_error_type_to_=
str(hw_err);<br>
&gt;&gt;&gt;&gt; +&nbsp; struct error_msg_counter_pair *errstat;<br>
&gt;&gt;&gt;&gt; +&nbsp; unsigned long errsrc;<br>
&gt;&gt;&gt;&gt; +&nbsp; unsigned long flags;<br>
&gt;&gt;&gt;&gt; +&nbsp; const char *errmsg;<br>
&gt;&gt;&gt;&gt; +&nbsp; struct xe_gt *mmio;<br>
&gt;&gt;&gt;&gt; +&nbsp; u32 counter;<br>
&gt;&gt;&gt;&gt; +&nbsp; u32 errcntr;<br>
&gt;&gt;&gt;&gt; +&nbsp; u32 errbit;<br>
&gt;&gt;&gt;&gt; +<br>
&gt;&gt;&gt;&gt; +&nbsp; switch (hw_err) {<br>
&gt;&gt;&gt;&gt; +&nbsp; case HARDWARE_ERROR_FATAL:<br>
&gt;&gt;&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; er=
rstat =3D (struct error_msg_counter_pair *)dev_err_stat_fatal_reg;<br>
&gt;&gt;&gt; Why the casts?<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; co=
unter =3D XE_TILE_HW_ERR_UNKNOWN_FATAL;<br>
&gt;&gt;&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; br=
eak;<br>
&gt;&gt;&gt;&gt; +&nbsp; case HARDWARE_ERROR_NONFATAL:<br>
&gt;&gt;&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; er=
rstat =3D (struct error_msg_counter_pair *)dev_err_stat_nonfatal_reg;<br>
&gt;&gt;&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; co=
unter =3D XE_TILE_HW_ERR_UNKNOWN_NONFATAL;<br>
&gt;&gt;&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; br=
eak;<br>
&gt;&gt;&gt;&gt; +&nbsp; case HARDWARE_ERROR_CORRECTABLE:<br>
&gt;&gt;&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; er=
rstat =3D (struct error_msg_counter_pair *)dev_err_stat_correctable_reg;<br=
>
&gt;&gt;&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; co=
unter =3D XE_TILE_HW_ERR_UNKNOWN_CORR;<br>
&gt;&gt;&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; br=
eak;<br>
&gt;&gt;&gt;&gt; +&nbsp; default:<br>
&gt;&gt;&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; re=
turn;<br>
&gt;&gt;&gt;&gt; +&nbsp; }<br>
&gt;&gt;&gt;&gt; +<br>
&gt;&gt;&gt;&gt; +&nbsp; spin_lock_irqsave(&amp;tile_to_xe(tile)-&gt;irq.lo=
ck, flags);<br>
&gt;&gt;&gt;&gt; +&nbsp; mmio =3D tile-&gt;primary_gt;<br>
&gt;&gt;&gt;&gt; +&nbsp; errsrc =3D xe_mmio_read32(mmio, DEV_ERR_STAT_REG(h=
w_err));<br>
&gt;&gt;&gt;&gt; +<br>
&gt;&gt;&gt;&gt; +&nbsp; if (!errsrc) {<br>
&gt;&gt;&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; xe=
_tile_log_hw_err(tile, &quot;DEV_ERR_STAT_REG_%s blank!\n&quot;, hw_err_str=
);<br>
&gt;&gt;&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; go=
to unlock;<br>
&gt;&gt;&gt;&gt; +&nbsp; }<br>
&gt;&gt;&gt;&gt; +<br>
&gt;&gt;&gt;&gt; +&nbsp; for_each_set_bit(errbit, &amp;errsrc, REG_SIZE) {<=
br>
&gt;&gt;&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if=
 (errbit &lt; DEV_ERR_STAT_MAX_ERROR_BIT) {<br>
&gt;&gt;&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; errmsg =3D errstat[errbit].er=
rmsg;<br>
&gt;&gt;&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; errcntr =3D errstat[errbit].e=
rrcounter;<br>
&gt;&gt;&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; } =
else {<br>
&gt;&gt;&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; errmsg =3D &quot;Undefined&qu=
ot;;<br>
&gt;&gt;&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; errcntr =3D counter;<br>
&gt;&gt;&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<=
br>
&gt;&gt;&gt;&gt; +<br>
&gt;&gt;&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if=
 (hw_err =3D=3D HARDWARE_ERROR_CORRECTABLE)<br>
&gt;&gt;&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; xe_tile_log_hw_warn(tile, &qu=
ot;%s %s error bit[%d] is set\n&quot;,<br>
&gt;&gt;&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; errmsg, hw_err_str, errbit);<br>
&gt;&gt;&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; el=
se<br>
&gt;&gt;&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; xe_tile_log_hw_err(tile, &quo=
t;%s %s error bit[%d] is set\n&quot;,<br>
&gt;&gt;&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; errmsg, hw_err_str, errbit);<br>
&gt;&gt;&gt;&gt; +<br>
&gt;&gt;&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ti=
le-&gt;errors.hw[errcntr]++;<br>
&gt;&gt;&gt;&gt; +&nbsp; }<br>
&gt;&gt;&gt;&gt; +<br>
&gt;&gt;&gt;&gt; +&nbsp; xe_mmio_write32(mmio, DEV_ERR_STAT_REG(hw_err), er=
rsrc);<br>
&gt;&gt;&gt;&gt; +unlock:<br>
&gt;&gt;&gt;&gt; +&nbsp; spin_unlock_irqrestore(&amp;tile_to_xe(tile)-&gt;i=
rq.lock, flags);<br>
&gt;&gt;&gt;&gt; +}<br>
&gt;&gt;&gt;&gt; +<br>
&gt;&gt;&gt;&gt; +/*<br>
&gt;&gt;&gt;&gt; + * XE Platforms adds three Error bits to the Master Inter=
rupt<br>
&gt;&gt;&gt;&gt; + * Register to support error handling. These three bits a=
re<br>
&gt;&gt;&gt;&gt; + * used to convey the class of error:<br>
&gt;&gt;&gt;&gt; + * FATAL, NONFATAL, or CORRECTABLE.<br>
&gt;&gt;&gt;&gt; + *<br>
&gt;&gt;&gt;&gt; + * To process an interrupt:<br>
&gt;&gt;&gt;&gt; + *&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Determine source o=
f error (IP block) by reading<br>
&gt;&gt;&gt;&gt; + *&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; the De=
vice Error Source Register (RW1C) that<br>
&gt;&gt;&gt;&gt; + *&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; corres=
ponds to the class of error being serviced<br>
&gt;&gt;&gt;&gt; + *&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; and lo=
g the error.<br>
&gt;&gt;&gt;&gt; + */<br>
&gt;&gt;&gt;&gt; +static void<br>
&gt;&gt;&gt;&gt; +xe_hw_error_irq_handler(struct xe_tile *tile, const u32 m=
aster_ctl)<br>
&gt;&gt;&gt;&gt; +{<br>
&gt;&gt;&gt;&gt; +&nbsp; enum hardware_error hw_err;<br>
&gt;&gt;&gt;&gt; +<br>
&gt;&gt;&gt;&gt; +&nbsp; for (hw_err =3D 0; hw_err &lt; HARDWARE_ERROR_MAX;=
 hw_err++) {<br>
&gt;&gt;&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if=
 (master_ctl &amp; XE_ERROR_IRQ(hw_err))<br>
&gt;&gt;&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; xe_hw_error_source_handler(ti=
le, hw_err);<br>
&gt;&gt;&gt;&gt; +&nbsp; }<br>
&gt;&gt;&gt;&gt; +}<br>
&gt;&gt;&gt;&gt; +<br>
&gt;&gt;&gt;&gt;&nbsp;&nbsp; /*<br>
&gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; * Top-level interrupt handler for Xe_LP+=
 and beyond.&nbsp; These platforms have<br>
&gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; * a &quot;master tile&quot; interrupt re=
gister which must be consulted before the<br>
&gt;&gt;&gt;&gt; @@ -413,6 +630,7 @@ static irqreturn_t dg1_irq_handler(int=
 irq, void *arg)<br>
&gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp; xe_mmio_write32(mmio, GFX_MSTR_IRQ, master_ctl);<br>
&gt;&gt;&gt;&gt;&nbsp;&nbsp; <br>
&gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp; gt_irq_handler(tile, master_ctl, intr_dw, identity);<br>
&gt;&gt;&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; xe=
_hw_error_irq_handler(tile, master_ctl);<br>
&gt;&gt;&gt;&gt;&nbsp;&nbsp; <br>
&gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp; /*<br>
&gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; * Display interrupts (including display backlight opera=
tions<br>
&gt;&gt;&gt;&gt; @@ -561,6 +779,8 @@ int xe_irq_install(struct xe_device *x=
e)<br>
&gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp; return -EINVAL;<br>
&gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt;&gt;&gt;&gt;&nbsp;&nbsp; <br>
&gt;&gt;&gt;&gt; +&nbsp; update_valid_error_regs(xe);<br>
&gt;&gt;&gt;&gt; +<br>
&gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp; xe-&gt;irq.enabled =3D true;<br>
&gt;&gt;&gt;&gt;&nbsp;&nbsp; <br>
&gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp; xe_irq_reset(xe);<br>
<br>
-- <br>
Jani Nikula, Intel Open Source Graphics Center<br>
</div>
</span></font><br>
</div>
</body>
</html>

--_000_MW4PR11MB7056CDA2898D6F47ADFA57D0B313AMW4PR11MB7056namp_--
