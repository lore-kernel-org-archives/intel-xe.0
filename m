Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7896CA0EE4
	for <intel-xe@archiver.kernel.org>; Fri, 15 Aug 2025 21:03:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8794010E99D;
	Fri, 15 Aug 2025 21:03:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LFIQScOM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C13D210E99D
 for <intel-xe@lists.freedesktop.org>; Fri, 15 Aug 2025 21:03:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755291818; x=1786827818;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=35Sh9R91KKdNSvP8PRSMWl+nSFuZuZdvNy6n47OkcB8=;
 b=LFIQScOMua0ZXPRSvPJpHpc3YaWo1vqiJwjFmV4eBCZyTLX9N6+GTgy8
 P4HcIA8Yx5fAqVKvdJd3fBVS9JCvlCoywV/T7kK02O958v8tmcqe2spkq
 wNS7PJ4bJmhx3TdVRZUufEK9u6g2g76uhAbg1Sy0i9lOcE+gpqcTEPklZ
 otq8v2dFy3JKYq68sOeNI/WG6JDbwA8jrQ5ZZ3LhQzStkqUfcEPviWI4g
 hjXI5j5HkY4Xe6oJufY7u3di8t3qVUekazJI4FidXFEKXqaT+ZtTf6vLY
 Y3vpoEunaUvqs/zz7d++Yh8QhilVfYJoh5rcOlAkhF7HZyg2TuadqzLmw Q==;
