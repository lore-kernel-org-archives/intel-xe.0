Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E74B0C3DA4B
	for <intel-xe@archiver.kernel.org>; Wed, 17 Jul 2024 08:05:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3986310E9E7;
	Wed, 17 Jul 2024 08:05:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=habana.ai header.i=@habana.ai header.b="bVuyRBl4";
	dkim-atps=neutral
Received: from cluster-d.mailcontrol.com (mail-03-d.mailcontrol.com
 [85.115.60.223])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9695810E9EE
 for <intel-xe@lists.freedesktop.org>; Wed, 17 Jul 2024 08:05:36 +0000 (UTC)
Received: from rly11d.srv.mailcontrol.com (localhost [127.0.0.1])
 by rly11d.srv.mailcontrol.com (MailControl) with ESMTP id 46H85X1W188769
 for <intel-xe@lists.freedesktop.org>; Wed, 17 Jul 2024 09:05:33 +0100
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
 by rly11d.srv.mailcontrol.com (MailControl) id 46H85MAg183633
 for intel-xe@lists.freedesktop.org; Wed, 17 Jul 2024 09:05:22 +0100
Received: from DU2PR03CU002.outbound.protection.outlook.com
 (mail-northeuropeazlp17012029.outbound.protection.outlook.com [40.93.64.29])
 by rly11d-eth0.srv.mailcontrol.com (envelope-sender illevi@habana.ai)
 (MIMEDefang) with ESMTP id 46H85LsL183305 (TLS bits=256 verify=OK)
 for intel-xe@lists.freedesktop.org; Wed, 17 Jul 2024 09:05:22 +0100 (BST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f9XrqRYP9hgUh0i2pwFLjHLu5gWTjEpGqSD9IxY8BOt/XfScVCa+3/6cFaghk7FQ/qYTjvQY42S8+vJVhq1u4nFngkfbFxP9a3js2xSOSDCBY0Hh6KVpFizoWd/apV08pnXq+GlcKqNvGCLR/jFernhc90tgPG//yhlzIDlmiAW7Nh0USiKfgo8rRygixgtjBGBRxCa4HSkquAghw5JDD2pReXix3AzFBnLyYW8OPhlZFwABaeADwRXJBrniKseWm4He9GJUR+Y5e3nnhKGhF5+6jsXX2EdEwL91gj6UZsCJoDPksQbIjUosAZZs83reB44FBCzCXJu777WJlPeG8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=isyvwt7XlFG5RdxinXhEYVMoFstujLFeIcT84ohXhB4=;
 b=Jw0ZrxV8h8ZZyVrhv8xXbDAzXOJTKTRDvGYphyoWiGan93L92C0nOtiriFQ5EmXr1rpXGulp72YJOWWKIcSFjIAV9LqJnNMRpzN2uQpDVeMAVR4W9mMkGiEQCiiexMWlmUbpcve9e3XQVAkYDcNAQ4YJhxwNhm0yJL2B2eYGZRqPwdz53I2Qp3bQYH2bUPCPop0XwsKUh1NsibYrAten7vCAp72AHX5z3b08iiC0kdFZp/62yJRcW90qKWTo1DEjHQwg4b8fjGHzAril26jFjDhC8ihm54p4YdBE+0eFCNjRO+DdnJneA/GkMfLpnPB/3H6Tpxia1kS5e72fvtwgSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=habana.ai; dmarc=pass action=none header.from=habana.ai;
 dkim=pass header.d=habana.ai; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=habana.ai; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=isyvwt7XlFG5RdxinXhEYVMoFstujLFeIcT84ohXhB4=;
 b=bVuyRBl4r3c35TMbTxSV1HSLq7iZZZ+TvyN+EDnv4HjjrABfxJQNzENlYB2ZxbKL7VyHQapE4qbGI3sBuuspyWfYcTx0EPeqYH66Q3wr2E0/8Ai9Qx845G0FbaA3n6n8q0JK+qaen7M65jhi9AYiQ2rT+W/dWG3x1YH/F7apSskB1+591Vp56WyWrNnU8wBnY2ZsYyLl+NlhyI04afjVAW1RuaSa+prKQZl5sIUxNecaCIsVz0Dp64x7NoDf+f0Az7aP/aeFrOby/U2VE/1wAFP4tY0AACZbgPplghx9SrQkRfJfH5d02TDeLfPP+Kq7FCs6XvoOirLtoXOCyFn4Tw==
Received: from VE1PR02MB5487.eurprd02.prod.outlook.com (2603:10a6:803:115::17)
 by VI0PR02MB10896.eurprd02.prod.outlook.com (2603:10a6:800:20a::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.29; Wed, 17 Jul
 2024 08:05:14 +0000
Received: from VE1PR02MB5487.eurprd02.prod.outlook.com
 ([fe80::dad5:9548:aab2:219d]) by VE1PR02MB5487.eurprd02.prod.outlook.com
 ([fe80::dad5:9548:aab2:219d%6]) with mapi id 15.20.7784.016; Wed, 17 Jul 2024
 08:05:13 +0000
From: Ilia Levi <illevi@habana.ai>
To: "Vishwanathapura, Niranjana" <niranjana.vishwanathapura@intel.com>, Dani
 Liberman <dliberman@habana.ai>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "rodrigo.vivi@intel.com" <rodrigo.vivi@intel.com>
Subject: Re: [PATCH v2 5/8] drm/xe: move the kernel lrc from hwe to execlist
 port
Thread-Topic: [PATCH v2 5/8] drm/xe: move the kernel lrc from hwe to execlist
 port
Thread-Index: AQHayI9LDjRVe9sj0UipzWtKKZj0CrHvk9CAgAsbK4A=
Date: Wed, 17 Jul 2024 08:05:13 +0000
Message-ID: <5c14fd08-9c41-4000-9fcf-ddf34fc1a2ff@habana.ai>
References: <20240627124043.2923586-1-dliberman@habana.ai>
 <20240627124043.2923586-6-dliberman@habana.ai>
 <Zo4qMybgv6tVoLAR@nvishwa1-DESK>
In-Reply-To: <Zo4qMybgv6tVoLAR@nvishwa1-DESK>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=habana.ai;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VE1PR02MB5487:EE_|VI0PR02MB10896:EE_
x-ms-office365-filtering-correlation-id: cd5c1967-f415-433d-83df-08dca6372fed
x-ld-processed: 0d4d4539-213c-4ed8-a251-dc9766ba127a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?MzI1Rm5LN2R2NjVZMzlUaHpQdTV3R0U0SEoxbENOUUxUb1pJQ20wamxSNEE3?=
 =?utf-8?B?Y0g4OXBBc25Yb1lVWWhhakNYOGZQR0hLSDIrcTEvVTk1WjN6REs2MTBjbFQ4?=
 =?utf-8?B?Y1VFakhSenIwbUxCaktDenFVb1F2RHJTeWFQQnUwOFV4NitPTHFVMURoUmJq?=
 =?utf-8?B?L2hSazlqMEwzRFo2dm0rRlo2T1dYOElQTUtBVk84bGRZVUNQU3JqRXBlM0J0?=
 =?utf-8?B?OUZCcmt6WUtmRERUV1Nya0ozRHkrZ1BMV0huWGlYVHdqSEdKM2N2ODIrZTUw?=
 =?utf-8?B?Q09SVFFWbE1Fa3QwR0xuSG9zNnZvTTVzNnpNNVdlZ2xad3ZlOWFMTUNEUzk1?=
 =?utf-8?B?bThQK2FRaVJQTFVISGptY1FaOURobk9pVFp4TVkyY3dqRzBGcU9KQkJTNkNL?=
 =?utf-8?B?bUJMNnpDWjRsdVB1YjB1VmZoOGNOKzJyNy9vdnNHVmxkNGN6dDVISWNRbzRt?=
 =?utf-8?B?Ty9seWhoSnowREFkMERwdEpIRUNJVkx3U0lHbGR5cXMxSVlmTWhHeGx4c1Nw?=
 =?utf-8?B?MlFxQ1lmd1lvdllxK09rd0ZSM2lLek9wTVFMbFBMU1R3aTFKeHduOFhQaHMr?=
 =?utf-8?B?SHV1Q2RXK2VQUXNnMmxXclA0K3pXaCtoVDJLdDNXeGQrUGhBc2JwY0tvR2s3?=
 =?utf-8?B?TFVrQSs5SVMzUEJWbWlNelV2TW5MMkMxQkQvL0pPRllnd2xRN2tJVkNaNlpo?=
 =?utf-8?B?YVZRRXdOcVNGQ01PbC82VDBtcDU3WWZleFNZSldiU0MyWS9NL0I4aDR6UWdY?=
 =?utf-8?B?eFdmMHFIYUpKcDFzNUxMVWJQbjBZcGpaNmlmTnhzZms2Zzh4ZmxDZDdRL1NL?=
 =?utf-8?B?akJKeEtvVlhBb1NxMVI1ckVyckxwbzR2a2JYTEZjcFI0a2k0ZUN2UnBuZDIv?=
 =?utf-8?B?YXBZMXBoaDRud3VNdmE5RnliNkpHK1hHZWRDaG5MNzh3Q3o3YkhKelNDMDFt?=
 =?utf-8?B?ekRjeUdSUExOQVdwYndqWmZBc2ZpL2VBNDg4K0R6OFpTUnBkcHhWQTZzQUNX?=
 =?utf-8?B?NVJNUGE5QThGbmlYYXpaWUtES0lJTFNUVE50ZU1ueGdUMndvU2ZnWTJPT0Nn?=
 =?utf-8?B?ZUtWb2hLSWtkeXhmeitVZE1tdmVSa1JqTFFXWHRrNktGQVYyOTJuVzVyRjRL?=
 =?utf-8?B?dXRPWDBiVTkrbm5lTE9pYm56cS9nUndTRjVxUDlZNFdMR0hvSmIvbEdSTUtC?=
 =?utf-8?B?NHU5TW8wUURFc0paRytmZ1kvbzFmN1ZHWGtiZlUvNDNmM1RuUGpCZk5Ca1RK?=
 =?utf-8?B?Q1lEbnBRZE5oMFg5UDdUbUUrMFBQOERQdlo0cG5kN2Y0b0Z6LzE4VlpiQWox?=
 =?utf-8?B?dWRoY3NETWlsdXArUGgyQ0R4SFBkTnZLUWtBQlNZbDFZNC96aGFSWnI4TXFs?=
 =?utf-8?B?Q05Uam1YUXBkeWEvRlFUQXZLdDhHazZ5SmwySGQwT1RYWGE3dDB1bCt4c1lL?=
 =?utf-8?B?bXQrYmxPRmJ4ZWsxWGs3THgyczlUNzNjdVk1akxsMmsrcXNIYklpY0x3WG5D?=
 =?utf-8?B?V1B0ZHNTdDl1d241NWpQQVhGRlRnV3VpaVJxdHBxVERIR3NrWldaS2pXdFlI?=
 =?utf-8?B?cXRJWG5JUWlqa3lwZEY0RGJMbkxvQnQwcTZHTjVES1hSZDQ2WWZxWUlqeFo2?=
 =?utf-8?B?cWI1WXZTNEhJZy9idnJMY2I2UTlwM3ZGeUVZM2xrS0Ztd1dqMmY0dHBnZkJM?=
 =?utf-8?B?YUZUZnRrWGhuVi9JUzBBeXdBbjlMZVRVQXhGM284ZGh2blFmK1NYcmw0M2Zo?=
 =?utf-8?B?ZWYwZ2RkSHE0UVNvd1ZqY0h3OXdwSnJzbUd0Tys2N3hkczNUWnlMVVhLMEZt?=
 =?utf-8?B?ak51eEp5UkR6VXk3Z0NqUGhrNktBTG84dHFzalBTUWpaWXI3eDQrS0RJZDkr?=
 =?utf-8?B?SldSdXoyR011U2xjaUcvbmY5WHhwSkh5UXU0MVpUUFMzU1E9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VE1PR02MB5487.eurprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZkdpTTBTWmdNNStLYzcvb3VKRWxEcEoraUNTWlFVbmdRTVZmZi9wVWJ1VmQx?=
 =?utf-8?B?b0lKRUJBQXNVT2NWQklSVXJOVFZXM2ZZa25XTHpPcmljeUNSU0E2N2I4bFU5?=
 =?utf-8?B?S3N0VVVnL0JhektWMjNLUGtoOXpqTjI5YUswU1JUdHRTMG1JNDBPSHkzUHhB?=
 =?utf-8?B?cE0zY3lTV3A5Wkc1TzlEU1VySGEvYnVIU0lTbGlnOXN5UDUvdmhuaG5BemVR?=
 =?utf-8?B?OUVmOHRadnI2anovV05EYThGcUJpZGUyc3NiZU04K1c1Q1FIUjJtaFBUc3Vo?=
 =?utf-8?B?bFBia0V0cjlqV2J6T1VZc3JtT05EQjNKNkpiRGk4am9sMUhTQWhYdGlobDhh?=
 =?utf-8?B?bHY5K0p0clJTdEluUUtOSWY5Uks1eklubmRHRlBuTXpUS1YzTS9JYWxobENi?=
 =?utf-8?B?QnVBNFpjdGRybGlWQ3RoNGpJT3hHV2tFS28ya2trWlp1YnhjU2FJQjlYNFB4?=
 =?utf-8?B?RWp1Rk9iK002SlUwdFN4M3dLekd3VDN0Y2ZadWNablFNWFF5L0RkN3VFTGFa?=
 =?utf-8?B?dm9HQ3RoOUJrbW43Q3lJK2RVZi9wbEdFUGdhcUt3S21qREEzZHhSeTZBdFNH?=
 =?utf-8?B?UmRmWGtsQUt5ZGhTTHRxQmJnVGJJUzVxelVJajZCRlIwZndxOTFKN3F4ZWtp?=
 =?utf-8?B?ZE9xYTdMR3VUT3JLZXBFaFRoM0d1eXVZWXB3cEVmMC8vNVZMY3JLcmNqUXNl?=
 =?utf-8?B?b0QxK0hDWWJiRHhyOXlhNll4Q3M1YmpJT1NRSEsvbmhqRHo4ejBPb0pXUWZ5?=
 =?utf-8?B?NElhWkdncmo4UkRxNGYxU01IQWNxM3NEckVENnE2c2lreW83L0pzUDFlbGJw?=
 =?utf-8?B?ME1lZ21qaTMyZjkxWEFta3p5MlBvelBaeW5GNXp6U09LK0tXblBRVmdYN1Bt?=
 =?utf-8?B?aElKTUptRWVwTVRUN25LL3lBZjdTVmNKWXAveWRPamM4bU9UblZLeDZDN1NL?=
 =?utf-8?B?ajRxT0UwMG5udUcxZnBSbFZYSGVXMmtjcnZkNjZZYlAzL1RIZ0NJbjdFZnFB?=
 =?utf-8?B?aFhYT252V1dUOXpyRXkzaFRyS0RnRFNYYmVabVVINGNleWxqL1I5R1l1U0ow?=
 =?utf-8?B?Sk83b1VFcGt1UFQwNVZwZGV0MlRkNWRUaDBvVEgvNlkyV3lrWjcyUjJtdlp3?=
 =?utf-8?B?RTBiVW9uMHYxYitFMG9HcVV0eTlGbjlBRmNoejgzS2VEY3BhME00U3gzVHRi?=
 =?utf-8?B?MUNHbUM5VDVFT0ZuRmExcWRKS1FRQ3c3WThNM2J3eldvUUpjSHBienovbHI0?=
 =?utf-8?B?bGkxcHRFYjV1VkZVenp5bzRIT2ZzVmI0OVgzc2dDVXFjcThNRStrdDJCdTEz?=
 =?utf-8?B?cGxJSWFMYytKck5zajBDY3E1M1FqN1poMWI1UytxUzZONUtDQ0g4c1VkbkhL?=
 =?utf-8?B?cmhVUmJYcC9sR0FsdEkrOW9Ua095VGp4aFpuYmM2TXhZcWI2MW1xNmRaeXZy?=
 =?utf-8?B?bHR6Zyt1TFJHLzFrbkx0YVI5QUxLZk9QR3gzUUpHdFA3V0lsMnRKalFYTXZs?=
 =?utf-8?B?MU1lQ0ZMc0IzZVQyNXQwMFhWR1BkMG9DZ2hublNrT2E4eG5QWEhTTTE1clU3?=
 =?utf-8?B?NS9oTTdLbTJDcGNsMTM3TkdGM1YrY1lqRTB4WkFDTko0ZS91dmxMclVYeEly?=
 =?utf-8?B?M0syZFV6R3hneTd4a001c0xBYW5ZaFovWHd4UlFOa3A3VTNtSHRvbmJLYkI5?=
 =?utf-8?B?aFpnaXZzajV1Ynp0bU5wK2diWTFLNTdWU09CL1VJZmx2aFpTUy9zL2tjV3dE?=
 =?utf-8?B?ZDd3Q3BtdWU0K3JMMWU2eTVHQkJ1UXk5QnM0K3Vvb0szQy80TWpXUk1NeWF4?=
 =?utf-8?B?L3VVRVNJK2ROdEQyeGYreS9haXZ4enNmVFJCNzJVWVJWc01ULzZ2dlFvSjVv?=
 =?utf-8?B?dGVVaDRaVnh4VmVLZmxjZGh6eGVtWDRGcDcxUjFwU1NyS2RUZURramIxOUlH?=
 =?utf-8?B?TUsrTmtDZkFwbVRsVFZEdEpDM2JYdUN4OWorOVB2K2V4Z0xZcHp3dUhqZG5k?=
 =?utf-8?B?dXEzTUE2R0ZldlNMOXgzcTFLRWxicmFDNjcrRnFsTjNmWEdubXBBVkdwUWVE?=
 =?utf-8?B?c3JEdkcvWTNXellHSnVaYTB0c3ROUEFNNXRjRlhuZkV0VlJWVDhOSWlER2Fo?=
 =?utf-8?Q?hVvE=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <51130F0F46F1C345A5950EE77708FC42@eurprd02.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: AGZFlagdsjMtAzoY2lgGg6oNnvRu955FEzFh1G0Yfpdq0W0QUsiHb9riv5NuSW+LDdetdX28cdKmlMj4XggzneLN+occz0ReltJYOpdgZtP/ZAUXhGDJ+COgAiTwxgBGOh4Q4xtxDOx5E7UBJiV6sJyq/eBbBzaDU+6lZdY05nT6opzuykWf8+TAR7QM+r3UpQRFl2edWwxKbY1Qrjl/RcTbrUl34zvaMsoOwt63fgopvPYwN+q+Au42005mVaQ/stbFMU+Xnz7R+2/zlk5pbsukBz85yVwsrEbXFwWuocKJw+++WUFhCDqko+ddtTHvVIlK7rpW8201c6FSH1WscqX+nfARnbmtYmsSCBonhkNX5Fb8vO2drEVV+XvyJoSBDwX5xFrq3KPT4DshS0JA+6VhZ7Ql5lwa0E5pUV+ZsiU3/AgKDuBS6UdW9L6KM83hG7qxlq49v8GlEShrhE9M9dVMjA/sYI+5m8pZ1z7bW3KFGDvWfRoA+woz2nxpstALND4ayOSaNdwioKesxWzPHpW3rqaVtovCJ4INQYNBo/AN0jkK5KULmVdNwTVMcpx/aWrH//n32slhBP/a2TQzvjpWy3l+yy8OvONoa1NynLF2pvyBXB9BrRvMhPKhDtoN
X-OriginatorOrg: habana.ai
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VE1PR02MB5487.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cd5c1967-f415-433d-83df-08dca6372fed
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jul 2024 08:05:13.6828 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d4d4539-213c-4ed8-a251-dc9766ba127a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8kwngTQkFHZVmf2Je3OAvHxQb3iYeNXbGkVktYxYugqORK+CrYI9URWQeNFBTLa5w3xHewHT/Ra1pgzSS9QO7g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR02MB10896
X-MailControlDKIMCheck: cGFzcyBoYWJhbmEuYWkgW3Bhc3Nd
X-MailControl-OutInfo: MTcyMTIwMzUzNDpGUEtleTEucHJpdjpE9jzDEaK/h71enBwBKvFA5bzFjg6pcqukUldy7nbt79CVNCypEYdB8tdcLbVt/KfAztd+fxtLX6SNQaIw0Mss8/cBSQ69k5WTdLHAwjGZsXF0H8xtQR+paF6W2h5EkqtffDzi1kyqJBC+XC+455ZO8xdXuFE7xHJZkDaioO0I//hLTUbqscVXlHas1ycL+XfyL+MEtamPhwzbfX6HNb0hfbSrQosauBv8jRQJIsxtPGalST5C/V1GdBUBpM39vQgZkzW2UXm2mta4OyCuS+wxgqwWrYHQPf4RdSkMR4PKUW6wxIfAfH1NS3IUP886RV5kMXIpVfDEJXdGjPGH4vxy
X-Scanned-By: MailControl 44278.2145 (www.mailcontrol.com) on 10.68.1.121
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

T24gMTAvMDcvMjAyNCA5OjI5LCBOaXJhbmphbmEgVmlzaHdhbmF0aGFwdXJhIHdyb3RlOg0KPiBP
biBUaHUsIEp1biAyNywgMjAyNCBhdCAwMzo0MDo0MFBNICswMzAwLCBEYW5pIExpYmVybWFuIHdy
b3RlOg0KPj4gRnJvbTogSWxpYSBMZXZpIDxpbGxldmlAaGFiYW5hLmFpPg0KPj4NCj4+IFRoZSBr
ZXJuZWwgbHJjIGlzIHVzZWQgc29sZWx5IGJ5IHRoZSBleGVjbGlzdCBpbmZyYS4NCj4+IFdlIG1v
dmUgaXQgdG8gdGhlIGV4ZWNsaXN0IHBvcnQgc3RydWN0IGFuZCBpbml0aWFsaXplIGl0IG9ubHkg
d2hlbg0KPj4gZXhlY2xpc3RzIGFyZSB1c2VkLg0KPj4NCj4NCj4gV2h5IGlzIHRoaXMgcGF0Y2gg
cGFydCBvZiB0aGlzIHNlcmllcz8NCj4gVGhpcyBwYXRjaCBwZXJoYXBzIHNob3VsZCBnbyBhaGVh
ZCBhcyBhIHN0YW5kYWxvbmUgcGF0Y2g/DQo+DQo+IE5pcmFuamFuYQ0KPg0KSWRlYWxseSB5ZXMs
IGl0IGNvdWxkIGJlIHN1Ym1pdHRlZCBhcyBhIHN0YW5kYWxvbmUgcGF0Y2guDQpJJ3ZlIGFkZGVk
IHRoaXMgaGVyZSB0byBhdm9pZCBkZXBlbmRlbmN5IG9uIHRoaXMgcGF0Y2gsIGFzIGEgbGF0ZXIg
cGF0Y2ggaW4NCnRoaXMgc2VyaWVzIGFkZHMgbXNpeCB2ZWN0b3IgYXJndW1lbnQgdG8geGVfbHJj
X2NyZWF0ZS4gVGhlIHBhdGNoIGFsbG93ZWQNCnRoZSBhbGxvY2F0ZWQgbXNpeCB2ZWN0b3IgdG8g
YmUgc3RvcmVkIGluIHhlX2V4ZWNsaXN0X3BvcnQgcmF0aGVyIHRoYW4gaW4NCnhlX2h3X2VuZ2lu
ZS4gSXQgaXMgbGVzcyByZWxldmFudCBpbiB2MywgYmVjYXVzZSB3ZSBub3cgdXNlIGRlZmF1bHQg
bXNpeA0KaW5zdGVhZCBvZiBhIGR5bmFtaWNhbGx5IGFsbG9jYXRlZCBvbmUsIGJ1dCBJIGxlZnQg
aXQgYXMgcGFydCBvZiB0aGUgc2VyaWVzDQpmb3Igc2ltcGxpY2l0eSdzIHNha2UuDQoNCklsaWEN
Cj4+IFNpZ25lZC1vZmYtYnk6IElsaWEgTGV2aSA8aWxsZXZpQGhhYmFuYS5haT4NCj4+IC0tLQ0K
Pj4gZHJpdmVycy9ncHUvZHJtL3hlL3hlX2V4ZWNsaXN0LmPCoMKgwqDCoMKgwqDCoCB8IDEwICsr
KysrKysrLS0NCj4+IGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9leGVjbGlzdF90eXBlcy5owqAgfMKg
IDIgKysNCj4+IGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9od19lbmdpbmUuY8KgwqDCoMKgwqDCoCB8
IDE1ICsrLS0tLS0tLS0tLS0tLQ0KPj4gZHJpdmVycy9ncHUvZHJtL3hlL3hlX2h3X2VuZ2luZV90
eXBlcy5oIHzCoCAyIC0tDQo+PiA0IGZpbGVzIGNoYW5nZWQsIDEyIGluc2VydGlvbnMoKyksIDE3
IGRlbGV0aW9ucygtKQ0KPj4NCj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUveGVf
ZXhlY2xpc3QuYyANCj4+IGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2V4ZWNsaXN0LmMNCj4+IGlu
ZGV4IGRiOTA2MTE3ZGI2ZC4uMzU0Zjg1YjU5MWIxIDEwMDY0NA0KPj4gLS0tIGEvZHJpdmVycy9n
cHUvZHJtL3hlL3hlX2V4ZWNsaXN0LmMNCj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9l
eGVjbGlzdC5jDQo+PiBAQCAtMTIzLDggKzEyMyw4IEBAIHN0YXRpYyB2b2lkIF9feGVfZXhlY2xp
c3RfcG9ydF9pZGxlKHN0cnVjdCANCj4+IHhlX2V4ZWNsaXN0X3BvcnQgKnBvcnQpDQo+PiDCoMKg
wqDCoGlmICghcG9ydC0+cnVubmluZ19leGwpDQo+PiDCoMKgwqDCoMKgwqDCoCByZXR1cm47DQo+
Pg0KPj4gLcKgwqDCoCB4ZV9scmNfd3JpdGVfcmluZyhwb3J0LT5od2UtPmtlcm5lbF9scmMsIG5v
b3AsIHNpemVvZihub29wKSk7DQo+PiAtwqDCoMKgIF9fc3RhcnRfbHJjKHBvcnQtPmh3ZSwgcG9y
dC0+aHdlLT5rZXJuZWxfbHJjLCAwKTsNCj4+ICvCoMKgwqAgeGVfbHJjX3dyaXRlX3JpbmcocG9y
dC0+bHJjLCBub29wLCBzaXplb2Yobm9vcCkpOw0KPj4gK8KgwqDCoCBfX3N0YXJ0X2xyYyhwb3J0
LT5od2UsIHBvcnQtPmxyYywgMCk7DQo+PiDCoMKgwqDCoHBvcnQtPnJ1bm5pbmdfZXhsID0gTlVM
TDsNCj4+IH0NCj4+DQo+PiBAQCAtMjYyLDYgKzI2MiwxMCBAQCBzdHJ1Y3QgeGVfZXhlY2xpc3Rf
cG9ydCANCj4+ICp4ZV9leGVjbGlzdF9wb3J0X2NyZWF0ZShzdHJ1Y3QgeGVfZGV2aWNlICp4ZSwN
Cj4+DQo+PiDCoMKgwqDCoHBvcnQtPmh3ZSA9IGh3ZTsNCj4+DQo+PiArwqDCoMKgIHBvcnQtPmxy
YyA9IHhlX2xyY19jcmVhdGUoaHdlLCBOVUxMLCBTWl8xNkspOw0KPj4gK8KgwqDCoCBpZiAoSVNf
RVJSKHBvcnQtPmxyYykpDQo+PiArwqDCoMKgwqDCoMKgwqAgcmV0dXJuIEVSUl9QVFIoUFRSX0VS
Uihwb3J0LT5scmMpKTsNCj4+ICsNCj4+IMKgwqDCoMKgc3Bpbl9sb2NrX2luaXQoJnBvcnQtPmxv
Y2spOw0KPj4gwqDCoMKgwqBmb3IgKGkgPSAwOyBpIDwgQVJSQVlfU0laRShwb3J0LT5hY3RpdmUp
OyBpKyspDQo+PiDCoMKgwqDCoMKgwqDCoCBJTklUX0xJU1RfSEVBRCgmcG9ydC0+YWN0aXZlW2ld
KTsNCj4+IEBAIC0yODcsNiArMjkxLDggQEAgdm9pZCB4ZV9leGVjbGlzdF9wb3J0X2Rlc3Ryb3ko
c3RydWN0IA0KPj4geGVfZXhlY2xpc3RfcG9ydCAqcG9ydCkNCj4+IMKgwqDCoMKgc3Bpbl9sb2Nr
X2lycSgmZ3RfdG9feGUocG9ydC0+aHdlLT5ndCktPmlycS5sb2NrKTsNCj4+IMKgwqDCoMKgcG9y
dC0+aHdlLT5pcnFfaGFuZGxlciA9IE5VTEw7DQo+PiDCoMKgwqDCoHNwaW5fdW5sb2NrX2lycSgm
Z3RfdG9feGUocG9ydC0+aHdlLT5ndCktPmlycS5sb2NrKTsNCj4+ICsNCj4+ICvCoMKgwqAgeGVf
bHJjX3B1dChwb3J0LT5scmMpOw0KPj4gfQ0KPj4NCj4+IHN0YXRpYyBzdHJ1Y3QgZG1hX2ZlbmNl
ICoNCj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfZXhlY2xpc3RfdHlwZXMu
aCANCj4+IGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2V4ZWNsaXN0X3R5cGVzLmgNCj4+IGluZGV4
IGY5NGJiZjRjNTNlNC4uNDE1MTQwOTM2ZjExIDEwMDY0NA0KPj4gLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL3hlL3hlX2V4ZWNsaXN0X3R5cGVzLmgNCj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94
ZV9leGVjbGlzdF90eXBlcy5oDQo+PiBAQCAtMjcsNiArMjcsOCBAQCBzdHJ1Y3QgeGVfZXhlY2xp
c3RfcG9ydCB7DQo+PiDCoMKgwqDCoHN0cnVjdCB4ZV9leGVjbGlzdF9leGVjX3F1ZXVlICpydW5u
aW5nX2V4bDsNCj4+DQo+PiDCoMKgwqDCoHN0cnVjdCB0aW1lcl9saXN0IGlycV9mYWlsOw0KPj4g
Kw0KPj4gK8KgwqDCoCBzdHJ1Y3QgeGVfbHJjICpscmM7DQo+PiB9Ow0KPj4NCj4+IHN0cnVjdCB4
ZV9leGVjbGlzdF9leGVjX3F1ZXVlIHsNCj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
eGUveGVfaHdfZW5naW5lLmMgDQo+PiBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9od19lbmdpbmUu
Yw0KPj4gaW5kZXggNzhiNTBkM2E2NTAxLi45MDY2MGQ5MzgyYTAgMTAwNjQ0DQo+PiAtLS0gYS9k
cml2ZXJzL2dwdS9kcm0veGUveGVfaHdfZW5naW5lLmMNCj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS94ZS94ZV9od19lbmdpbmUuYw0KPj4gQEAgLTI2OSw3ICsyNjksNiBAQCBzdGF0aWMgdm9pZCBo
d19lbmdpbmVfZmluaShzdHJ1Y3QgZHJtX2RldmljZSANCj4+ICpkcm0sIHZvaWQgKmFyZykNCj4+
DQo+PiDCoMKgwqDCoGlmIChod2UtPmV4bF9wb3J0KQ0KPj4gwqDCoMKgwqDCoMKgwqAgeGVfZXhl
Y2xpc3RfcG9ydF9kZXN0cm95KGh3ZS0+ZXhsX3BvcnQpOw0KPj4gLcKgwqDCoCB4ZV9scmNfcHV0
KGh3ZS0+a2VybmVsX2xyYyk7DQo+Pg0KPj4gwqDCoMKgwqBod2UtPmd0ID0gTlVMTDsNCj4+IH0N
Cj4+IEBAIC01MjgsMjEgKzUyNywxMyBAQCBzdGF0aWMgaW50IGh3X2VuZ2luZV9pbml0KHN0cnVj
dCB4ZV9ndCAqZ3QsIA0KPj4gc3RydWN0IHhlX2h3X2VuZ2luZSAqaHdlLA0KPj4gwqDCoMKgwqDC
oMKgwqAgZ290byBlcnJfbmFtZTsNCj4+IMKgwqDCoMKgfQ0KPj4NCj4+IC3CoMKgwqAgaHdlLT5r
ZXJuZWxfbHJjID0geGVfbHJjX2NyZWF0ZShod2UsIE5VTEwsIFNaXzE2Syk7DQo+PiAtwqDCoMKg
IGlmIChJU19FUlIoaHdlLT5rZXJuZWxfbHJjKSkgew0KPj4gLcKgwqDCoMKgwqDCoMKgIGVyciA9
IFBUUl9FUlIoaHdlLT5rZXJuZWxfbHJjKTsNCj4+IC3CoMKgwqDCoMKgwqDCoCBnb3RvIGVycl9o
d3NwOw0KPj4gLcKgwqDCoCB9DQo+PiAtDQo+PiDCoMKgwqDCoGlmICgheGVfZGV2aWNlX3VjX2Vu
YWJsZWQoeGUpKSB7DQo+PiDCoMKgwqDCoMKgwqDCoCBod2UtPmV4bF9wb3J0ID0geGVfZXhlY2xp
c3RfcG9ydF9jcmVhdGUoeGUsIGh3ZSk7DQo+PiDCoMKgwqDCoMKgwqDCoCBpZiAoSVNfRVJSKGh3
ZS0+ZXhsX3BvcnQpKSB7DQo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGVyciA9IFBUUl9FUlIo
aHdlLT5leGxfcG9ydCk7DQo+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBnb3RvIGVycl9rZXJu
ZWxfbHJjOw0KPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZ290byBlcnJfaHdzcDsNCj4+IMKg
wqDCoMKgwqDCoMKgIH0NCj4+IC3CoMKgwqAgfQ0KPj4gLQ0KPj4gLcKgwqDCoCBpZiAoeGVfZGV2
aWNlX3VjX2VuYWJsZWQoeGUpKSB7DQo+PiArwqDCoMKgIH0gZWxzZSB7DQo+PiDCoMKgwqDCoMKg
wqDCoCAvKiBHU0NDUyBoYXMgYSBzcGVjaWFsIGludGVycnVwdCBmb3IgcmVzZXQgKi8NCj4+IMKg
wqDCoMKgwqDCoMKgIGlmIChod2UtPmNsYXNzID09IFhFX0VOR0lORV9DTEFTU19PVEhFUikNCj4+
IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgaHdlLT5pcnFfaGFuZGxlciA9IHhlX2dzY19od2VfaXJx
X2hhbmRsZXI7DQo+PiBAQCAtNTU3LDggKzU0OCw2IEBAIHN0YXRpYyBpbnQgaHdfZW5naW5lX2lu
aXQoc3RydWN0IHhlX2d0ICpndCwgDQo+PiBzdHJ1Y3QgeGVfaHdfZW5naW5lICpod2UsDQo+Pg0K
Pj4gwqDCoMKgwqByZXR1cm4gZHJtbV9hZGRfYWN0aW9uX29yX3Jlc2V0KCZ4ZS0+ZHJtLCBod19l
bmdpbmVfZmluaSwgaHdlKTsNCj4+DQo+PiAtZXJyX2tlcm5lbF9scmM6DQo+PiAtwqDCoMKgIHhl
X2xyY19wdXQoaHdlLT5rZXJuZWxfbHJjKTsNCj4+IGVycl9od3NwOg0KPj4gwqDCoMKgwqB4ZV9i
b191bnBpbl9tYXBfbm9fdm0oaHdlLT5od3NwKTsNCj4+IGVycl9uYW1lOg0KPj4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9od19lbmdpbmVfdHlwZXMuaCANCj4+IGIvZHJpdmVy
cy9ncHUvZHJtL3hlL3hlX2h3X2VuZ2luZV90eXBlcy5oDQo+PiBpbmRleCA3MGU2NDM0ZjE1MGQu
LjJiNzRkZDEwOThhNyAxMDA2NDQNCj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9od19l
bmdpbmVfdHlwZXMuaA0KPj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2h3X2VuZ2luZV90
eXBlcy5oDQo+PiBAQCAtMTM2LDggKzEzNiw2IEBAIHN0cnVjdCB4ZV9od19lbmdpbmUgew0KPj4g
wqDCoMKgwqBlbnVtIHhlX2ZvcmNlX3dha2VfZG9tYWlucyBkb21haW47DQo+PiDCoMKgwqDCoC8q
KiBAaHdzcDogaGFyZHdhcmUgc3RhdHVzIHBhZ2UgYnVmZmVyIG9iamVjdCAqLw0KPj4gwqDCoMKg
wqBzdHJ1Y3QgeGVfYm8gKmh3c3A7DQo+PiAtwqDCoMKgIC8qKiBAa2VybmVsX2xyYzogS2VybmVs
IExSQyAoc2hvdWxkIGJlIHJlcGxhY2VkIC93IGFuIHhlX2VuZ2luZSkgKi8NCj4+IC3CoMKgwqAg
c3RydWN0IHhlX2xyYyAqa2VybmVsX2xyYzsNCj4+IMKgwqDCoMKgLyoqIEBleGxfcG9ydDogZXhl
Y2xpc3RzIHBvcnQgKi8NCj4+IMKgwqDCoMKgc3RydWN0IHhlX2V4ZWNsaXN0X3BvcnQgKmV4bF9w
b3J0Ow0KPj4gwqDCoMKgwqAvKiogQGZlbmNlX2lycTogZmVuY2UgSVJRIHRvIHJ1biB3aGVuIGEg
aHcgZW5naW5lIElSUSBpcyByZWNlaXZlZCAqLw0KPj4gLS0gDQo+PiAyLjM0LjENCj4+DQoNCg==
