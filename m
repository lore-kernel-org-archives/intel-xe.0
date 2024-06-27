Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05C97C30653
	for <intel-xe@archiver.kernel.org>; Thu, 27 Jun 2024 00:14:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A816A10E004;
	Thu, 27 Jun 2024 00:14:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SGPbR+ih";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42D0010E004
 for <intel-xe@lists.freedesktop.org>; Thu, 27 Jun 2024 00:14:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719447242; x=1750983242;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=XAL3rrYs1jG70kSDCs+EvDoVe7QAJvjS3xZIq3yPwEM=;
 b=SGPbR+ihjm7MrbNH+7DExT9KizIbWLgIuL11VsbTayNOEBz3kAWEFpsc
 VwAVstiGRGOxcPUEUEJy9YtlzcR0BaomNVV7+6Yh1HSu2tppv6hbS9WHu
 K6RupWmNDP1YXiOfdYK8k5pRAblQ8Id5fQHtkVl1PiIJ2vyHp78e4UoYj
 W+Y/KZ6JDhUZICeIOeezpXAlTa7AkoRxFS+zHpt7awYVBLE+sXUDhYyGI
 zu9UK8KTpCRKrshWI2jOLVenMPNKXwrPazchEf7xbKk/j2sHeqGH3QSfy
 rUn/QNAQMqzRs5MyqAVUwXUZJUg/YdYjK7LW9X7ehUUsr3JJjrsgEFTei Q==;
X-CSE-ConnectionGUID: WpjfPU+fShmE7VX4eG6hoQ==
X-CSE-MsgGUID: 4ZZusXGxRbeZj21bXtUZoQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11115"; a="12268188"
X-IronPort-AV: E=Sophos;i="6.08,268,1712646000"; d="scan'208";a="12268188"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2024 17:14:01 -0700
X-CSE-ConnectionGUID: ZYVl4BPxSACimfxlB/OQhw==
X-CSE-MsgGUID: XF4DwI8sTLmyCPubVM+0VQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,268,1712646000"; d="scan'208";a="44293519"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Jun 2024 17:14:01 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 26 Jun 2024 17:14:01 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 26 Jun 2024 17:14:00 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 26 Jun 2024 17:14:00 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 26 Jun 2024 17:14:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LkDE+De2OrfYa1nJ87Lor1/HxXyv6teHtLiFwPeA/tidjm0h5C20TiP7YOqOToNr2IDylYHz09hWxp+6H87brXJvUN9tLfGFkuCEzNfYiyZb0FlFWyv0fsSc2bve+jOCzxjI/l2Mxy5EmKTH9pQdj2G0uAnZ7QtrA/cLP3VxlxnWlHDiVeYdgrm41LTkQHQR94yWK61IoRgO6izGyYKzFilR6uJz7FipJkf3Q9K7Zk3ogrflrEtqFAwPBWMTJ7PvhfUWYJFFqkVP1RLeDS2LN4WJxpF+cHLWhv9G/O6kAtM89oSYUgKKkHPFP+MxzVSZinkbHPJSodeKz0XAeIfstg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XAL3rrYs1jG70kSDCs+EvDoVe7QAJvjS3xZIq3yPwEM=;
 b=NjQuK4YOv/Q5AiYZxx/8RwdpTKcUJTnQtpvAcHUA1Xyqz4vgv+6epfj453xmxBO23zlM6dQPQStUWE9IrKa9i/YxnNobxEuQM7S62qae0vmwmm4zTqEn6fCbcvxlzCjzPhsccChKVrGbBtKOqPJA7aad7nao1dI8D7K2NDV2EG6jCN+cSx51O9Abk9j8LsPm+TjIGRZPDd502FvGKNfSNPwXaiYsukNRYcsAZBU1AaHlVxB94qBY3wUnOOJAM1s7/QpIr8NHpdFu8RGiYe5YfkpztLdWxBN2rNyoTwIo0Vmql9Tq1EGVvCW+nYjuCnxns/knwDzGtRSpGIIWQKGaTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5751.namprd11.prod.outlook.com (2603:10b6:8:12::16) by
 PH7PR11MB7516.namprd11.prod.outlook.com (2603:10b6:510:275::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7698.32; Thu, 27 Jun 2024 00:13:52 +0000
Received: from DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::4046:430d:f16c:b842]) by DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::4046:430d:f16c:b842%3]) with mapi id 15.20.7698.025; Thu, 27 Jun 2024
 00:13:52 +0000
