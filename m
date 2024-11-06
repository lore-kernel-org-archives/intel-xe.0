Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F609D44D58
	for <intel-xe@archiver.kernel.org>; Wed,  6 Nov 2024 13:12:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF9BE10E6F1;
	Wed,  6 Nov 2024 13:12:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ldzQMGvQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D74810E6ED;
 Wed,  6 Nov 2024 13:12:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730898727; x=1762434727;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=oOqX5G5Q8QWBnY8rwwrfI8Wv6Bg5soC7J5xfwYuyTB8=;
 b=ldzQMGvQ/XVNF4Vli0vCW7Udv4eMCrVzJo5XeyRJtXws8Bu+DKWO/Btl
 EqGWS/zOEYikAY1/vScEC8NibAJ2qO0OSBe/fRo7J5RGeYqLrtCpcf14/
 xMjf66B5fNOuJ8ZXo254+sD1LwHyx+E9Qqg4S5syzW/JevYhC6856TqFl
 Dx5DH/eN2WEMUgCjcXVnoMkT09jarZaXtpb2yFttYlyivXcDgDRswgds+
 23yzi/hdgoU07lsBMoafFAqVJXUA5BMquAGJ6Vou7A6GqhBr89LqQ6q4j
 C9e1kGMh6WHvnp4mYmXge+4Xa8nAWnqLAtMcP0EjZ9A00dmBBScO23gfy A==;
X-CSE-ConnectionGUID: /iZDUapTSiKwlOXRxW0BuA==
X-CSE-MsgGUID: JwSmm+v4QtujEwY14pXq6w==
X-IronPort-AV: E=McAfee;i="6700,10204,11248"; a="30108202"
X-IronPort-AV: E=Sophos;i="6.11,262,1725346800"; d="scan'208";a="30108202"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2024 05:12:06 -0800
X-CSE-ConnectionGUID: /4SHvjNbSP21cjPCK0mFSQ==
X-CSE-MsgGUID: UuHUsSc/TG+ci9qbudk49A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="89359494"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Nov 2024 05:12:07 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 6 Nov 2024 05:12:05 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 6 Nov 2024 05:12:05 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.177)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 6 Nov 2024 05:12:05 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K5odFqyy8BnHDvmG0jeimZWBtnaiceVfAsp/1ylaq6HQT15LK1So+eBQHwkv5CKuFAar+NbxLfAxHjph77ejqCuGqhs68eNOt8bEwm/CnRFl40Y0gKhN8jM6U949v4Cg0PA9y4+DPQ+0Sbki8dWQG4356K/Y4P39x0YZcyC+kFiORcssvwSj/FhHP+CgogKtQXvOfyNvKW40LWLeAjiQDyXl2dZGP6IZ/Qq6dyU9P65aHkJWMFmw1x1ujOzJk76CMZZsOM1P2I/I1Nxt7/lwfqp5J2TR/ulOOsJpvYLBSkufuNd0MCxHoGYjnam0lGZH7BmnStsKTkYN76jsElBcaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oOqX5G5Q8QWBnY8rwwrfI8Wv6Bg5soC7J5xfwYuyTB8=;
 b=Ese/fzLw1cbRUIRA0OLo5++uXxXCZHqJdTHp0frvbCx4uWtDz8L76/k42PBj+bWg4OxZa96TX3aC8d93w7ZQ1rIPr/dSIoGX3OMKdl5FfPopOzk6no4wzbVsKkk2uETCdLFkWM1VHLabGYncLNKtqcom1vp5xDYISxE/dgsYIORxA4MdGZ1YIhNh3Nlas71J9o/GQKe3Ccu5+yZruLyuCEzr8E1Krf29yQ/kTKl/7IbICwrIug2RJ3k+Y5AXMN9CFGn1Cm3wAPlFSiMmTwQUdSY3dJAh/cScmOVDClyF8T/JQZyM/shUzh7Jw+cUk8kMub/rZD9zZ+K23Pep19cVxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com (2603:10b6:a03:459::19)
 by SN7PR11MB7042.namprd11.prod.outlook.com (2603:10b6:806:299::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.37; Wed, 6 Nov
 2024 13:12:02 +0000
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::fd8d:bca9:3486:7762]) by SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::fd8d:bca9:3486:7762%6]) with mapi id 15.20.8114.028; Wed, 6 Nov 2024
 13:12:02 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "Auld, Matthew" <matthew.auld@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
Subject: RE: [PATCH i-g-t V2 2/2] tests/intel: Add xe_pci_membarrier test
Thread-Topic: [PATCH i-g-t V2 2/2] tests/intel: Add xe_pci_membarrier test
Thread-Index: AQHbJS+HIpG7fSMbRkWD84eWsQTB1bKigPMAgAe69BCAABRzwA==
Date: Wed, 6 Nov 2024 13:12:02 +0000
Message-ID: <SJ1PR11MB6204DF3E6F9799CC944C420B81532@SJ1PR11MB6204.namprd11.prod.outlook.com>
References: <20241023094327.965050-1-tejas.upadhyay@intel.com>
 <20241023094327.965050-3-tejas.upadhyay@intel.com>
 <33c9d6a1-b8cf-4449-9311-4d57c185e653@intel.com>
 <SJ1PR11MB6204F3272611F49594373C3181532@SJ1PR11MB6204.namprd11.prod.outlook.com>
