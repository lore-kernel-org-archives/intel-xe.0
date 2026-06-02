Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99DB2CD6E4A
	for <intel-xe@archiver.kernel.org>; Tue,  2 Jun 2026 03:59:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2805510EB7A;
	Tue,  2 Jun 2026 03:59:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ahAifQ/b";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E241310EB7A
 for <intel-xe@lists.freedesktop.org>; Tue,  2 Jun 2026 03:59:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780372782; x=1811908782;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=1XcFUDKohGqPey6nDbCYz42G9t3EscPUw6CHFaochQo=;
 b=ahAifQ/b+2m3DQMKARBjA7FJwjZHAfiRblfvdOKcIZCG6A1B5CqOzwyZ
 L3wkbvfUosZAASlmUqYzyP2A9dU8BQk/PqwQCFsGViJgE3m1X1gTZy+m4
 JMNtXbKLfp5QgcF5bhIEWQXKvuUxyd1yraMQqJjC0rwN4e88596eoaNf1
 KyaFN8wmBfW+pgeNYlX9u9G546pKxQYpThgLZxwUrfUS8F3G2PVq/wqy6
 YrQvlRB0YCLrFSxfSgrabv7RH8nn99l1+xoP74S79H50xneN2cmd9rZ1L
 2N2QJp+u9f83AdcOEpmAGsV+R8RecTJKmwTgoZUuwLqtigCYpXgfMfiD0 g==;