X-CSE-ConnectionGUID: gv9X9QKqQ564XR9jafT8tg==
X-CSE-MsgGUID: MIa628WSR/uvR5O42iKvpw==
X-IronPort-AV: E=McAfee;i="6800,10657,11523"; a="61247746"
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; d="scan'208";a="61247746"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Aug 2025 14:03:37 -0700
X-CSE-ConnectionGUID: 3h2ZuPNhT3WVWXPDFzsVLg==
X-CSE-MsgGUID: ab+WhRB6S+qiK5/D8lVmUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; d="scan'208";a="197955427"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Aug 2025 14:03:36 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 15 Aug 2025 14:03:36 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Fri, 15 Aug 2025 14:03:36 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (40.107.237.63)
 by edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 15 Aug 2025 14:03:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=elz2R+1ZqKHql/ERXgjmtGBfd6TQo0tqLIKoYxcfazlpllCGa+IOgpahubmul8pe6oWhBKzfxCsFDZlqdi8QI5QYpM46CWzYSIhTQsd8G8YEPLm3DHVwrRi9jZ1MfgpjQ+MHqAx3wFa4EGjew0WBzf8MWmEuo6S1DzBd15TkRJfF7iv48+3jmwx182adns5SyRjI3JcVzrjZzmHcUhcydEyGMFTvNfGbHb7PMkfJW4FjgVo5+/EMmftODgEg28Ydc4KHJAvQP+J8u+HO/NSWI7f1GzS+pFoPeAvc3kACwGUPEOROky92caLI43IZwb0+ir1JWfSYt4nVtsNKTmFJQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ijp92Z+KXvCZ977TY9m7sNEhSW5Axsp5g8FlHqgpQsQ=;
 b=ELMvNppW1sN7Jb6k2ptUnHTyavcpVOjMdzCjYPkpbwNtSuB6jwBG9gzzFNiNlkpZcy2YfYgdZXox5Om871ufESvaRi0yv00OmziNYCf8xoZCACZu/uoeicFi54+zfbFT8mvK89KqXmd9qE3vTlmUwKxmVk7Uw9y4NCDQil0qr/LyATzuy1MTa1Aa+koKSEkSIVGbIZMQX5Ekxq7hNsTXKQQ1Yr83LTS9FJ81FauixDyK8GnkX6zARBItIPco2s9dV2ZMZA1VW5+FOXIlDk2c/bOzP1pN5AcipzYffg6urQTwdo3eISjAxd64XQ2y+jFJ41JyBhpl7LQtRX3Mc80IUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BL3PR11MB6362.namprd11.prod.outlook.com (2603:10b6:208:3b5::8)
 by SJ1PR11MB6251.namprd11.prod.outlook.com (2603:10b6:a03:458::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.17; Fri, 15 Aug
 2025 21:03:33 +0000
Received: from BL3PR11MB6362.namprd11.prod.outlook.com
 ([fe80::796c:2779:697e:54e7]) by BL3PR11MB6362.namprd11.prod.outlook.com
 ([fe80::796c:2779:697e:54e7%6]) with mapi id 15.20.9031.018; Fri, 15 Aug 2025
 21:03:33 +0000
From: "Yang, Fei" <fei.yang@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Roper, 
 Matthew D" <matthew.d.roper@intel.com>, "De Marchi, Lucas"
 <lucas.demarchi@intel.com>
Subject: RE: [PATCH 1/1] drm/xe: serialize store_data and user_interrupt for
 ufence wait
Thread-Topic: [PATCH 1/1] drm/xe: serialize store_data and user_interrupt for
 ufence wait
Thread-Index: AQHcC7a5lZyMO6lPGkW3G3CKAsUfDbRfcgYAgATDkDA=
Date: Fri, 15 Aug 2025 21:03:33 +0000
Message-ID: <BL3PR11MB63624BF7AAB3546C1A1920DC9A34A@BL3PR11MB6362.namprd11.prod.outlook.com>
References: <20250812182846.1608209-1-fei.yang@intel.com>
 <20250812182846.1608209-2-fei.yang@intel.com>
 <aJufANNMVyeB0HMG@lstrano-desk.jf.intel.com>
In-Reply-To: <aJufANNMVyeB0HMG@lstrano-desk.jf.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL3PR11MB6362:EE_|SJ1PR11MB6251:EE_
x-ms-office365-filtering-correlation-id: 08899d03-2420-4c79-cc2a-08dddc3f31eb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?UWkbII6rAEtFOa0+eoKDIb4PEEXXGCX19oBRT/9+wLEFs9ocZdzQZGETsZ+r?=
 =?us-ascii?Q?37SAFfLF7Cdk+PahHuZm7p/AR4AQTKBatzuCnba0OUWx1QhVf4W22XlcLuZ4?=
 =?us-ascii?Q?+wiDYF5egSKFN4+K8Kvc51F9Ut1UUqi8aiQG2+C2iZviBFZEwRebSzFXGUJd?=
 =?us-ascii?Q?MKNOReVwBD/6bmF0QYrWK+PQI9MO8zMwoOR97DlfC2/dJL9hn8nP2Qso9qnP?=
 =?us-ascii?Q?7bWd46E5re5nn2Gmze/8caKFIdUJElfXtE3osC0II2Uvcgi2vShigoJw83Tl?=
 =?us-ascii?Q?BLSqh/xowZoWl331reagRayK3Tb/aU09/EzlqGR1eahcV0OTwVckWe9JW3lG?=
 =?us-ascii?Q?ebU4Yj2gIJDE4uafRSudTCZ2pMdXIDMekW715v94PApideo5k6kSIpIdn9oA?=
 =?us-ascii?Q?hvNpqyUiUw1KPKOKDcEc9waaQqZmXDR+NDB2cd5MFeVoBRb6wseSdq3m6nFF?=
 =?us-ascii?Q?cKcy7Kw6QJc3gGjlRt2kOcii9fH6QPemGybLR7xrHbPlQkXT9nyNFQs6n0xx?=
 =?us-ascii?Q?H+P/bifp2ouTCaJ8RtwEIm1j/IDUJHE+1OeBq1SKVNIpYQKlIlgC+WhzeMyf?=
 =?us-ascii?Q?BsxYdUECdGnyTtteqYICU15lAJqEpKiCR0i5I7HCFY3WSo12MlWdd5vHaKCo?=
 =?us-ascii?Q?25OzwRLVEaaMo6wXVtMOaExofA/huJsf8CpolEWwW3qojF4CNIOagrbUYpFv?=
 =?us-ascii?Q?FZCwwV3VQEFgHILx2/v1M7uEsghEDRdfSiL6KhUhXzcXLr8D8t1Z8b8w5qBv?=
 =?us-ascii?Q?qIjt6eKnXqu/0K/NbTZpHfF3EtrNE/u4irpNaElfCY/Qy9mC4/kbi7escwPm?=
 =?us-ascii?Q?pMZ3qYYylzIWtX5lUpztHHUoWxGgA2dtNe25VVvNOz1MHWHglVad8SIJQBn+?=
 =?us-ascii?Q?892diz2N7T7svudQxwroOYhgrBDUwX+ZHGmAlFqyMEDfIVFOkwRJutLL0omv?=
 =?us-ascii?Q?cNydsvdxE8i+tsrUdo4Q2/RDtKrpJsCAxZCjeC8C3eh91A6P4lT8WBJev04L?=
 =?us-ascii?Q?bAg6vXx6orsFovpmWwb1CLDo5MRVtFITcE2POk03LDOAd2b/ISzooMYEZ1oi?=
 =?us-ascii?Q?6bkezjs3vjvdlLq3zZhYN4s8QsZTzPQUCxtNdrP48Zt0z1kZN2Rf5/E/kFYi?=
 =?us-ascii?Q?evhP1AQySnzOqjmfV018wdLAGCogdHvh1LgtyB8UpdOmdTmOmx8vlHPtTfMx?=
 =?us-ascii?Q?bT2sGaK7aJE1z4G/sl9SFIZbTbQMJNTClQ6z5te0ALh35jcxH/ZP41KKPLxK?=
 =?us-ascii?Q?1Iw8be9ebR3x2Pab3xkxqPnjLR1ut/otEuXiW8j13kJ5+znPi5CXCq1YUY9S?=
 =?us-ascii?Q?DnEt8KUidfF0HVtpsVV+s0HKMpXUXx/AQNBjU89GAv7m+qdbVeHxYx72DmCk?=
 =?us-ascii?Q?DOfRJch99WcBOn3urLe/guh/YINwpPcN2n/1rC7NJgDkR3gNsZTbgh9SJYLY?=
 =?us-ascii?Q?KxAIo1JGN1mUnC8RhNX5vXxZoX0f27h9CqH+u5yYY/25xySdaRLfBQ=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6362.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?xy8SVu0RmIGG2oWMFAcWBKcTSLbmpJT7A1F8upLrF+uVcah4mWYDrMbIz3ty?=
 =?us-ascii?Q?aHcC8etNwWysKnk1jLKfq1PAwyx6uTLhn9+S+gjbVLtUJXdWqAhhQJJVzz46?=
 =?us-ascii?Q?sq/KENZDI3jHOgCW3m3K48Lt5xAtGvHRPSOKAqSNha2bMYKnQcLu4icQINL0?=
 =?us-ascii?Q?uVL0bHdEIar8uXmCh3/r8ZOKrW74A45It+uGj2auvzgvvm3iY3bPO7wIWvjH?=
 =?us-ascii?Q?iDUMvahzv+U2/tbA2DeA+lhrUV+9zXuSMdB0hZq1f3GFaQwsR72qiH5Fcf7H?=
 =?us-ascii?Q?Yzb0Nj8rz+6q2aaKjQNIFlbvB/PLHI8IyvuuDlaEk7bJKvps9z7jks+RujKg?=
 =?us-ascii?Q?3Dxtam9gZL1C4AZdXKMUwAGzYh6Cz18xbfCi6ZcLCjOL097MOacCsD2CBnsQ?=
 =?us-ascii?Q?N42sH1/sjIgcYZGDzlOB5cVwLfQi5PwkVYU3P6gtvHqSHkQCMoKyKTFyqcwv?=
 =?us-ascii?Q?WDIzotRKSfkqfeK7y5OawcFOG8kBPcbxi0GLIBvwOS9DFtVV8FwJYv0Djp8f?=
 =?us-ascii?Q?pHfI7ibu6/zlRHVjoy1mgfmQ5SP7lStjmH35KDXdFbvbmPH3n8Azc2gfVCqJ?=
 =?us-ascii?Q?b5t+tE4bj8xoz5KOykuX8MyscWaoh/7CBsO43yyy8lNhwznmR59d1Lw67J0E?=
 =?us-ascii?Q?uCNkmujmQ/t6TryIdpXtw4CV0WrRABvFiE6bCxvowcH9IyG8ROdw2B6UtCqn?=
 =?us-ascii?Q?56+cW7XDtshj02WvfJ77Ewrxld2Pj3TfT49iER7UAq80+tSTGEstzw3DSlOS?=
 =?us-ascii?Q?5SKL13zZaqlmEl0p20klJlIs1OUzW0isKZR+nJ+3WwprZG04gAZszcvPaq87?=
 =?us-ascii?Q?GnnlM3FhkPxeqdtDcTnoQa74KSrAXkVTwH9kmmikT/yNP2BgPGkazYEAWeDE?=
 =?us-ascii?Q?jfXAsO8MhXs3mjh1YVrFmmFMBp/+4W9HDNBPOwBWmOhoUbVvumU/TcOxeQ1W?=
 =?us-ascii?Q?KC7X1nUpBuPslmv5ZS/mi256dyU2TpfYhihz471O59T8gcEub3iH5RE2ItCu?=
 =?us-ascii?Q?a7FjV5vheY6ZpMt+dUk4PIa4g5uQ+Bj91Lr98COwcPPGvPQgYlkyzBBlhM/q?=
 =?us-ascii?Q?xraryOkdQpxxQmEVdbZZOGVZ5lpNlo/9ECryLHboXbjw4DerxhAbjwL1Yv5h?=
 =?us-ascii?Q?F74+D5V/GaT6/67VA8WmsI2jmda+O9Tq/6mjp3jpp3eEx1UjR3UgnXQlLFzu?=
 =?us-ascii?Q?PBe27LjYerIO50KlcXGQl5WjIzzpz8+0gISycwvDcwgabWzOhikd/sS2T/X7?=
 =?us-ascii?Q?tnbR2wQCBb1XiriGu9w5P+RWdZMEf9AkedqkpS+VB1lQZqdZO6lH61bAXSVk?=
 =?us-ascii?Q?k85oxBDzLKk3hXRHE0W4YR3qXgfQyfW87v5+OPY9AivecW4V/MdSoAGcq5uO?=
 =?us-ascii?Q?B84cuGzOrAeHmX2X6ybDenQ4qWclKtMM8KxJOp2pEKFZH8jfWyuNDub5d+FV?=
 =?us-ascii?Q?miSgJwPVBxxCCzpCV+EzH5Fpo/rRzoW70lVTQ5oo8vsg913li3tl4XMr2kv9?=
 =?us-ascii?Q?qPp+aM30kTsdW9DDX/W6TIISoXscJNRfwLoxwhHvVT+Iy596qGPWXMB8VeHR?=
 =?us-ascii?Q?gl5YAfOkAJ1L2+i9NqNSWJ9RSHaSS5woEVJ53dDa?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6362.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 08899d03-2420-4c79-cc2a-08dddc3f31eb
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Aug 2025 21:03:33.4838 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QYY/UxP39z6Yo1NYC9KgnE5cRod3poCi/m1dOL4HlQUdaRGkdwtHKfWuMA6DYLQT9mDeMHh1E0XCXqw2RVshZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6251
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

> On Tue, Aug 12, 2025 at 11:28:46AM -0700, fei.yang@intel.com wrote:
>> From: Fei Yang <fei.yang@intel.com>
>>
>> Quote BSpec, MI_STORE_DATA_IMM "simply initiates the write operation
>> with command execution proceeding normally. Although the write
>> operation is guaranteed to complete eventually, there is no mechanism
>> to synchronize command execution with the completion (or even
>> initiation) of these operations."
>
> Can we not just use update emit_store_imm_ppgtt_posted to use MI_FLUSH_IM=
M +
> a PPGTT address? I think we can get rid of prior flush added in 3ad7d18c5=
dad7?
>
> According to bspec 45725 for MI_FLUSH_IMM:
>
> 'Usage note: After this command is completed with a Store DWord enabled, =
CPU
> access to graphics memory willbe coherent (assuming the Render Cache flus=
h is
> not inhibited).'

We already have a MI_FLUSH_DW in between the MI_STORE_DATA_IMM and
MI_USER_INTERRUPT (See __emit_job_gen12_simple), but the issue was
still reporduced.

static int emit_flush_imm_ggtt(u32 addr, u32 value, u32 flags, u32 *dw, int=
 i)
{
        dw[i++] =3D MI_FLUSH_DW | MI_FLUSH_DW_OP_STOREDW | MI_FLUSH_IMM_DW =
|
                  flags;
        dw[i++] =3D addr | MI_FLUSH_DW_USE_GTT;
        dw[i++] =3D 0;
        dw[i++] =3D value;

        return i;
}

> Matt
>
>> The KMD currently emit MI_STORE_DATA_IMM and MI_USER_INTERRUPT
>> consecutively to implement user fence. However, according to the
>> BSpec, the data write operation is not guaranteed to be completed when
>> triggering the interrupt, that would cause the
>> xe_wait_user_fence_ioctl to wait until the full user specified timeout
>> is reached before checking the fence value again. Great performance
>> degradation has been observed in IGT xe_exec_fault_mode test cases due
>> to this unnecessary wait. The worst case is that if user set the
>> timeout to MAX_INT32, the wait could end up being a hang until some othe=
r random program triggers a user interrupt to wake it up.
>> A semaphore wait is added right after the data write to avoid the
>> unexpected wait.
>>
>> Signed-off-by: Fei Yang <fei.yang@intel.com>
>> ---
>>  drivers/gpu/drm/xe/instructions/xe_mi_commands.h | 11 +++++++++++
>>  drivers/gpu/drm/xe/xe_ring_ops.c                 | 14 ++++++++++++++
>>  2 files changed, 25 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/instructions/xe_mi_commands.h
>> b/drivers/gpu/drm/xe/instructions/xe_mi_commands.h
>> index c47b290e0e9f..1c9e7b35c665 100644
>> --- a/drivers/gpu/drm/xe/instructions/xe_mi_commands.h
>> +++ b/drivers/gpu/drm/xe/instructions/xe_mi_commands.h
>> @@ -34,6 +34,17 @@
>>  #define MI_FORCE_WAKEUP                     __MI_INSTR(0x1D)
>>  #define MI_MATH(n)                  (__MI_INSTR(0x1A) | XE_INSTR_NUM_DW=
((n) + 1))
>>
>> +#define MI_SEMAPHORE_WAIT           (__MI_INSTR(0x1c) | XE_INSTR_NUM_DW=
(5))
>> +#define   MI_SEMAPHORE_REGISTER_POLL        REG_BIT(16)
>> +#define   MI_SEMAPHORE_POLL         REG_BIT(15)
>> +#define   MI_SEMAPHORE_COMP_OP              GENMASK(14, 12)
>> +#define   MI_SEMAPHORE_SAD_GT_SDD   REG_FIELD_PREP(MI_SEMAPHORE_COMP_OP=
, 0)
>> +#define   MI_SEMAPHORE_SAD_GTE_SDD  REG_FIELD_PREP(MI_SEMAPHORE_COMP_OP=
, 1)
>> +#define   MI_SEMAPHORE_SAD_LT_SDD   REG_FIELD_PREP(MI_SEMAPHORE_COMP_OP=
, 2)
>> +#define   MI_SEMAPHORE_SAD_LTE_SDD  REG_FIELD_PREP(MI_SEMAPHORE_COMP_OP=
, 3)
>> +#define   MI_SEMAPHORE_SAD_EQ_SDD   REG_FIELD_PREP(MI_SEMAPHORE_COMP_OP=
, 4)
>> +#define   MI_SEMAPHORE_SAD_NEQ_SDD  REG_FIELD_PREP(MI_SEMAPHORE_COMP_OP=
, 5)
>> +
>>  #define MI_STORE_DATA_IMM           __MI_INSTR(0x20)
>>  #define   MI_SDI_GGTT                       REG_BIT(22)
>>  #define   MI_SDI_LEN_DW                     GENMASK(9, 0)
>> diff --git a/drivers/gpu/drm/xe/xe_ring_ops.c
>> b/drivers/gpu/drm/xe/xe_ring_ops.c
>> index 5f15360d14bf..189e764e3914 100644
>> --- a/drivers/gpu/drm/xe/xe_ring_ops.c
>> +++ b/drivers/gpu/drm/xe/xe_ring_ops.c
>> @@ -169,6 +169,20 @@ static int emit_store_imm_ppgtt_posted(u64 addr, u6=
4 value,
>>      dw[i++] =3D upper_32_bits(addr);
>>      dw[i++] =3D lower_32_bits(value);
>>      dw[i++] =3D upper_32_bits(value);
>> +    dw[i++] =3D MI_SEMAPHORE_WAIT |
>> +              MI_SEMAPHORE_POLL |
>> +              MI_SEMAPHORE_SAD_EQ_SDD;
>> +    dw[i++] =3D lower_32_bits(value);
>> +    dw[i++] =3D lower_32_bits(addr);
>> +    dw[i++] =3D upper_32_bits(addr);
>> +    dw[i++] =3D 0;
>> +    dw[i++] =3D MI_SEMAPHORE_WAIT |
>> +              MI_SEMAPHORE_POLL |
>> +              MI_SEMAPHORE_SAD_EQ_SDD;
>> +    dw[i++] =3D upper_32_bits(value);
>> +    dw[i++] =3D lower_32_bits(addr + 4);
>> +    dw[i++] =3D upper_32_bits(addr);
>> +    dw[i++] =3D 0;
>>
>>      return i;
>>  }
>> --
>> 2.43.0
>>