From: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>
To: "Dong, Zhanjun" <zhanjun.dong@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v11 1/5] drm/xe/guc: Prepare GuC register list and update
 ADS size for error capture
Thread-Topic: [PATCH v11 1/5] drm/xe/guc: Prepare GuC register list and update
 ADS size for error capture
Thread-Index: AQHaxoEcPtACKEQcUUm1zdnfq0KYg7HawMMA
Date: Thu, 27 Jun 2024 00:13:52 +0000
Message-ID: <81cfebe69df10f62992cac555ca85801b63afa27.camel@intel.com>
References: <20240624215404.3213075-1-zhanjun.dong@intel.com>
 <20240624215404.3213075-2-zhanjun.dong@intel.com>
In-Reply-To: <20240624215404.3213075-2-zhanjun.dong@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5751:EE_|PH7PR11MB7516:EE_
x-ms-office365-filtering-correlation-id: 434f3181-2a60-4f90-4e99-08dc963e06a5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?N0VmQWpkMnA5LzRSU0MweWd5WWIyVEVYajdBQ3BZNmRtb0EzRHpxaE9zeWQw?=
 =?utf-8?B?K1NjZGVkM0xvQXZ1ekh1aFJranY3WXlpL2p5VS9FK3dNdXJQejZqR3VONW5Z?=
 =?utf-8?B?empWclZyYlFEK0JmbFNUSW0yc0EvTTEyVGN4a1N4N3ZTUmRnYy9PYXRIUDZZ?=
 =?utf-8?B?OXdGRnY2aExmM1VtVTNjcjhRYVpTTHM3OGsrUm5yV3dZMThndFhZNGV3Tk9r?=
 =?utf-8?B?V3Uwc2F3d0FWQzEzV3gvZWxuQitFc3hKWjhlQnZFRk5sZ01uNXJDKzdDS3Fi?=
 =?utf-8?B?bWQ2a09NNHB1QlIzRmE2eVVMY0lQUy9rMzZyV2tOVzdxVUltdjNOclp0WEZr?=
 =?utf-8?B?NEZZVTdHNVFBbjljUnNRQ2xTVHRyaEJXYzVGRm1rcnpYWmJXaHppRlVSakln?=
 =?utf-8?B?eVdmblJvNktIOVk3OVA2NlZZQTNMRWh1N3dENDVTRmJ6UG9rNWxzWDF1ZkQ0?=
 =?utf-8?B?Zk5MazFWbm1rMHNyWkFDbkZhZWlrdEl4amtpZm5EY0htNi96M2Q0eFFBWkVo?=
 =?utf-8?B?eUYySlJObG1ReXhaNERpWHJtSVlpd1FjZkZFV1o2Qk1CVVBJNnBmOGI5eWM1?=
 =?utf-8?B?V1FaQnhIdTI3WFJTUE5ONmNkS2haVWxYMU90d1RRS0lsTHZBM3RXMk9nOVJS?=
 =?utf-8?B?SS9ZM2c5NnNFUTl2bUFBSS8rTXhKNkxxM0JLSkc3T0hmN2JSYktGZU5JTmc4?=
 =?utf-8?B?ckNOOWw4amNycVNnZSt5cjAvWEpxbk9RRjMvaVVwNGRoc29NWVdkaGVyTmlm?=
 =?utf-8?B?bUlzb290c1RBazhUN3UyMzBoRGlMT0xQeU1ZaGFneXE5N1B6QU5ST210ak1j?=
 =?utf-8?B?OVdtcUtsVEswV05SMVhjdWxoMk5mdmVJQUhKajNIei9RQzBUYm1RdU5aemds?=
 =?utf-8?B?S2N3eFF3amoyKytndTgwOEpTOVNZUWhGaW03SEV0UDd0aUVveWlocGMvdnVp?=
 =?utf-8?B?RnlNelMyc2tzdnZ4SUJ0L2cvM1htZHNTZkp4eUlWMVpoaFltU3JiWWIwbFo0?=
 =?utf-8?B?ZS9CR0VIMG9GVUQ0OXdZNXNFcUZ0Rm80WlNrUG1lWWMvY252ZTczNmdmc3d5?=
 =?utf-8?B?S2c4ODMzUUgvNmRzeXJwcGhPVENNSGRKakJ0UmgyME10MXVzeGZBcWFFNm1F?=
 =?utf-8?B?NUpOTDFTSjdOVVJ4TmdEZnk2UDNQTmdtWTlyMmpUaWNnUTRHdm9CUlZyRHhN?=
 =?utf-8?B?M3UvMm93T2hUYnY5Yi9ueitWK0RQSDEvVzVoMVVLRU5pWmNCK05FUXRqcGN3?=
 =?utf-8?B?ZFg1U3lHOUFTdjlsa0NJMklGZjRYeGlKQWxxVmJhZXBNRVF6KzJnNFNMZG9l?=
 =?utf-8?B?KytMZ1kybGxvOWdHMktZa1g5MlJsM0UwcGV2YmJROG82V2FsNUlLVGVWTVRV?=
 =?utf-8?B?dTdtYlFkUW41NjVqZy9FL3Vlc0xYSktBOUJGYVgxMkFPVHJZVk40V1BPdmpR?=
 =?utf-8?B?M1l2S1JXbHd5RTd3M3JBMUhaYjhUWTBVczRTT096ZWQxL2lGaS9NRFIwVGtQ?=
 =?utf-8?B?Sm9MdVh1WFg5dEJFZFZKSGsvMzhVQXAxZW9mY05ZT0xkTUg3SUl5WEFXVlJw?=
 =?utf-8?B?R3V4WEVQTnhiUXhzVkFlYTVoOGM1cDlLZFA3SklzU2lGbHo1Unc4cXJaWjBs?=
 =?utf-8?B?cTdYWisxRmM1MGRBL2hHOGNSS2thTjh1OWpYQk16dGVXbUFEbmU1enhodzRj?=
 =?utf-8?B?eXFuRFI5aFo5ZndMVFB1bUpKaW9ZN0tsVm1LcU5NakRtMkU1S21OaVY2ekFG?=
 =?utf-8?B?SnM3RW5JWVFCV01zNW95aWhQRFBwQ3pmRjAvWWtFcmEveCtiUmRoQjZaYlU0?=
 =?utf-8?Q?HPS557fP9sWsPzJoYItd9G7myWGViQY97EUgk=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5751.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZW42ZmV1dGxXWGtvVE0vektvVWcydEFVcDlMZzFGRmp6Zm5wdGxzMlY5ZEpx?=
 =?utf-8?B?TXZqSjZtaHFHT3c2Ni9SbUJ4WG9ua3F2THh6cWtQblMzQ3YzWVlVbzMxM1V6?=
 =?utf-8?B?MGNZYU5XcHhzR0lzb0FqeVpvNmdkYVl6c0k3dVZLbzY5OWQ2ZllGSTlEMGpp?=
 =?utf-8?B?YlhDMkdQU0tLaXBrTGpIeUltV2xwM0dlTjBWOTN4YXJvOVRZWXVNNGtHSFcz?=
 =?utf-8?B?UThnTEt4bHpmVnVyRkEyY2ZLWExjQTU2RVNwdVkrSlFZNEY1UTJGWWM4NmhY?=
 =?utf-8?B?NEF2eWlVakgyQUhWZjZMLzE1cWgzR2YxUGk0QU9tSWVwdzJnNm9KbUFMV0h1?=
 =?utf-8?B?UldpdDRCOThXRUdSbm1yNEVzalJhVGZOYVBKdHdhL01vM2Zsd1FNNDRTdFpZ?=
 =?utf-8?B?Qm5qaXA4U3hoMXM3K2o5M3dHemZBdzEwVHc2V3dnL3E1Y2JySWE4alZpZlJT?=
 =?utf-8?B?NE96bDQ2QVY0VzhoeGNjWFlmeTI1TkZMVDI2dHVhN3l6ZXlHaGx1enhYNFJ6?=
 =?utf-8?B?N2krZWpxRWxORm9SQnBNQlU4WVFvMDdzSXNKdmd1Z213NmJWRUlyakZWWGhl?=
 =?utf-8?B?aVluM1RQbmdRMFRkdU5WVGJPdDAzejNSK1JPaldOV210OU9pcXRZM3NSbDha?=
 =?utf-8?B?ZThSMEdCQWNVdjFIMnJBdkJJNjJtdXV4d2U0ZVJaam5wOVFPN0R5d1E1dG5a?=
 =?utf-8?B?TkVqY3BrejE2ZEFWazk0cTAyUC94L3UxMS9GdEY3T241a1VoUFFFcm5IcnA1?=
 =?utf-8?B?MSs0eHRWTjZWSWhuTlJVN3pRWnVuTzZaWTR2QjNMQnlnU3oyVW1MSHB0VU5k?=
 =?utf-8?B?QUhJMUN4SkEzNEVlWFd6RFBxY09NRE1ib3U0OHBkWTBPZ285d2NrYSswa05E?=
 =?utf-8?B?WmlKMkZpN2pyaTk1Q216NUMxakd1enJrL2RNaS9acWJDS2VVRmM1NDRLdlR5?=
 =?utf-8?B?K1NlRVVXVUZRZHlLTUtxeXRCN0swMWV2cS9RVjJqZkFNb0lHZHZhaXE4b1I2?=
 =?utf-8?B?ZEVPS1VlQ2dxY3JIOVF0QzVnMjY5cGZBSHR1YVlrYnZDdzBSOUZXbGh3bXJL?=
 =?utf-8?B?d280aHcxWFkxVXlqN3dmQUQ2enIrdHJhZEI1MHpLQ0hlVnhKZUQ2eXE2dGxK?=
 =?utf-8?B?OE5RU1pya0pFT1UwTkZpQlkzeU1CcTB3VC9MT0k4MVdTa3YzWGlvVFpwbWh2?=
 =?utf-8?B?RUtKMGttdXhtc2ZuU1RCUnZBWmUwYXcrQkduamZLemd2NldPK3V5bW9WZnIv?=
 =?utf-8?B?bWcvVGxWSDVCdUNsZHJxZWE5emlYbHJtNkNHWG5ZbmZCU1M3TUVPODc2T1Y4?=
 =?utf-8?B?aC8wWFQrbmY0dmp1V2tSM2hUOHowelVrbW1MWTJyRi9rTDhxekwySERISy9P?=
 =?utf-8?B?dm0zeitieTNIUTBXc1k3cTdjUU9WT3VtbWllamhDOVplWnF5dkhGNTBwekZC?=
 =?utf-8?B?MlZYb3J5OXJDMFJDMXNmUUdnOGZtQ2J4cDBwajJiMlcwTVBQSEpLeDJ1VFFo?=
 =?utf-8?B?TDJGZ1VCcGwxN1VBV09tZDA4M01zNDlTRjNzSVlmanhkMG5xRjYrQ0I3U21E?=
 =?utf-8?B?VEJGc3p3cm5Kei9CRUU3ejVzR3lZK1BHV0lyT2FGT28vak85Y1M1T3hzblps?=
 =?utf-8?B?NTZ6d0FNeGtrMFliS0RiSWpJS3U0RWRkeUZ2YlJyZmJtNVdMbkNGeVJyZlU4?=
 =?utf-8?B?NjBubHRrKzEzeDJBNmJTdzVCWkhwTVd4WVE3SWNJMEZkT3JLcXFvQzN5N2NT?=
 =?utf-8?B?bHJUMUJsQ3RSakhyWmxxR3lvV1lVS2o0VHhpSWd3WTh2UEdWU0RnQ21KUG1s?=
 =?utf-8?B?TFpBRk50ZnQ5aHhRbzZxclNUK1BOSFlyK0NWM0JxKzJjaC84OU9OeDlrRnNN?=
 =?utf-8?B?Z2sySXVLOEtDYTRLR0J0cGV1aDZNMXl0RVkxQU13aEpVQ3I2VkRtN1ZiSGhL?=
 =?utf-8?B?UmUzazZpdURVdmJuNDNJTG5iK1JHRFlJRWhQVGd2TVMwaElPZ21zRDhNOUtP?=
 =?utf-8?B?NlYrcHVWYzUzZTlvdlhsNzJlaHBaMkhUN0J2ZXVxNWdLZDRtcFdTVXdHZHRK?=
 =?utf-8?B?V09kOXpocWhlbUN1Vi8xeDdtbGVuWk5hY3R5Z1BLWStmTkdPM1JoMmlhSFZp?=
 =?utf-8?B?ODg0WkdEUlBmcUYxdVFVYUpubEJ2aERqcE1EMWpCNDcyeFdLdFNFQnptcUsw?=
 =?utf-8?Q?6iq3yu0sVyJ/0WHV8vleZuE=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <6A118BDE1306844699E53A1EBD041D18@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5751.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 434f3181-2a60-4f90-4e99-08dc963e06a5
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jun 2024 00:13:52.3347 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: acvc+J7EXprrZIWwAXMl89e6uTaCMFVjcenvQDVOzIN5QWQX7hfRurl+7JK7Fxqnb6SFDuA5qBNSiyRYxu2YsCfYWFIPtMp2zf9K9K5XoLihlcfu3pX7WGthEd9lDmkX
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7516
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