X-CSE-ConnectionGUID: OjOlNhgDQqWo23NOqCkEWg==
X-CSE-MsgGUID: U45LG2q5S8C8zkBN5TXyFQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11804"; a="80295367"
X-IronPort-AV: E=Sophos;i="6.24,182,1774335600"; d="scan'208";a="80295367"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2026 20:59:42 -0700
X-CSE-ConnectionGUID: EhkV7s7eSB2XWULhXFMwfw==
X-CSE-MsgGUID: ewguQYxwRP2St9zHyE994g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,182,1774335600"; d="scan'208";a="267649556"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2026 20:59:41 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 1 Jun 2026 20:59:25 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 1 Jun 2026 20:59:25 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.25) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 1 Jun 2026 20:59:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dsxT2zqiVfgFZN0DNfMVKxx6VtBD0+sNdjW0WXszrdyglkjwO1fdBnjIgdbGZULuRdLxjzLdiinug4ewgQpzFTQjOBzH1EMuG0gjYFW2a/Kj8npMj6jrZpMsOAsn4RDTH6xXQyliNT64Yu3QTz7engKCrZcEofRWXnuSAkkohp89Us7zSpFTFa8A2/RdxixeYHZDsea7xHJovCW8cU4uevP2dRcltzOQOsRInEWBxIt3O/VgCtUZo5p/Z/h4ke5wykNXjQlkV+f9/hOfI0nivtHdTxzgstfM9BsHPGSgPe3m1P6pdLjMpTtir2McvknNW+yBvJg/OcffZV1upVu64Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1XcFUDKohGqPey6nDbCYz42G9t3EscPUw6CHFaochQo=;
 b=JbsyVnElUTqlyRR3IB0r1ao7zma4C1qmN26uYzjfaQ3l3+G/1lgiD9wzrpvfOVx42vvIMUFvVJhsRSAaYxS13VCXKv15aBmnAfzIcLmHi5dvNUpkB6fEwKbuq+paFY3QYU7qlo+kLArU0jtHlpqo/r4x6WVQDdhN7t6ZUqVv4gmAOfSLF8qE2SdboTSf3cKS1bPv4/Qsz9sBViiu3+ykEcRj5OIsLock4dUa7dU1OsNcvQS2ccNHVrrBcH3tneQQek8SqT6gsSrZOaPhlO0QYa5fcIbotdoQzrxfTSYawfSIxt1TRMpV9uNPHh0Qd6r7gYKX2SE1bhOl4T3ATvDpzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SA3PR11MB7625.namprd11.prod.outlook.com (2603:10b6:806:305::12)
 by BL1PR11MB5318.namprd11.prod.outlook.com (2603:10b6:208:312::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Tue, 2 Jun 2026
 03:59:23 +0000
Received: from SA3PR11MB7625.namprd11.prod.outlook.com
 ([fe80::a120:f916:60ba:5ad3]) by SA3PR11MB7625.namprd11.prod.outlook.com
 ([fe80::a120:f916:60ba:5ad3%5]) with mapi id 15.21.0071.015; Tue, 2 Jun 2026
 03:59:22 +0000
From: "Tangudu, Tilak Tirumalesh" <tilak.tirumalesh.tangudu@intel.com>
To: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>, "Roper, Matthew D"
 <matthew.d.roper@intel.com>, "Upadhyay, Tejas" <tejas.upadhyay@intel.com>,
 "Vivekanandan, Balasubramani" <balasubramani.vivekanandan@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: RE: [PATCH] drm/xe: Add wa_14025941587 for xe3 and xe3p platforms
Thread-Topic: [PATCH] drm/xe: Add wa_14025941587 for xe3 and xe3p platforms
Thread-Index: AQHc8eXXmQ1TS8Mb606CA4gXH83bHbYqHsSAgACEXvA=
Date: Tue, 2 Jun 2026 03:59:22 +0000
Message-ID: <SA3PR11MB76257E2F473FD776AD512970C8122@SA3PR11MB7625.namprd11.prod.outlook.com>
References: <20260601164316.2870984-1-tilak.tirumalesh.tangudu@intel.com>
 <fa0b788d-a809-4d02-8b38-9deca6c3e877@intel.com>
In-Reply-To: <fa0b788d-a809-4d02-8b38-9deca6c3e877@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA3PR11MB7625:EE_|BL1PR11MB5318:EE_
x-ms-office365-filtering-correlation-id: 8c198df5-c111-4500-43ce-08dec05b54bc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|10070799003|11063799006|4143699003|56012099006|18002099003|22082099003|38070700021;
x-microsoft-antispam-message-info: CkVQYyYdM5kOFy3YHQ0VEGC4b0cJTPYGYYTB/Z21vk6hlOvbA5Wg40/k00QgUiz8ro34wUtHnnr69UL13vtHexAMkHcdFnlXF3XuWvNhX57OEEXEAhHnidmyn8JEo8vF9euu0vDZbTT1A/q4ykpxjLMDkbj1SjkGpMA3acOs29//8YiTCeiQA6/U/GXEYqHGBpKvATSqbWQGngNR1H64Klf5bidc1lupCOxXNG/q9InDU/Ip4n/+qjaibcFHY2WRaAum1XGLyc8MfE9DB8gu1V59T+2CQUP0CcGP0t8F7VWXUeGpvCKNLYuVNVzTOpc6xA5SYCrzeREyHuJ4rqBMKWc56icfjtG+InWVleKE5J732JAc5ckQS7aLmmtFH5V1ln/hz2ETRUTDDxTu7luvxHya71Ui2Vs4wNMJG5Zi+Mu00V7jUY4N0spil5KNBkKnsIgPrT7Q8jIII0Ilit/GoHiZLYFRfHVcSGZs1HGT1ubK6+R9B24QrcnnZiLNvfmISsWANfQFKDvOrV66uy5NN0nGU5jBNBF1sjVtb/g/s7flE7GX665Yz8LSwQaTJJ6jVM3zJMvy2zNpTq8CVSOxE5WdzR0uHDSiJJBhMD/TVWsye7w221e2aVr4f0uBS5i26YuOMng6jF7rjQGtFSY+eLfKTGPr/zz0FhntX2nbOGTvjH6ZfvR7mIgHMC77SsG/WEvJr51WiYhaVpcOUB9OcQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA3PR11MB7625.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(10070799003)(11063799006)(4143699003)(56012099006)(18002099003)(22082099003)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?STdYSkFWSUl1eVppaFI0ckdGTmZnWjNHekwwRkQ4VkpPdXEyTFJwS1hnbTZ0?=
 =?utf-8?B?SkFNbUZSeTNMTHBZYXR4YytCa1ZaZHhxaTArOW92MFM0am9uYWZuVFB1SDJi?=
 =?utf-8?B?enFzK0lJazcyNUU0WjVrK3hqM0NqR29QOW1wQlUzL3BjNVdCdzJDUS9UK0M2?=
 =?utf-8?B?bFhXOVp4NHVOK1d2Z1lsV1NVRGZ3QVRkMWNLYnNaODVZcFR4Y1dKd0NmMTdp?=
 =?utf-8?B?aDkwMWxZWjdJOVhzdmRXa3dXQ2owaElzU2I0eTlqWFFZTnlnT0NzT2cyOFB4?=
 =?utf-8?B?ZHVta0lqblpFbFhobGNENGRNdUx2d2lZd2pQTDl1TVo2VDl4TExtUENrZU81?=
 =?utf-8?B?eURFYSt4WHhEMjNLSFpwdE00TWVYSTB1dGZLYU0rVkxhZzBLckkyKzA2di9L?=
 =?utf-8?B?ZGR0LzBPald5NFBBbmc1elg0eXpYb0VINXpZMDJwUkN0eFJVaFJER2syQkFs?=
 =?utf-8?B?KzdKOHFVZ0h1TUlUay9HZGdlUUF0Uk5yYklhMG1LM3ZzK1REcEVub0FrdVJt?=
 =?utf-8?B?RGZoQXZTazRCVDl0OU9iZWFzY1F1YXFVaWNNMUQ2YmJEamErdUZxcktQWWkr?=
 =?utf-8?B?Lys4ZlBBai8waE1peDFKZE5OQkFvbjBlaEFFZkpYbk92OVBTUEJEeFFDckJv?=
 =?utf-8?B?eldiUzVyam9UdEh0bk5XbHRtU2k3a2pGYXBOQmwwa2IvS2pnazlpYk1YUUU3?=
 =?utf-8?B?Q1ViWHhzdmUzbWFFZE1rYW9Sd0lMNTRtZDJOMDNVQUtjTVRhY2hCLzNLb2Ro?=
 =?utf-8?B?U0wxd0lkaUNZR1V3RHVocSszMFd4c2dpM2NMUjdzdjRVZktnakpGVmVSOXU1?=
 =?utf-8?B?SDBjdGNVSnJwc2phNlNyc0xUbzNCTEJsMFVObCtlZXFheHdNNUJLT2dwb0ov?=
 =?utf-8?B?cU14WFQ5Z3lmdGJtSXdvTis4Q1U5ZHVxTTViRnljRXdiVVgzd1orUVFlQ3kr?=
 =?utf-8?B?dU5CZ1pwWmk2RlNOdCtUR283cG9MTnlWMkp1ME42NG9Kbk9XdHE1ZmU0bUVD?=
 =?utf-8?B?eDF0cUEzNEFiQ3gyd2w0SmplKytDRzVGOUV3MVNCS3RHQnp3TjNEemlNUG5o?=
 =?utf-8?B?b08yM0JMVTNlU3pnK0Q3RnIxUkVKYk5aUGNwbWtLVkF3djlDTnVMN3NyYlkw?=
 =?utf-8?B?dHF3c1hWa0RsaS9va0pzVUJ1eks2cWRZc3Y1LzgvM2xJY3o0M2xzK2RqeGNp?=
 =?utf-8?B?aVVDb20zdVNlUVRGbXR6NHlxRFRXL2VkbnE1SEJwaUJXS09JUGljZ0xtbkE4?=
 =?utf-8?B?MkNVNlNITlRVcU9pYkoxR09yYllzUFRUcUhLaXd5UWwzZzU1VnpSK2FhQkht?=
 =?utf-8?B?aE9zZDljQXpmdWlSbzVpSUNhS3UwOWxUN3AyWWJkVTFOd0tIVjQ2amxRZHc2?=
 =?utf-8?B?Ylpwb0N4SWZRcVFzN2dOR01zNTBLbFRCNy9DK0diTUZRTWxwd1Y5dHliWXZE?=
 =?utf-8?B?d2JHZ0VwQ3lsbWduWlZQdVdLaFBZcHlobENXWGtqMzRHcUtNN1RMSzJTbWYv?=
 =?utf-8?B?dGdGWFNaM1JsNDlWdnRtMXRveXZOOCt0ekgwT2RUY0NqK0JwQnphbkp1SkZx?=
 =?utf-8?B?UE5ETGpKMjFDaGFCa3lwL2QycEc0amlDSkdnZnBONW9FZVNlZ3pocG91RzZq?=
 =?utf-8?B?dW1sMm95VnE5cHJiekh4V1JSaURabW0yWVlISlBXU2tkZm5aTzgzelM0d3BE?=
 =?utf-8?B?SXFQZGVBYXBsM0VhZHZyRnJZc2dYMVgyNTRlZEhTanBraHcxZzczTGZmaEg4?=
 =?utf-8?B?c1JXaE1Pb2xHN01DQjgrL3V2ZjZ0Mld1YWJxMjZmU2ZyVVlYYnFtVFhNWU5y?=
 =?utf-8?B?dzdNTWtmeElqMU9DNlU3R2FaWjdWYTFWWExxWS92THFGajF5d0drSU9zSnoz?=
 =?utf-8?B?Tk9CMUZwT3cvTld4UmZ1VzBEcGlMeEhnb0RNcW9TRjBhbGJZTXFCNG1XOHZL?=
 =?utf-8?B?ZHlFWTF5S1dZMEZ5SktJejBoRkttTEZzUW0wUHlZTFNRbld5L0N2UW1kMk9u?=
 =?utf-8?B?cjducjF2S09ydm1BS1pmQzRSSUxQa0FJVlMzcittVTFGejk5WjNNS2NSRkUy?=
 =?utf-8?B?L2FyTEs0NnVKWE1iY1BnUlZ3cTNvdDI5MGZnN21GYTViSGxETXMzamI3eStl?=
 =?utf-8?B?VHZqMlRkbk9RYkZFM2h4QjdMejdyVGl3bmFndDB4a25CWEpjOVlXM0xkSElh?=
 =?utf-8?B?b01YbkdMQkxYaDljaGdUNm5MNk1hck15YytFL1kyT0R2Uk1UMks1ZzVGN0RI?=
 =?utf-8?B?YVhLMnNQdndsYWtqKzJzRDNmMjJnRUNHVnJXdDk4bmxaQnY1VWIrd3pxZ0VU?=
 =?utf-8?B?RVFtaEY1dzRxbTZpUGcyeERsQW1lMW84QnhhcGNHREZPZDcwbVRxTTZSMzAw?=
 =?utf-8?Q?FAzJhvawBvcQQ+0yZuct6PXWpRqk1z5lyz3musv1pV5FJ?=
x-ms-exchange-antispam-messagedata-1: cLFk2PqfV3RjNU677142rPZS7Xgfuc8UhWM=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: ihgBGs0V6YiMjQ+93NChKhOkvpTmbQ7Jl15l0YFxKjOlcic1L0SB9t7vFuRM8lIvI0GAgkPVW4CDEh2GwNJAX4EMFQpvj8k5HhhNoWpSRWNtRNjHyYMAmvsUd2c5wIB6pAkKy9/WHAIlimEWGjcMUqfxOjH1A9kWo04DgFFMgxOdavgRzPRGd/8/DlHL12XMu+qjVbIpBu1Pi5AZtxWxEPsE2l4Kcnx71d2i9qUZq7h6ITwP3JQr9G6GjfZg0wnpcOTE6dnrTMbQHbjcGIIICfWWkB2tpcoAbnu2BE2p7N9n/IcXvjg2BlB0NEL1ajRVldgh/4QeXAERFcv0qcjh7A==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA3PR11MB7625.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c198df5-c111-4500-43ce-08dec05b54bc
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Jun 2026 03:59:22.8786 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sDIKYKDcAIaeBDQHGpqL4rM9l17ycAxrhAIZ0/4f+Klon1JENH2DQoPP16T8fTxlXo649ucwD9mwuv+6QeA8oqnTGVaQ8+7u87djs4QO58suIPOAhxlBGaVqY02IFmM2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5318
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

DQoNCi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBCZWxnYXVta2FyLCBWaW5heSA8
dmluYXkuYmVsZ2F1bWthckBpbnRlbC5jb20+IA0KU2VudDogMDIgSnVuZSAyMDI2IDAxOjMwDQpU
bzogVGFuZ3VkdSwgVGlsYWsgVGlydW1hbGVzaCA8dGlsYWsudGlydW1hbGVzaC50YW5ndWR1QGlu
dGVsLmNvbT47IFJvcGVyLCBNYXR0aGV3IEQgPG1hdHRoZXcuZC5yb3BlckBpbnRlbC5jb20+OyBV
cGFkaHlheSwgVGVqYXMgPHRlamFzLnVwYWRoeWF5QGludGVsLmNvbT47IFZpdmVrYW5hbmRhbiwg
QmFsYXN1YnJhbWFuaSA8YmFsYXN1YnJhbWFuaS52aXZla2FuYW5kYW5AaW50ZWwuY29tPjsgaW50
ZWwteGVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQpTdWJqZWN0OiBSZTogW1BBVENIXSBkcm0veGU6
IEFkZCB3YV8xNDAyNTk0MTU4NyBmb3IgeGUzIGFuZCB4ZTNwIHBsYXRmb3Jtcw0KDQoNCk9uIDYv
MS8yMDI2IDk6NDMgQU0sIHRpbGFrLnRpcnVtYWxlc2gudGFuZ3VkdUBpbnRlbC5jb20gd3JvdGU6
DQo+IEZyb206IFRhbmd1ZHUgVGlsYWsgVGlydW1hbGVzaCA8dGlsYWsudGlydW1hbGVzaC50YW5n
dWR1QGludGVsLmNvbT4NCj4NCj4gQXZvaWQgSURMRURMWSB0aW1lciBwcm9ncmFtbWluZyBsZXNz
dGhhbiA1IG1pY3JvIHNlY3MuDQpuaXQ6IFJld29yZCAtICJBdm9pZCBwcm9ncmFtbWluZyBJRExF
RExZIHRvIGxlc3MgdGhhbiA1IG1pY3Jvc2Vjb25kcyIgPw0KPiBBcHBseSB3YV8xNDAyNTk0MTU4
NyB0byBHcmFwaGljcyBWZXJzaW9ucyAzMC4wMCB0byAzNS4xMQ0KPg0KPiB2MjogVXNlIHhlX3J0
cF9tYXRjaF9ub3Rfc3Jpb3ZfdmYsIG1vdmUgdG8gbG9jYWwgdmFyaWFibGUNCj4gICAgICBSZW1v
dmUgd2FybiBhbmQgb3RoZXIga25pdHMgICAgICAgICAgICAtIE1hdHQgUg0KPg0KPiB2MzogQWRk
IHZlcmJvc2UgY29tbWVudCAtIFRlamFzDQo+DQo+IHY0OiBSZXN0b3JlIElETEVfRExZIHJlZ2lz
dGVyIG9uIGVuZ2luZSByZXNldC4NCj4gICAgICBBZGQgaXQgdG8gR1VDIHNhdmUtcmVzdG9yZSBs
aXN0LiAtVml2ZWsNCj5Jc24ndCB0aGlzIGJlaW5nIHRha2VuIGNhcmUgb2YgaGVyZSAtDQo+aHR0
cHM6Ly9wYXRjaHdvcmsuZnJlZWRlc2t0b3Aub3JnL3Nlcmllcy8xNjcxMjMvID8NCkl0IG5lZWQg
dG8gYmUgZXh0ZW5kZWQgdG8gdGhpcyBXQSAxNDAyNTk0MTU4Ny4NCkxldHMgc2F5IFdBIDE2MDIz
MTA1MjMyIGlzIG5vdCBhcHBsaWNhYmxlIHRvIHNwZWNpZmljIHBsYXRmb3JtDQpXaGVyZSBXQSAx
NDAyNTk0MTU4NyBhcHBsaWVzDQo+DQo+IFNpZ25lZC1vZmYtYnk6IFRhbmd1ZHUgVGlsYWsgVGly
dW1hbGVzaCANCj4gPHRpbGFrLnRpcnVtYWxlc2gudGFuZ3VkdUBpbnRlbC5jb20+DQo+IC0tLQ0K
PiAgIGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndWNfYWRzLmMgICAgfCAgMiArLQ0KPiAgIGRyaXZl
cnMvZ3B1L2RybS94ZS94ZV9od19lbmdpbmUuYyAgfCAyNiArKysrKysrKysrKysrKysrKysrKysr
Ky0tLQ0KPiAgIGRyaXZlcnMvZ3B1L2RybS94ZS94ZV93YV9vb2IucnVsZXMgfCAgMiArLQ0KPiAg
IDMgZmlsZXMgY2hhbmdlZCwgMjUgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkNCj4NCj4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndWNfYWRzLmMgDQo+IGIvZHJpdmVy
cy9ncHUvZHJtL3hlL3hlX2d1Y19hZHMuYyBpbmRleCBjOTg0NTQ1NDVhODUuLjIwODBlMGU2NTBl
YiANCj4gMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndWNfYWRzLmMNCj4g
KysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d1Y19hZHMuYw0KPiBAQCAtNzY4LDcgKzc2OCw3
IEBAIHN0YXRpYyB1bnNpZ25lZCBpbnQgZ3VjX21taW9fcmVnc2V0X3dyaXRlKHN0cnVjdCB4ZV9n
dWNfYWRzICphZHMsDQo+ICAgCQl9DQo+ICAgCX0NCj4gICANCj4gLQlpZiAoWEVfR1RfV0EoaHdl
LT5ndCwgMTYwMjMxMDUyMzIpKQ0KPiArCWlmIChYRV9HVF9XQShod2UtPmd0LCAxNjAyMzEwNTIz
MikgfHwgWEVfR1RfV0EoaHdlLT5ndCwgDQo+ICsxNDAyNTk0MTU4NykpDQo+ICAgCQlndWNfbW1p
b19yZWdzZXRfd3JpdGVfb25lKGFkcywgcmVnc2V0X21hcCwNCj4gICAJCQkJCSAgUklOR19JRExF
RExZKGh3ZS0+bW1pb19iYXNlKSwNCj4gICAJCQkJCSAgY291bnQrKyk7DQo+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0veGUveGVfaHdfZW5naW5lLmMgDQo+IGIvZHJpdmVycy9ncHUvZHJt
L3hlL3hlX2h3X2VuZ2luZS5jDQo+IGluZGV4IDhjNjZmZjZmM2QzYy4uZGQ4ZWVjMDk4YmRmIDEw
MDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfaHdfZW5naW5lLmMNCj4gKysrIGIv
ZHJpdmVycy9ncHUvZHJtL3hlL3hlX2h3X2VuZ2luZS5jDQo+IEBAIC01ODQsOCArNTg0LDEyIEBA
IHN0YXRpYyB2b2lkIGFkanVzdF9pZGxlZGx5KHN0cnVjdCB4ZV9od19lbmdpbmUgKmh3ZSkNCj4g
ICAJdTMyIGlkbGVkbHlfdW5pdHNfcHMgPSA4ICogZ3QtPmluZm8udGltZXN0YW1wX2Jhc2U7DQo+
ICAgCXUzMiBtYXhjbnRfdW5pdHNfbnMgPSA2NDA7DQo+ICAgCWJvb2wgaW5oaWJpdF9zd2l0Y2gg
PSAwOw0KPiArCWJvb2wgd2FfYXBwbGllZCA9IGZhbHNlOw0KPiArDQo+ICsJaWYgKCghSVNfU1JJ
T1ZfVkYoZ3RfdG9feGUoaHdlLT5ndCkpICYmIFhFX0dUX1dBKGd0LCAxNjAyMzEwNTIzMikpIHx8
DQo+ICsJICAgIFhFX0dUX1dBKGd0LCAxNDAyNTk0MTU4NykpIHsNCj4gKwkJdTMyIG1pbmNudF9p
ZGxlZGx5X25zID0gNTAwMDsNCj4gICANCj4gLQlpZiAoIUlTX1NSSU9WX1ZGKGd0X3RvX3hlKGh3
ZS0+Z3QpKSAmJiBYRV9HVF9XQShndCwgMTYwMjMxMDUyMzIpKSB7DQo+ICAgCQlpZGxlZGx5ID0g
eGVfbW1pb19yZWFkMzIoJmd0LT5tbWlvLCBSSU5HX0lETEVETFkoaHdlLT5tbWlvX2Jhc2UpKTsN
Cj4gICAJCW1heGNudCA9IHhlX21taW9fcmVhZDMyKCZndC0+bW1pbywgDQo+IFJJTkdfUFdSQ1RY
X01BWENOVChod2UtPm1taW9fYmFzZSkpOw0KPiAgIA0KPiBAQCAtNTk1LDggKzU5OSwyNCBAQCBz
dGF0aWMgdm9pZCBhZGp1c3RfaWRsZWRseShzdHJ1Y3QgeGVfaHdfZW5naW5lICpod2UpDQo+ICAg
CQltYXhjbnQgPSBSRUdfRklFTERfR0VUKElETEVfV0FJVF9USU1FLCBtYXhjbnQpOw0KPiAgIAkJ
bWF4Y250ICo9IG1heGNudF91bml0c19uczsNCj4gICANCj4gLQkJaWYgKHhlX2d0X1dBUk5fT04o
Z3QsIGlkbGVkbHkgPj0gbWF4Y250IHx8IGluaGliaXRfc3dpdGNoKSkgew0KPiAtCQkJaWRsZWRs
eSA9IERJVl9ST1VORF9DTE9TRVNUKCgobWF4Y250IC0gMSkgKiAxMDAwKSwNCj4gKwkJLyogV2Ff
MTQwMjU5NDE1ODc6IGFwcGxpZWQgcHJpb3IgdG8gV2FfMTYwMjMxMDUyMzIsDQo+ICsJCSAqIGFz
IHRoZSBsYXR0ZXIgaGFzIGhpZ2hlciBwcmlvcml0eSwgYWx0aG91Z2ggY29uZmxpY3QNCj4gKwkJ
ICogaXMgbm90IGV4cGVjdGVkLg0KPiArCQkgKi8NCj4gKwkJaWYgKFhFX0dUX1dBKGd0LCAxNDAy
NTk0MTU4NykgJiYNCj4gKwkJICAgIGlkbGVkbHkgPCBtaW5jbnRfaWRsZWRseV9ucykgew0KPiAr
CQkJaWRsZWRseSA9IG1pbmNudF9pZGxlZGx5X25zOw0KPiArCQkJd2FfYXBwbGllZCA9IHRydWU7
DQo+ICsJCX0NCj4gKw0KPiArCQlpZiAoWEVfR1RfV0EoZ3QsIDE2MDIzMTA1MjMyKSAmJg0KPiAr
CQkgICAgKHhlX2d0X1dBUk5fT04oZ3QsIGlkbGVkbHkgPj0gbWF4Y250IHx8IGluaGliaXRfc3dp
dGNoKSkpIHsNCj4gKwkJCWlkbGVkbHkgPSAobWF4Y250IC0gMSk7DQo+ICsJCQl3YV9hcHBsaWVk
ID0gdHJ1ZTsNCj4gKwkJfQ0KPiArDQo+ICsJCWlmICh3YV9hcHBsaWVkKSB7DQo+ICsJCQlpZGxl
ZGx5ID0gRElWX1JPVU5EX0NMT1NFU1QoKGlkbGVkbHkgKiAxMDAwKSwNCj4gICAJCQkJCQkgICAg
aWRsZWRseV91bml0c19wcyk7DQo+ICAgCQkJeGVfbW1pb193cml0ZTMyKCZndC0+bW1pbywgUklO
R19JRExFRExZKGh3ZS0+bW1pb19iYXNlKSwgaWRsZWRseSk7DQo+ICAgCQl9DQo+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfd2Ffb29iLnJ1bGVzIA0KPiBiL2RyaXZlcnMvZ3B1
L2RybS94ZS94ZV93YV9vb2IucnVsZXMNCj4gaW5kZXggZjhhMTg1MTAzYjgwLi4yZDUzMWI4YTk0
NmYgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV93YV9vb2IucnVsZXMNCj4g
KysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3dhX29vYi5ydWxlcw0KPiBAQCAtNjIsNiArNjIs
NiBAQA0KPiAgIDE1MDE1NDA0NDI1X2Rpc2FibGUJUExBVEZPUk0oUEFOVEhFUkxBS0UpLCBNRURJ
QV9TVEVQKEIwLCBGT1JFVkVSKQ0KPiAgIDE2MDI2MDA3MzY0ICAgIE1FRElBX1ZFUlNJT04oMzAw
MCkNCj4gICAxNDAyMDMxNjU4MCAgICBNRURJQV9WRVJTSU9OKDEzMDEpDQo+IC0NCj4gICAxNDAy
NTg4MzM0NwlNRURJQV9WRVJTSU9OX1JBTkdFKDEzMDEsIDM1MDMpDQo+ICAgCQlHUkFQSElDU19W
RVJTSU9OX1JBTkdFKDIwMDQsIDMwMDUpDQo+ICsxNDAyNTk0MTU4NyAgICBHUkFQSElDU19WRVJT
SU9OX1JBTkdFKDMwMDAsIDM1MTEpLCBGVU5DKHhlX3J0cF9tYXRjaF9ub3Rfc3Jpb3ZfdmYpDQoN
Cj5Eb2VzIHRoaXMgYWZmZWN0IG1lZGlhIGFzIHdlbGw/DQpUaGUgcmVjZW50IHByb2dyZXNzIGlu
IHByb2Nlc3MgbWlzc2VkIGl0LCB5ZWEgd2lsbCBhZGQgaXQNCi1UaWxhaw0KDQpUaGFua3MsDQoN
ClZpbmF5Lg0KDQo=