In-Reply-To: <SJ1PR11MB6204F3272611F49594373C3181532@SJ1PR11MB6204.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6204:EE_|SN7PR11MB7042:EE_
x-ms-office365-filtering-correlation-id: 3b26182c-e78b-485a-549f-08dcfe649ad5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?d28yMTF3VDZsWEFvZmorUGN0Sm5ERmNxeWlKbVdkNnpybVovZEZkL0sveEdS?=
 =?utf-8?B?NGxLajZpNGFVZHVkaWZRWEJaMWpVUGc1eFJSVVNId1djZFZ3N2hIczlDQW5i?=
 =?utf-8?B?Y0dPVmpKSTJ1ZW5qRzhSRUJsdHRLdEdiRzFlYXdPYWhEQVExUGMzQzNKUzhp?=
 =?utf-8?B?R0JMT1ZwRE4rS09QemFiRkpKSTlZazZaeE05cFJsWlRNWXAvdUhRYzZaaUFy?=
 =?utf-8?B?TTh6eStMSXJYc3FpL0lJNDNicmtxZzdFbGd2LzlHdk5YWE5pNWVNZkl5dEll?=
 =?utf-8?B?bEZBc0ZudGdQMkUyOXRxMGZEcHJ6OVJEVDN6TmNRR25YVWxxOWJ4QTRDc1Jh?=
 =?utf-8?B?eGRYcE9vS1l5V2tNblNVU3ljNHllNWxIYktaNW5QZWl5QWhBY2FhWjg3Rm9x?=
 =?utf-8?B?YWNMVEUwcXRBSUorMVR2cHNMZUJzM2l1T3ZhQWlXaW0zbGhybG9nbmZCZXNt?=
 =?utf-8?B?WDBvQjdDZ0hEbm9GRXRmYjZ3dnBEeDBxdmFkMWlGMGcyTkR3WHNJTXA3b2Vq?=
 =?utf-8?B?UmZicHdKTlJNWEY0aHZYTER6ejNXNU80dUlBcDJETUJYU2RwQ0RiQWMxdmRS?=
 =?utf-8?B?cjJoUEdmZFBHaDdRL29YbXl1ZG15VVNWRGNsOEhJZzdpOE8yU3hiY2tLQ1VN?=
 =?utf-8?B?Tzk0NndQMlIwMXRzRnEwa2lpYmNiQmZZK2lqZmNyQ3ZVUnlGZ3hqMHBDRUhP?=
 =?utf-8?B?bCtPZGtndlJzUXM3WU16MGZmMk5iRlVKb2lIbUplSFYyNkFBM2dvMDFjdHBw?=
 =?utf-8?B?YkFZYmNJNGo3WnVkZlAzRXJCaFlYQkpZRE82OWVKQzFKb1JTOFBhcmhNUjI0?=
 =?utf-8?B?R1VtZXNjTnVyYUJNZmZrT25NOEMrMVRtMU9OWjM5ZVRKMlZ3bUJlalVoZnF3?=
 =?utf-8?B?VDFZR1dMQ245cmxJbkE0OFFHaEhhd3RuV3pKTFZUWUNZOHJKNU5RNVNkcDVV?=
 =?utf-8?B?eXAvLytDQ3ZNTkVLVUl2akszeS84dWx1MjhjakphNzdJSDVKSFh0VGdENmt1?=
 =?utf-8?B?am9FeTZLUDlReWhiVW9hamp0ckwvMFhyT1hldGE5K0U2MnZpVnA5WGJJOG13?=
 =?utf-8?B?dzRiZlQ0QnpZOFlSSUMrYlFicStDWHZHYkorMU5qS2tvOW1ZcHUzZVZ5OU9G?=
 =?utf-8?B?TllVZnhrRWtZQnZSRWJjR3RIWG4wV2VKZ0ltaTRsd0xyeEcrL282S1ZnNDFX?=
 =?utf-8?B?ank3MnEzRHh0WFBhNmVKTFJOK1kvZEdmZnl4Q1lQbWlVZGVsZ0pTbE5TeUVL?=
 =?utf-8?B?dVB3UjJ0TWVSZGhYbjFPNkJtN0JURm1JQTBIbHRyVkh3L0taZnBBVWtjVk1K?=
 =?utf-8?B?K2VrZXpielJRWUwrWTNjOGpmVnNYVXRzbnY1UkpxVUJqT3UxRkgyN29HZ1E5?=
 =?utf-8?B?V2RmNE91Vm5ZeUp1enhTTTd3SEVZOVJQUkgrcXUwcGFjckNUMmJaN28wNlk5?=
 =?utf-8?B?WTg2OUlWTko1Q1hLVE5iaElrcEgvcnlwSGRpNFdQVVU3ZHI5d1NDZ3hNU3BC?=
 =?utf-8?B?YzVVQlJBNVJ1aDVCMS9pNWdIQ2w5djkvRFVlOWRtbzRrT1NuRGUxRFhZNm9I?=
 =?utf-8?B?K3J6ZkRIWUs1QVJzRVRqZWNZbmtHektEZHljejk4eGE1ajNaZW10N2pIVkpx?=
 =?utf-8?B?dHBHZW5YalBvdy8zOWNONDQzQ1V6cUNZN2ExTUNQOWhOeHdwV3djTGI4dTFR?=
 =?utf-8?B?V2lEaXBzOFRoaVM4TU1rSGR2ak4wRjA1SlZhM0Y4RzVib3RGS25lL0RsVEFn?=
 =?utf-8?B?c3hFREFkenJHNCtpaElOS28yZ2pDcnJJdTVoTklLNFBuN1hZZks0YkMyTWVx?=
 =?utf-8?Q?cVF8p8SR59p7mMPlkbZaG8DQvjqTEPw3xNt0o=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6204.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?R1NxdHlMcVI5MDdPVjZMcGt3VnBGK3l6RzFiQXRYYUNINGI1RXloVHEzMEpo?=
 =?utf-8?B?VXpQZ1Q1OVp6VVdWMTFqbVhtLzVRcEJVbS9GQXh2NXpxOTIxWU5XNUV0dkNU?=
 =?utf-8?B?M1I1NUo3SnZLN2FIL0wzSTY2UEkxVUxkTG5sRG54bklXQ2NNdEdXb0JTWi9I?=
 =?utf-8?B?QlJXWTQ2c3hudTZDQnBQY2VVWnZWT2toYU9PZWlvYktUNCtKZE9Lb3E4a1B1?=
 =?utf-8?B?WldrbWVZVzBEeFRVa1d5VlJkZVVCZUZSL0IxRmRtaXZOd0l0Zm1LaW9qS3Vl?=
 =?utf-8?B?VUFlWi9rRHp6TU5TUFIvYlBLNXUzRkFiTzBXaTl6MjNJRDMydnM2aG1uK2RJ?=
 =?utf-8?B?UmlTaStvdVl0MHZDN2tHZlBROUQrOUcwcE5HWENBYlE0Mk8yMmxVdmRyMGRZ?=
 =?utf-8?B?RUwwZXIyU2hsMFZPQi9rcmFFODVNRUdtQ1dVbS9ycmcyT2NuZnpZeU5uRElC?=
 =?utf-8?B?OTRhcFFtN3VCK1VFWVRFZFF6VGlSdzAvUnRVaGtQYklRWVV2ZGdrbUtCQkM0?=
 =?utf-8?B?djdFd3NZSDhVMGdOVHJrRldWYkFnRno2L1NKV3FmT2tqT0FyQ0VOdHJ0REY1?=
 =?utf-8?B?RC8wOSs2ZDdxYktkZHZZakRYWlpieFZBb2N3Tk5BWDlTaDV5bTF5d2Y4ZmZU?=
 =?utf-8?B?d1kvU2QrSjlVdngyRUZCS3dXS0JoNXVXUUpiUXJ0L2VoMnNGWGRFY2Z2MUFR?=
 =?utf-8?B?MVR4anRZRVZWVzUzeVdVWUQwUUhQQTdoSFh5TTN1VW9wSlNBWHZXZzN4WFRU?=
 =?utf-8?B?VHNYTHBIQ3l3alNaemVLejJ5dGt4VjBwLzhTQ3E3cHlrZTN5VVFtMmNkclNQ?=
 =?utf-8?B?S2FhM05nOWdtclZ2N0Nua1FURFRBRGpVaUpadzlMN2xGZ0YrQlUwVzBiS0ZN?=
 =?utf-8?B?aDdEcU53RERrbFZQN1Fsa1QweTljQTlUU0FuZ2xtWklNZmFhU2Qvd2xBendX?=
 =?utf-8?B?NWVuM1E0U1RXRCtzYndGd3U5bnZNN0hBYTN5anlyRXUvN2F0a1VHN0dBMU5t?=
 =?utf-8?B?MklWZlZSSWlQcG9VbXd1MmJtRXBTQ05ldDU2MW1oMDBrSWZ6V0g4NTJMSHpC?=
 =?utf-8?B?SzA3K2ZRV2lnNmp3dXg2b1EzZ0hzdzdiMnZ5RC9ibUVvV0FmT0VMemx1eEw5?=
 =?utf-8?B?bHFBWFlVZzg3RFRxUDdBUjZGZkZ5R3hxTmg3SlprNitVZlZ3WFJDRDBldXJs?=
 =?utf-8?B?NFdFNHpqM083K2pvN25oK3QrZWdnU09QaElzUzNCM2FqYjNZUzdIT0xJdFJx?=
 =?utf-8?B?cHdWaGVYNGtMV3lWekliamNxSTFUWjRSK1A5M3VpQS82WW5HdHdVV0ZNK1py?=
 =?utf-8?B?OUtNR2dpK0xKRE01ZlFsWklOd0pDUTg1aVQ4MFVXNmJFd0xVbG9LQW5IU3F6?=
 =?utf-8?B?Lzk1NHBiZEdzeGo4amRZWFZod1NObGY1YWFvYTQ4c0Jrd1BtM3FpTGk3L2dH?=
 =?utf-8?B?QnZaQm5US0Y1TFcwSE5iMXgrei9LNlVqNG0rK05vSlY3K3pzUkEyWHdkdFYw?=
 =?utf-8?B?K1FzS3prazF1LzJldndmOTJOTVE1TUZ5R2JkMGZxUDN0QW82T2J6NDFncTFk?=
 =?utf-8?B?MG5vS2MvN0xNYlNXUTBZZzdZMVB6ckFna25NZjVqbmpHZ2lpc20rSHRnZy9H?=
 =?utf-8?B?TGRyS0xHcXo2YmkyclNoaVUrTDBSdjJ4bkdWMExkdm9XYlZycmpwaTIrWjN6?=
 =?utf-8?B?d3dBeTEzSmhOQUFROEo5amFEMDRUaW1mcGN3SGxaTWpoY0w1MWlzWHNrZ092?=
 =?utf-8?B?Y0xEMkx1NXpoSy9mUFdBMEhUeDczSXp0bzRwK3JOVUFhZ3VmY2UyL0NCWENo?=
 =?utf-8?B?Z3YzeDFCbnFqSG9seWxYS0Q4RXdqSnRBVk8yTFhXeSt3TXBwbVFwaW9FYVha?=
 =?utf-8?B?Ykg5UkdyS2krRE5lcm9lM2lKc25QeDdVZFhzcWxlZTZoVTdURDBMSSt1ZXVK?=
 =?utf-8?B?TllpbHdPVHkvSTBsdGJhcmtTT3JUT0VDSlBhYitGQjg4ZTJNTUtaYjBpN3N4?=
 =?utf-8?B?amlBQlE3cFE4bmhpaUczNHA3dmJBYW5mRjNxd2c4RG1lZDRZdmZEMDNUU3dv?=
 =?utf-8?B?TGlDMUdUelI2TWxqS1BzZTJTS1JxZ3l0OGhsekliZ3gyaFM3MllnblduRVJo?=
 =?utf-8?Q?mZqc/UxOXJXVmUDYXex0Q5yL+?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6204.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b26182c-e78b-485a-549f-08dcfe649ad5
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Nov 2024 13:12:02.7036 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SJ5blgnYOF1h3Ecqogu1bpoEUdl7DWr2f0VKIqYmqOXFagCozNvKx4pzqe/FKEqLV0V5pNmmLTq2yOKIyWCAldiHFkYODS4VBB48ZgJKv7s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7042
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogVXBhZGh5YXksIFRlamFz
DQo+IFNlbnQ6IFdlZG5lc2RheSwgTm92ZW1iZXIgNiwgMjAyNCA1OjMwIFBNDQo+IFRvOiBBdWxk
LCBNYXR0aGV3IDxtYXR0aGV3LmF1bGRAaW50ZWwuY29tPjsgaWd0LWRldkBsaXN0cy5mcmVlZGVz
a3RvcC5vcmc7DQo+IGludGVsLXhlQGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPiBTdWJqZWN0OiBS
RTogW1BBVENIIGktZy10IFYyIDIvMl0gdGVzdHMvaW50ZWw6IEFkZCB4ZV9wY2lfbWVtYmFycmll
ciB0ZXN0DQo+IA0KPiANCj4gDQo+ID4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gPiBG
cm9tOiBBdWxkLCBNYXR0aGV3IDxtYXR0aGV3LmF1bGRAaW50ZWwuY29tPg0KPiA+IFNlbnQ6IEZy
aWRheSwgTm92ZW1iZXIgMSwgMjAyNCA3OjI1IFBNDQo+ID4gVG86IFVwYWRoeWF5LCBUZWphcyA8
dGVqYXMudXBhZGh5YXlAaW50ZWwuY29tPjsgaWd0LQ0KPiA+IGRldkBsaXN0cy5mcmVlZGVza3Rv
cC5vcmc7IGludGVsLXhlQGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPiA+IFN1YmplY3Q6IFJlOiBb
UEFUQ0ggaS1nLXQgVjIgMi8yXSB0ZXN0cy9pbnRlbDogQWRkIHhlX3BjaV9tZW1iYXJyaWVyDQo+
ID4gdGVzdA0KPiA+DQo+ID4gT24gMjMvMTAvMjAyNCAxMDo0MywgVGVqYXMgVXBhZGh5YXkgd3Jv
dGU6DQo+ID4gPiBXZSB3YW50IHRvIG1ha2Ugc3VyZSB0aGF0IGRpcmVjdCBtbWFwIG1hcHBpbmcg
b2YgcGh5c2ljYWwgcGFnZSBhdA0KPiA+ID4gZG9vcmJlbGwgc3BhY2UgYW5kIHdob2xlIHBhZ2Ug
aXMgYWNjZXNzaWJsZSBpbiBvcmRlciB0byB1c2UgcGNpDQo+ID4gPiBtZW1vcnkgYmFycmllciBl
ZmZlY3QgZWZmZWN0aXZlbHkuDQo+ID4gPg0KPiA+ID4gVGhpcyBpcyBiYXNpYyBwY2kgbWVtb3J5
IGJhcnJpZXIgdGVzdCB0byBzaG93Y2FzZSB4ZSBkcml2ZXIgc3VwcG9ydA0KPiA+ID4gZm9yIGZl
YXR1cmUuIEluIGZvbGxvdyB1cCBwYXRjaGVzIHdlIHdpbGwgaGF2ZSBtb3JlIG9mIGNvcm5lciBh
bmQNCj4gPiA+IG5lZ2F0aXZlIHRlc3RzIGFkZGVkIGxhdGVyLg0KPiA+ID4NCj4gPiA+IFNpZ25l
ZC1vZmYtYnk6IFRlamFzIFVwYWRoeWF5IDx0ZWphcy51cGFkaHlheUBpbnRlbC5jb20+DQo+ID4g
PiAtLS0NCj4gPiA+ICAgdGVzdHMvaW50ZWwveGVfcGNpX21lbWJhcnJpZXIuYyB8IDgwDQo+ID4g
PiArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysNCj4gPg0KPiA+IENvdWxkIHByb2Jh
Ymx5IGp1c3QgcGxvbmsgdGhpcyBpbiB0aGUgZXhpc3RpbmcgbW1hcCBvZmZzZXQgdGVzdHMgZmls
ZT8NCj4gDQo+IEkgdHJpZWQgdGhpcywgYnV0IGxvb2tzIGxpa2Ugbm9uZSBvZiBleGlzdGluZyBt
ZXRob2RzIHdoaWNoIGFyZSB1c2luZyBiby1jcmVhdGUNCj4gbG9va3MgcmVsYXRlZCB0byB0aGlz
IHRlc3QuIEFsc28gbmVnYXRpdmUgdGVzdHMgYXJlIGFsc28gZ29pbmcgdG8gYmUgZGlmZmVyZW50
IGZvcg0KPiB0aGlzIHRlc3QuIEkgd291bGQgdGhpbmsgaXQgc2hvdWxkIGJlIGdvb2QgdG8ga2Vl
cCB0aGlzIHRlc3Qgc2VwYXJhdGUuIFdoYXQgeW91DQo+IHRoaW5rIQ0KDQpPciBJIGNhbiBkbyBh
dGxlc3QgYmVsb3cgOg0KDQpkaWZmIC0tZ2l0IGEvdGVzdHMvaW50ZWwveGVfbW1hcC5jIGIvdGVz
dHMvaW50ZWwveGVfbW1hcC5jDQppbmRleCBmYzVkNzNkNTkuLjhhZTY0MDViNSAxMDA2NDQNCi0t
LSBhL3Rlc3RzL2ludGVsL3hlX21tYXAuYw0KKysrIGIvdGVzdHMvaW50ZWwveGVfbW1hcC5jDQpA
QCAtNjQsNiArNjQsNTQgQEAgdGVzdF9tbWFwKGludCBmZCwgdWludDMyX3QgcGxhY2VtZW50LCB1
aW50MzJfdCBmbGFncykNCiAgICAgICAgZ2VtX2Nsb3NlKGZkLCBibyk7DQogfQ0KDQorI2RlZmlu
ZSBQQUdFX1NISUZUIDEyDQorI2RlZmluZSBQQUdFX1NJWkUgNDA5Ng0KKw0KKy8qKg0KKyAqIFNV
QlRFU1Q6IHBjaV9tZW1iYXJyaWVyDQorICogRGVzY3JpcHRpb246IGNyZWF0ZSBwY2kgbWVtb3J5
IGJhcnJpZXIgd2l0aCB3cml0ZSBvbiBkZWZpbmVkIG1tYXAgb2Zmc2V0Lg0KKyAqIFRlc3QgY2F0
ZWdvcnk6IGZ1bmN0aW9uYWxpdHkgdGVzdA0KKyAqDQorICovDQorc3RhdGljIHZvaWQgdGVzdF9w
Y2lfbWVtYmFycmllcihpbnQgeGUpDQorew0KKyAgICAgICAgdWludDY0X3QgZmxhZ3MgPSBNQVBf
U0hBUkVEOw0KKyAgICAgICAgdW5zaWduZWQgaW50IHByb3QgPSBQUk9UX1dSSVRFOw0KKyAgICAg
ICAgdWludDMyX3QgKnB0cjsNCisgICAgICAgIHVpbnQ2NF90IHNpemUgPSBQQUdFX1NJWkU7DQor
ICAgICAgICBzdHJ1Y3QgdGltZXNwZWMgdHY7DQorICAgICAgICBzdHJ1Y3QgZHJtX3hlX2dlbV9t
bWFwX29mZnNldCBtbW8gPSB7DQorICAgICAgICAgICAgICAgIC5oYW5kbGUgPSAwLA0KKyAgICAg
ICAgICAgICAgICAuZmxhZ3MgPSBEUk1fWEVfTU1BUF9PRkZTRVRfRkxBR19QQ0lfQkFSUklFUiwN
CisgICAgICAgIH07DQorDQorICAgICAgICBpZ3RfYXNzZXJ0X2VxKGlndF9pb2N0bCh4ZSwgRFJN
X0lPQ1RMX1hFX0dFTV9NTUFQX09GRlNFVCwgJm1tbyksIDApOw0KKyAgICAgICAgcHRyID0gbW1h
cChOVUxMLCBzaXplLCBwcm90LCBmbGFncywgeGUsIG1tby5vZmZzZXQpOw0KKyAgICAgICAgaWd0
X2Fzc2VydChwdHIgIT0gTUFQX0ZBSUxFRCk7DQorDQorICAgICAgICAvKiBDaGVjayB3aG9sZSBw
YWdlIGZvciBhbnkgZXJyb3JzLCBhbHNvIGNoZWNrIGFzDQorICAgICAgICAgKiB3ZSBzaG91bGQg
bm90IHJlYWQgd3JpdHRlbiB2YWx1ZXMgYmFjaw0KKyAgICAgICAgICovDQorICAgICAgICBmb3Ig
KGludCBpID0gMDsgaSA8IHNpemUgLyBzaXplb2YoKnB0cik7IGkrKykgew0KKyAgICAgICAgICAg
ICAgICAvKiBJdCBpcyBleHBlY3RlZCB1bmNvbmZpZ3VyZWQgZG9vcmJlbGwgc3BhY2UNCisgICAg
ICAgICAgICAgICAgICogd2lsbCByZXR1cm4gcmVhZCB2YWx1ZSAweGRlYWRiZWVmDQorICAgICAg
ICAgICAgICAgICAqLw0KKyAgICAgICAgICAgICAgICBpZ3RfYXNzZXJ0X2VxX3UzMihSRUFEX09O
Q0UocHRyW2ldKSwgMHhkZWFkYmVlZik7DQorDQorICAgICAgICAgICAgICAgIGlndF9nZXR0aW1l
KCZ0dik7DQorICAgICAgICAgICAgICAgIHB0cltpXSA9IGk7DQorICAgICAgICAgICAgICAgIGlm
IChSRUFEX09OQ0UocHRyW2ldKSA9PSBpKSB7DQorICAgICAgICAgICAgICAgICAgICAgICAgd2hp
bGUgKFJFQURfT05DRShwdHJbaV0pID09IGkpDQorICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICA7DQorICAgICAgICAgICAgICAgICAgICAgICAgaWd0X2luZm8oImZkOiVkIHZhbHVlIHJl
dGFpbmVkIGZvciAlIlBSSWQ2NCJucyBwb3M6JWRcbiIsDQorICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgeGUsIGlndF9uc2VjX2VsYXBzZWQoJnR2KSwgaSk7DQorICAgICAgICAgICAg
ICAgIH0NCisgICAgICAgICAgICAgICAgaWd0X2Fzc2VydF9uZXEoUkVBRF9PTkNFKHB0cltpXSks
IGkpOw0KKyAgICAgICAgfQ0KKw0KKyAgICAgICAgbXVubWFwKHB0ciwgc2l6ZSk7DQorfQ0KKw0K
IC8qKg0KICAqIFNVQlRFU1Q6IGJhZC1mbGFncw0KICAqIERlc2NyaXB0aW9uOiBUZXN0IG1tYXAg
b2Zmc2V0IHdpdGggYmFkIGZsYWdzLg0KQEAgLTI3Myw2ICszMjEsOSBAQCBpZ3RfbWFpbg0KICAg
ICAgICAgICAgICAgIHRlc3RfbW1hcChmZCwgdnJhbV9tZW1vcnkoZmQsIDApIHwgc3lzdGVtX21l
bW9yeShmZCksDQogICAgICAgICAgICAgICAgICAgICAgICAgIERSTV9YRV9HRU1fQ1JFQVRFX0ZM
QUdfTkVFRFNfVklTSUJMRV9WUkFNKTsNCg0KKyAgICAgICBpZ3Rfc3VidGVzdCgicGNpLW1lbWJh
cnJpZXIiKQ0KKyAgICAgICAgICAgICAgIHRlc3RfcGNpX21lbWJhcnJpZXIoZmQpOw0KKw0KICAg
ICAgICBpZ3Rfc3VidGVzdCgiYmFkLWZsYWdzIikNCiAgICAgICAgICAgICAgICB0ZXN0X2JhZF9m
bGFncyhmZCk7DQoNCmRpZmYgLS1naXQgYS90ZXN0cy9tZXNvbi5idWlsZCBiL3Rlc3RzL21lc29u
LmJ1aWxkDQppbmRleCAyNzI0YzdhOWEuLjBkYWVkNDZkYSAxMDA2NDQNCi0tLSBhL3Rlc3RzL21l
c29uLmJ1aWxkDQorKysgYi90ZXN0cy9tZXNvbi5idWlsZA0KQEAgLTMwNiw2ICszMDYsNyBAQCBp
bnRlbF94ZV9wcm9ncyA9IFsNCiAgICAgICAgJ3hlX25vZXhlY19waW5nX3BvbmcnLA0KICAgICAg
ICAneGVfb2EnLA0KICAgICAgICAneGVfcGF0JywNCisgICAgICAgICd4ZV9wY2lfbWVtYmFycmll
cicsDQoNCg0KPiANCj4gVGVqYXMNCj4gDQo+ID4NCj4gPiA+ICAgdGVzdHMvbWVzb24uYnVpbGQg
ICAgICAgICAgICAgICB8ICAxICsNCj4gPiA+ICAgMiBmaWxlcyBjaGFuZ2VkLCA4MSBpbnNlcnRp
b25zKCspDQo+ID4gPiAgIGNyZWF0ZSBtb2RlIDEwMDY0NCB0ZXN0cy9pbnRlbC94ZV9wY2lfbWVt
YmFycmllci5jDQo+ID4gPg0KPiA+ID4gZGlmZiAtLWdpdCBhL3Rlc3RzL2ludGVsL3hlX3BjaV9t
ZW1iYXJyaWVyLmMNCj4gPiA+IGIvdGVzdHMvaW50ZWwveGVfcGNpX21lbWJhcnJpZXIuYyBuZXcg
ZmlsZSBtb2RlIDEwMDY0NCBpbmRleA0KPiA+ID4gMDAwMDAwMDAwLi5kMGJmNDQ3YjYNCj4gPiA+
IC0tLSAvZGV2L251bGwNCj4gPiA+ICsrKyBiL3Rlc3RzL2ludGVsL3hlX3BjaV9tZW1iYXJyaWVy
LmMNCj4gPiA+IEBAIC0wLDAgKzEsODAgQEANCj4gPiA+ICsvLyBTUERYLUxpY2Vuc2UtSWRlbnRp
ZmllcjogTUlUDQo+ID4gPiArLyoNCj4gPiA+ICsgKiBDb3B5cmlnaHQoYykgMjAyNCBJbnRlbCBD
b3Jwb3JhdGlvbi4gQWxsIHJpZ2h0cyByZXNlcnZlZC4NCj4gPiA+ICsgKi8NCj4gPiA+ICsNCj4g
PiA+ICsjaW5jbHVkZSAieGVfZHJtLmgiDQo+ID4gPiArI2luY2x1ZGUgImlndC5oIg0KPiA+ID4g
Kw0KPiA+ID4gKy8qKg0KPiA+ID4gKyAqIFRFU1Q6IFRlc3QgaWYgdGhlIGRyaXZlciBpcyBjYXBh
YmxlIG9mIHB1dHRpbmcgcGNpIG1lbW9yeQ0KPiA+ID4gK2JhcnJpZXIgdXNpbmcgbW1hcA0KPiA+
ID4gKyAqIENhdGVnb3J5OiBDb3JlDQo+ID4gPiArICogTWVnYSBmZWF0dXJlOiBHZW5lcmFsIENv
cmUgZmVhdHVyZXMNCj4gPiA+ICsgKiBTdWItY2F0ZWdvcnk6IE1lbW9yeSBtYW5hZ2VtZW50IHRl
c3RzDQo+ID4gPiArICogRnVuY3Rpb25hbGl0eTogbW1hcCB3aXRoIHByZS1kZWZpbmVkIG9mZnNl
dCAgKi8NCj4gPiA+ICsNCj4gPiA+ICtJR1RfVEVTVF9ERVNDUklQVElPTigiQmFzaWMgTU1BUCB0
ZXN0cyBwY2kgbWVtb3J5IGJhcnJpZXIgZWZmZWN0DQo+ID4gPiArd2l0aCBzcGVjaWFsIG9mZnNl
dCIpOyAjZGVmaW5lIFBBR0VfU0hJRlQgMTIgI2RlZmluZSBQQUdFX1NJWkUgNDA5Ng0KPiA+ID4g
Kw0KPiA+ID4gKy8qKg0KPiA+ID4gKyAqIFNVQlRFU1Q6IGJhc2ljDQo+ID4gPiArICogRGVzY3Jp
cHRpb246IGNyZWF0ZSBwY2kgbWVtb3J5IGJhcnJpZXIgd2l0aCB3cml0ZSBvbiBkZWZpbmVkDQo+
ID4gPiArbW1hcA0KPiA+IG9mZnNldC4NCj4gPiA+ICsgKiBUZXN0IGNhdGVnb3J5OiBmdW5jdGlv
bmFsaXR5IHRlc3QNCj4gPiA+ICsgKg0KPiA+ID4gKyAqLw0KPiA+ID4gKw0KPiA+ID4gK3N0YXRp
YyB2b2lkIHBjaV9tZW1iYXJyaWVyKGludCB4ZSkNCj4gPiA+ICt7DQo+ID4gPiArCXVpbnQ2NF90
IGZsYWdzID0gTUFQX1NIQVJFRDsNCj4gPiA+ICsJdW5zaWduZWQgaW50IHByb3QgPSBQUk9UX1dS
SVRFOw0KPiA+ID4gKwl1aW50MzJfdCAqcHRyOw0KPiA+ID4gKwl1aW50NjRfdCBzaXplID0gUEFH
RV9TSVpFOw0KPiA+ID4gKwlzdHJ1Y3QgdGltZXNwZWMgdHY7DQo+ID4gPiArICAgICAgICBzdHJ1
Y3QgZHJtX3hlX2dlbV9tbWFwX29mZnNldCBtbW8gPSB7DQo+ID4gPiArICAgICAgICAgICAgICAg
IC5oYW5kbGUgPSAwLA0KPiA+ID4gKyAgICAgICAgICAgICAgICAuZmxhZ3MgPSBEUk1fWEVfTU1B
UF9PRkZTRVRfRkxBR19QQ0lfQkFSUklFUiwNCj4gPiA+ICsgICAgICAgIH07DQo+ID4gPiArDQo+
ID4gPiArICAgICAgICBpZ3RfYXNzZXJ0X2VxKGlndF9pb2N0bCh4ZSwgRFJNX0lPQ1RMX1hFX0dF
TV9NTUFQX09GRlNFVCwNCj4gPiAmbW1vKSwgMCk7DQo+ID4gPiArICAgICAgICBwdHIgPSBtbWFw
KE5VTEwsIHNpemUsIHByb3QsIGZsYWdzLCB4ZSwgbW1vLm9mZnNldCk7DQo+ID4gPiArCWlndF9h
c3NlcnQocHRyICE9IE1BUF9GQUlMRUQpOw0KPiA+DQo+ID4gbml0OiBmb3JtYXR0aW5nDQo+ID4N
Cj4gPiA+ICsNCj4gPiA+ICsJLyogQ2hlY2sgd2hvbGUgcGFnZSBmb3IgYW55IGVycm9ycywgYWxz
byBjaGVjayBhcw0KPiA+ID4gKwkgKiB3ZSBzaG91bGQgbm90IHJlYWQgd3JpdHRlbiB2YWx1ZXMg
YmFjaw0KPiA+ID4gKwkgKi8NCj4gPiA+ICsJZm9yIChpbnQgaSA9IDA7IGkgPCBzaXplIC8gc2l6
ZW9mKCpwdHIpOyBpKyspIHsNCj4gPiA+ICsJCS8qIEl0IGlzIGV4cGVjdGVkIHVuY29uZmlndXJl
ZCBkb29yYmVsbCBzcGFjZQ0KPiA+ID4gKwkJICogd2lsbCByZXR1cm4gcmVhZCB2YWx1ZSAweGRl
YWRiZWVmDQo+ID4gPiArCQkgKi8NCj4gPiA+ICsJCWlndF9hc3NlcnRfZXFfdTMyKFJFQURfT05D
RShwdHJbaV0pLCAweGRlYWRiZWVmKTsNCj4gPiA+ICsNCj4gPiA+ICsJCWlndF9nZXR0aW1lKCZ0
dik7DQo+ID4gPiArCQlwdHJbaV0gPSBpOw0KPiA+ID4gKwkJaWYgKFJFQURfT05DRShwdHJbaV0p
ID09IGkpIHsNCj4gPg0KPiA+IENhbiB0aGlzIGFjdHVhbGx5IGhhcHBlbiB3aGVyZSB0aGUgdmFs
dWUgaXMgd3JpdHRlbj8NCj4gPg0KPiA+IEkgdGhpbmsgYWxzbyBjb25zaWRlciBhZGRpbmcgc29t
ZSBuZWdhdGl2ZSB0ZXN0Y2FzZXMuIEZvciBleGFtcGxlOg0KPiA+DQo+ID4gLSBUcnkgdG8gbW1h
cCBzb21ldGhpbmcgbGFyZ2VyIHRoYW4gNEsuIEVuc3VyZSB3ZSBnZXQgYW4gZXJyb3IuDQo+ID4g
LSBUcnkgQkFSUklFUiBtbWFwX29mZnNldCwgYW5kIGFsc28gc3VwcGx5IGEgQk8uIEVuc3VyZSB3
ZSBnZXQgYW4gZXJyb3IuDQo+ID4NCj4gPiA+ICsJCQl3aGlsZSAoUkVBRF9PTkNFKHB0cltpXSkg
PT0gaSkNCj4gPiA+ICsJCQkJOw0KPiA+ID4gKwkJCWlndF9pbmZvKCJmZDolZCB2YWx1ZSByZXRh
aW5lZCBmb3IgJSJQUklkNjQibnMNCj4gPiBwb3M6JWRcbiIsDQo+ID4gPiArCQkJCSB4ZSwgaWd0
X25zZWNfZWxhcHNlZCgmdHYpLCBpKTsNCj4gPiA+ICsJCX0NCj4gPiA+ICsJCWlndF9hc3NlcnRf
bmVxKFJFQURfT05DRShwdHJbaV0pLCBpKTsNCj4gPiA+ICsJfQ0KPiA+ID4gKw0KPiA+ID4gKwlt
dW5tYXAocHRyLCBzaXplKTsNCj4gPiA+ICt9DQo+ID4gPiArDQo+ID4gPiAraWd0X21haW4NCj4g
PiA+ICt7DQo+ID4gPiArCWludCB4ZTsNCj4gPiA+ICsNCj4gPiA+ICsJaWd0X2ZpeHR1cmUgew0K
PiA+ID4gKwkJeGUgPSBkcm1fb3Blbl9kcml2ZXIoRFJJVkVSX1hFKTsNCj4gPiA+ICsJfQ0KPiA+
ID4gKw0KPiA+ID4gKwlpZ3Rfc3VidGVzdF9mKCJiYXNpYyIpDQo+ID4gPiArCQlwY2lfbWVtYmFy
cmllcih4ZSk7DQo+ID4gPiArDQo+ID4gPiArCWlndF9maXh0dXJlDQo+ID4gPiArCQlkcm1fY2xv
c2VfZHJpdmVyKHhlKTsNCj4gPiA+ICt9DQo+ID4gPiBkaWZmIC0tZ2l0IGEvdGVzdHMvbWVzb24u
YnVpbGQgYi90ZXN0cy9tZXNvbi5idWlsZCBpbmRleA0KPiA+ID4gMzRiODdiMTI1Li4xNTEzMWQ4
MTIgMTAwNjQ0DQo+ID4gPiAtLS0gYS90ZXN0cy9tZXNvbi5idWlsZA0KPiA+ID4gKysrIGIvdGVz
dHMvbWVzb24uYnVpbGQNCj4gPiA+IEBAIC0zMDYsNiArMzA2LDcgQEAgaW50ZWxfeGVfcHJvZ3Mg
PSBbDQo+ID4gPiAgIAkneGVfbm9leGVjX3BpbmdfcG9uZycsDQo+ID4gPiAgIAkneGVfb2EnLA0K
PiA+ID4gICAJJ3hlX3BhdCcsDQo+ID4gPiArICAgICAgICAneGVfcGNpX21lbWJhcnJpZXInLA0K
PiA+ID4gICAJJ3hlX3BlZXIycGVlcicsDQo+ID4gPiAgIAkneGVfcG0nLA0KPiA+ID4gICAJJ3hl
X3BtX3Jlc2lkZW5jeScsDQo=