DQpIaSBaaGFuanVuLCBpIHNlZSB5b3UgYWRkcmVzc2VkIGV2ZXJ5dGhpbmcgaSBjb21tZW50ZWQg
b24gaW4gcmV2OCBhcw0Kd2VsbCBhcyBldmVyeXRoaW5nIHRoYXQgTWljaGFsIGNvbW1lbnRlZCBv
biBpbiByZXY5IChleGNlcHQgb25lIHdoaWNoDQp3YXNudCBhbiBpc3N1ZSBidXQgd2FzIGJ5IGRl
c2lnbikuDQoNCkFsdGhvdWdoIEkgc3RpbGwgZm91bmQgY291cGxlIG9mIHRoZSBpc3N1ZXMgd2hp
Y2ggYXJlIG5vdCBuaXRzLCB0aGV5DQphcmUgdmVyeSB0cml2aWFsIHNvIGknbSBnaXZpbmcgYSBj
b25kaXRpb25hbCBSQiBmb3IgdGhlIGNvbW1lbnRzIGkNCnByZWZpeGVkIHdpdGggInJiLWNvbmRp
dGlvbiIuDQoNClJldmlld2VkLWJ5OiBBbGFuIFByZXZpbiA8YWxhbi5wcmV2aW4udGVyZXMuYWxl
eGlzQGludGVsLmNvbT4NCg0KT24gTW9uLCAyMDI0LTA2LTI0IGF0IDE0OjU0IC0wNzAwLCBaaGFu
anVuIERvbmcgd3JvdGU6DQo+IEFkZCByZWZlcmVuY2VkIHJlZ2lzdGVycyBkZWZpbmVzIGFuZCBs
aXN0IG9mIHJlZ2lzdGVycy4NCj4gVXBkYXRlIEd1QyBBRFMgc2l6ZSBhbGxvY2F0aW9uIHRvIGlu
Y2x1ZGUgc3BhY2UgZm9yDQo+IHRoZSBsaXN0cyBvZiBlcnJvciBzdGF0ZSBjYXB0dXJlIHJlZ2lz
dGVyIGRlc2NyaXB0b3JzLg0KPiANCj4gDQphbGFuOnNuaXANCj4gLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL3hlL3hlX2d1Y19hZHMuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3VjX2Fk
cy5jDQo+IEBAIC0xOCw2ICsxOCw4IEBADQo+IMKgI2luY2x1ZGUgInhlX2d0X2Njc19tb2RlLmgi
DQo+IMKgI2luY2x1ZGUgInhlX2d0X3ByaW50ay5oIg0KPiDCoCNpbmNsdWRlICJ4ZV9ndWMuaCIN
Cj4gKyNpbmNsdWRlICJ4ZV9ndWNfY2FwdHVyZS5oIg0KPiArI2luY2x1ZGUgInhlX2d1Y19jYXB0
dXJlX3R5cGVzLmgiDQo+IMKgI2luY2x1ZGUgInhlX2d1Y19jdC5oIg0KPiDCoCNpbmNsdWRlICJ4
ZV9od19lbmdpbmUuaCINCj4gwqAjaW5jbHVkZSAieGVfbHJjLmgiDQo+IEBAIC0xMjcsNiArMTI5
LDggQEAgc3RydWN0IF9fZ3VjX2Fkc19ibG9iIHsNCj4gwqAjZGVmaW5lIGluZm9fbWFwX3JlYWQo
eGVfLCBtYXBfLCBmaWVsZF8pIFwNCj4gwqDCoMKgwqDCoMKgwqDCoHhlX21hcF9yZF9maWVsZCh4
ZV8sIG1hcF8sIDAsIHN0cnVjdCBndWNfZ3Rfc3lzdGVtX2luZm8sDQo+IGZpZWxkXykNCj4gwqAN
Cj4gK3N0YXRpYyBpbnQgZ3VjX2NhcHR1cmVfcHJlcF9saXN0cyhzdHJ1Y3QgeGVfZ3VjX2FkcyAq
YWRzKTsNCmFsYW46bml0OiBJIHRoaW5rIHlvdSBkb24ndCBuZWVkIHRoaXMgcHJvdG90eXBlIGRl
ZmluaXRpb24gaGVyZSBub3c/DQoNCg0KDQphbGFuOnNuaXANCg0KPiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL3hlL3hlX2d1Y19jYXB0dXJlX3R5cGVzLmgNCj4gYi9kcml2ZXJzL2dwdS9k
cm0veGUveGVfZ3VjX2NhcHR1cmVfdHlwZXMuaA0KPiBuZXcgZmlsZSBtb2RlIDEwMDY0NA0KPiBp
bmRleCAwMDAwMDAwMDAwMDAuLmIyZTc4YWI1M2UyZQ0KDQphbGFuOnNuaXANCj4gLS0tIC9kZXYv
bnVsbA0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3VjX2NhcHR1cmVfdHlwZXMuaA0K
PiBAQCAtMCwwICsxLDgwIEBADQo+ICsvKiBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogTUlUICov
DQo+ICsvKg0KPiArICogQ29weXJpZ2h0IMKpIDIwMjQgSW50ZWwgQ29ycG9yYXRpb24NCj4gKyAq
Lw0KPiArDQo+ICsjaWZuZGVmIF94ZV9ndWNfY2FwdHVyZV90eXBlc19IDQo+ICsjZGVmaW5lIF94
ZV9ndWNfY2FwdHVyZV90eXBlc19IDQphbGFuOiBbcmItY29uZGl0aW9uXSB0aGlzIHNob3VsZCBi
ZSBhbGwgY2Fwcywgbm8/DQo+ICsNCj4gKyNpbmNsdWRlIDxsaW51eC90eXBlcy5oPg0KPiArDQph
bGFuOnNuaXANCg0KPiArwqDCoMKgwqDCoMKgwqAvKioNCj4gK8KgwqDCoMKgwqDCoMKgICogQGNh
Y2hlbGlzdDogUG9vbCBvZiBwcmUtYWxsb2NhdGVkIG5vZGVzIGZvciBlcnJvciBjYXB0dXJlDQo+
IG91dHB1dA0KPiArwqDCoMKgwqDCoMKgwqAgKg0KPiArwqDCoMKgwqDCoMKgwqAgKiBXZSBuZWVk
IHRoaXMgcG9vbCBvZiBwcmUtYWxsb2NhdGVkIG5vZGVzIGJlY2F1c2Ugd2UgY2Fubm90DQo+ICvC
oMKgwqDCoMKgwqDCoCAqIGR5bmFtaWNhbGx5IGFsbG9jYXRlIG5ldyBub2RlcyB3aGVuIHJlY2Vp
dmluZyB0aGUgRzJIDQo+IG5vdGlmaWNhdGlvbg0KPiArwqDCoMKgwqDCoMKgwqAgKiBiZWNhdXNl
IHRoZSBldmVudCBoYW5kbGVycyBmb3IgYWxsIEcySCBldmVudC1wcm9jZXNzaW5nIGlzDQo+IGNh
bGxlZA0KPiArwqDCoMKgwqDCoMKgwqAgKiBieSB0aGUgY3QgcHJvY2Vzc2luZyB3b3JrZXIgcXVl
dWUgYW5kIHdoZW4gdGhhdCBxdWV1ZSBpcw0KPiBiZWluZw0KPiArwqDCoMKgwqDCoMKgwqAgKiBw
cm9jZXNzZWQsIHRoZXJlIGlzIG5vIGFic29sdWF0ZSBndWFyYW50ZWUgdGhhdCB3ZSBhcmUgbm90
DQo+IGluIHRoZQ0KPiArwqDCoMKgwqDCoMKgwqAgKiBtaWRzdCBvZiBhIEdUIHJlc2V0IG9wZXJh
dGlvbiAod2hpY2ggZG9lc24ndCBhbGxvdw0KPiBhbGxvY2F0aW9ucykuDQo+ICvCoMKgwqDCoMKg
wqDCoCAqLw0KPiArwqDCoMKgwqDCoMKgwqBzdHJ1Y3QgbGlzdF9oZWFkIGNhY2hlbGlzdDsNCmFs
YW46IFtyYi1jb25kaXRpb25dIHBsZWFzZSBtb3ZlIHRoZSBpbnRyb2R1Y3Rpb24gb2YgY2FjaGVs
aXN0IHRvIHRoZQ0KcGF0Y2ggd2hlcmUgaXRzIGFjdHVhbGx5IGdldHRpbmcgaW5pdGlhbGl6ZWQg
YW5kIHVzZWQgKGV4dHJhY3Rpb24NCnBhdGNoLCByaWdodD8pDQo+ICsjZGVmaW5lIFBSRUFMTE9D
X05PREVTX01BWF9DT1VOVCAoMyAqIEdVQ19NQVhfRU5HSU5FX0NMQVNTRVMgKg0KPiBHVUNfTUFY
X0lOU1RBTkNFU19QRVJfQ0xBU1MpDQo+ICsjZGVmaW5lIFBSRUFMTE9DX05PREVTX0RFRkFVTFRf
TlVNUkVHUyA2NA0KPiArDQo+ICvCoMKgwqDCoMKgwqDCoC8qKg0KPiArwqDCoMKgwqDCoMKgwqAg
KiBAbWF4X21taW9fcGVyX25vZGU6IE1heCBNTUlPIHBlciBub2RlLg0KPiArwqDCoMKgwqDCoMKg
wqAgKi8NCj4gK8KgwqDCoMKgwqDCoMKgaW50IG1heF9tbWlvX3Blcl9ub2RlOw0KPiArDQo+ICvC
oMKgwqDCoMKgwqDCoC8qKg0KPiArwqDCoMKgwqDCoMKgwqAgKiBAb3V0bGlzdDogUG9vbCBvZiBw
cmUtYWxsb2NhdGVkIG5vZGVzIGZvciBlcnJvciBjYXB0dXJlDQo+IG91dHB1dA0KPiArwqDCoMKg
wqDCoMKgwqAgKg0KPiArwqDCoMKgwqDCoMKgwqAgKiBBIGxpbmtlZCBsaXN0IG9mIHBhcnNlZCBH
dUMgZXJyb3ItY2FwdHVyZSBvdXRwdXQgZGF0YQ0KPiBiZWZvcmUNCj4gK8KgwqDCoMKgwqDCoMKg
ICogcmVwb3J0aW5nIHdpdGggZm9ybWF0dGluZyB2aWEgeGVfZGV2Y29yZWR1bXAuIEVhY2ggbm9k
ZSBpbg0KPiB0aGlzIGxpbmtlZCBsaXN0IHNoYWxsDQo+ICvCoMKgwqDCoMKgwqDCoCAqIGNvbnRh
aW4gYSBzaW5nbGUgZW5naW5lLWNhcHR1cmUgaW5jbHVkaW5nIGdsb2JhbCwgZW5naW5lLQ0KPiBj
bGFzcyBhbmQNCj4gK8KgwqDCoMKgwqDCoMKgICogZW5naW5lLWluc3RhbmNlIHJlZ2lzdGVyIGR1
bXBzIGFzIHBlcg0KPiBndWNfY2FwdHVyZV9wYXJzZWRfb3V0cHV0X25vZGUNCj4gK8KgwqDCoMKg
wqDCoMKgICovDQo+ICvCoMKgwqDCoMKgwqDCoHN0cnVjdCBsaXN0X2hlYWQgb3V0bGlzdDsNCj4g
DQphbGFuOiBbcmItY29uZGl0aW9uXSBwbGVhc2UgbW92ZSB0aGUgaW50cm9kdWN0aW9uIG9mIG91
dGxpc3QgdG8gdGhlDQpwYXRjaCB3aGVyZSBpdHMgYWN0dWFsbHkgZ2V0dGluZyBpbml0aWFsaXpl
ZCBhbmQgdXNlZCAoZXh0cmFjdGlvbg0KcGF0Y2gsIHJpZ2h0PykNCj4gK307DQo+ICsNCg0K
