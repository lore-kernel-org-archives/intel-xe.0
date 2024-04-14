Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F27BC4345F
	for <intel-xe@archiver.kernel.org>; Sun, 14 Apr 2024 10:44:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAA3A10F626;
	Sun, 14 Apr 2024 10:44:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=habana.ai header.i=@habana.ai header.b="TDez/G32";
	dkim-atps=neutral
X-Greylist: delayed 1915 seconds by postgrey-1.36 at gabe;
 Sun, 14 Apr 2024 10:44:10 UTC
Received: from cluster-d.mailcontrol.com (cluster-d.mailcontrol.com
 [85.115.60.190])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F23C10F626
 for <intel-xe@lists.freedesktop.org>; Sun, 14 Apr 2024 10:44:10 +0000 (UTC)
Received: from rly10d.srv.mailcontrol.com (localhost [127.0.0.1])
 by rly10d.srv.mailcontrol.com (MailControl) with ESMTP id 43EACBww142767
 for <intel-xe@lists.freedesktop.org>; Sun, 14 Apr 2024 11:12:11 +0100
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
 by rly10d.srv.mailcontrol.com (MailControl) id 43EABQNV137937
 for intel-xe@lists.freedesktop.org; Sun, 14 Apr 2024 11:11:26 +0100
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2050.outbound.protection.outlook.com [104.47.14.50])
 by rly10d-eth0.srv.mailcontrol.com (envelope-sender obitton@habana.ai)
 (MIMEDefang) with ESMTP id 43EABPEO137900 (TLS bits=256 verify=OK)
 for intel-xe@lists.freedesktop.org; Sun, 14 Apr 2024 11:11:26 +0100 (BST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EK/xdjvgnTUyVFerXYznW00n5CwwJRAe+fc5envbIYDWfntZHAIxrztNDg0s+Voaq+ohmPGcjNdWzlhABM6Pm8erWHPYcOZLi+takO3g07k8TnAqQU3FGxx+iUsONEXopjSZEA+GLIMJGlagTzdLJaSiTnSp2QMzIdZcLKthvh9+Ai7fq6uSN8MhbKMK6YP5QMa7j+J2uccc6pNufYfMgOE9jd7PYha5mLjndk9GT8aYBckSa259gzNTCagHqCj6DTt49+TKVGnoOPg5sWqFYTVDXHqCqRbtkDuio+W/zPdCwdq4eQ/jbdOmoXlqgFo+sKyRhZ4s99ujyq/zkX5iuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kUGS0f3t6oF0gr8IPGUtGGIBHCoDzFMatMZuIOJaBvw=;
 b=iW3Yfrqcah2Vu2LsG3T0bLqSDzD234aWgMHTWWnNjXKElKEJ8rojtvBDIeuTtG+b2TsKhGmGQzCpMNtN0JD1RxNWsNwo66Do7riP8P9G2HE4tSu1bunDC1Rpiq2egejue4rMpb+DhU5Q64TPqgeN1WLCHwbctjzDkA32lp6klqcugGVK3eoCl3kuuiW2Wv7cd8SCyEhsXj4uoe2Cq700T/W/uR2VqyeX/SuuxD5CxYJmSJxSg1bqC7ijEE7BqbQoaFM1FyEMhhBNacl8CIznkdqaX7+O1ugNnNma0TJLCpA0nKeo/v8Ji6cvf3lVYPyp796IET68EKve3cXb+1dC5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=habana.ai; dmarc=pass action=none header.from=habana.ai;
 dkim=pass header.d=habana.ai; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=habana.ai; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kUGS0f3t6oF0gr8IPGUtGGIBHCoDzFMatMZuIOJaBvw=;
 b=TDez/G322WqrBZer2gnWE+vTUyB/LxqzR1cDqFmAj6Eq4CtkNzQu+NsxRLCpmOukSIFLhFL2G8qJxV6FNTISIYPYz2o7cR+kCxPHqUIOjTL7Nm805Oqp1af5RaueRwu2ZETixftAAIaTrHET1h9LC8DT0TXmkM+DlFI9sXz4DvbBF7CakkkrxZ2vcRc3U2TI4c4M2aSwblpNvi2WepKk0YkGzK9BV1H9DdSp2cOmG1SD3A9Snz5fI/Qe6xm+zEdx2KyMXY0HEFIkKDb+8Uza62U2Pco/omgqzHbW0Gagaaj+0gb1CF6X8+r0GJpBoJpGdB94hRV2umOkOvSdZigLDw==
Received: from DB9PR02MB6619.eurprd02.prod.outlook.com (2603:10a6:10:211::10)
 by DBAPR02MB6182.eurprd02.prod.outlook.com (2603:10a6:10:18e::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.49; Sun, 14 Apr
 2024 10:11:24 +0000
Received: from DB9PR02MB6619.eurprd02.prod.outlook.com
 ([fe80::2be5:b9fc:ad7d:27cc]) by DB9PR02MB6619.eurprd02.prod.outlook.com
 ([fe80::2be5:b9fc:ad7d:27cc%5]) with mapi id 15.20.7452.041; Sun, 14 Apr 2024
 10:11:24 +0000
From: Ofir Bitton <obitton@habana.ai>
To: Koby Elbaz <kelbaz@habana.ai>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v7 1/2] drm/xe: add a new debugfs file - mmio
Thread-Topic: [PATCH v7 1/2] drm/xe: add a new debugfs file - mmio
Thread-Index: AQHajkS6wQZw5AdpYU6SwTC2mnVPdbFni6wA
Date: Sun, 14 Apr 2024 10:11:24 +0000
Message-ID: <f1282e82-7134-423a-aa9c-2166cf84ba07@habana.ai>
References: <20240414081105.1199559-1-kelbaz@habana.ai>
In-Reply-To: <20240414081105.1199559-1-kelbaz@habana.ai>
Accept-Language: he-IL, en-US
Content-Language: he-IL
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=habana.ai;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB9PR02MB6619:EE_|DBAPR02MB6182:EE_
x-ms-office365-filtering-correlation-id: cd4a5eda-f622-463a-ada4-08dc5c6b3d97
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 79O2D34mCZR5Y8csGH/d1IAhPWkbVpecJKtoJlKG0W110eT8+nzKk1+UBkWAsjfNs4t/ZtqhducFSxxurJx/iHWoG1YXp6KUdxa5Plqs25OBC5gg+ZK/ekz9AK6/4hR8AQg/n1cITPKkTgG7Rw14r65Ly0rSY3FBuzMSacbf2LQGF5E/HjhE4XxJgz/HGg2OsUhwgoRd/E7yhVXyaT+fxa24fhIP81badHUNx67BLQIwgBcovpR8jX+iwVfU/UAQmuTI1DUPNbSK4Avqzc/rIpwqc9Pt86bT6pypx336IhaytzEp9r5hrvwBrxWalhDEKhuW89E66lPM7Kjn4oHOdobakTlY6tSO+FFN/w+4v3WN5GgJUHIGwxEFvb7bBcx8azwIRPF/nweTGdOGei+yChUgUm2KXeX+Z9KLVrqccg1zq+YDj28ZiSc1puFuEu5PX6J+q9FW/Jo2QO7dLZos8STtkeZvevuVt7Ol+W5Mm7CGzESrUTF3iMsihXj8PFosVikPve0KiPpwhbjJWJbR/sUf2rXblnLWFuTI8ya2/NI2jb6XhJPdENU9n3g7u7wHJfm4ZPHSveeoxi8Acv7IZgJmN48pQTx/2yhLPrabJqsllVUisPcp/ioK6E6PFZsrR4JQBpxedmklcT0T81QgmAmenBVN91SYfPJV1zF5Xqt9IAstX1L5jrhmsFk20DckmllCvI372xc4bEs7XRx35A==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB9PR02MB6619.eurprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cnNvSG9xZjRXMmRVbEZZbG93WHJoY3kxamovOUwxQVVTRTR1WEl0dzlaS3JM?=
 =?utf-8?B?TW4vbjVYdUY2VE1RM1dlTVVqL3hpblBYbjRpQzVnSndqVjRINm16RHRQM0ov?=
 =?utf-8?B?dnJQVDBxT09FdGdqWWxTYnBQSDNMa0t6Mnk2cVY3ZHNJeExVYlF6Q0d5aCtN?=
 =?utf-8?B?K2JiL0JDeHpSTXF0ZkU4S1EvZ0svemF2T00yRTM3NDhya2tVWXZqb1BYckdt?=
 =?utf-8?B?akt6bXVsL3d6WDBPSi9JM0ovR251Slg3UjAzWkRmSlUxTVBkMDh2aCsxMFI0?=
 =?utf-8?B?QUI1Y0xaZWZEZmp0bEtTYzdNZnY0dTRDY3NFRCsxcGVkTHFmRnlZOXJjdTd6?=
 =?utf-8?B?cm1UTUtxTUVMZ0czenVhMVBEcGY4ZEh2NzE1aVhFNkhJZFJLK3hhYU42Z0lU?=
 =?utf-8?B?ZTREZVZRUlBtOGlZclFJRU5OZ3ovei9TR3Zrdm90TGwyMDhzcVZrZVBNMEpo?=
 =?utf-8?B?RmFWR3pmZjVNTU5uRUpJRlduR3Zza2ZnU2VsazdCQVRsWTlTVnhEcXo3RGZW?=
 =?utf-8?B?d1UyRUNpaTdpbVBVN05FalVLK2xNZVdxaWVKMlNwTi9CRWxuZkNqY2thK3pv?=
 =?utf-8?B?Vll0T2FONWVnc0ZzRWhDQmhnTXhHNG5kdWowRW1TMGg3NzQ0WDZ5YzhuU1VV?=
 =?utf-8?B?R2F2VTd5akk4TVcxYmpkNndLVWtjdWlDNEU1Y2VXcGFuQlI2Y0M4NWVid2Yx?=
 =?utf-8?B?K2FCcU5vNHVjdTE1WXF5K0RjajdoaVpTZDVyUFAvYUg0Njd2azRnT2QzS3Zq?=
 =?utf-8?B?ZVRibnFWSzByRkw4VXFLanVGbVVha21uYXh5SDErZzZRYkZhMHhmVDJmNk1o?=
 =?utf-8?B?T3k5S0JPWlMwMzFuSDkycHZKYzNjNWRZbzBUSDlDSURHRFcxdll5aXoxSk10?=
 =?utf-8?B?Z3VzdjNKREtTdTJ6SnZjRTRGZG85aW1KNDR1YWtJLzJPN3BMcTJwYjFjN3VJ?=
 =?utf-8?B?dEIraitpcy9tQkJ5R3NwUGlzMHBuK3EybXFYaHhTNEpSQ0RjMFBqelpQQUdt?=
 =?utf-8?B?Mjlwd3ZGa040a0JPRGtTQ0JSUnYranVoNHJOTmd2SXM1R3U4QitqMGVZMldh?=
 =?utf-8?B?ejcwT1VpbVk5SWh6K3lpNXNqRjJGcmxwdXBVWkRIUnA2N043SFJvbERlZE5N?=
 =?utf-8?B?aEYyZUtzSnB0ckxMYmtFV2VheFl0YzY2YVpYVk1oN1RtL2VZcEMwczgyb0Nn?=
 =?utf-8?B?VGRCRGpLOGF5WVh0VXBZZ3BveS9CUThSRFJOb0VTT0RLR2d0QTlNM1poNVdK?=
 =?utf-8?B?UGdHT1ZUb1dxQmZwZ1lQRGJ6Nlc0M3hhbXJZQkwwcUFnNDRWc2YwVWxmVGRZ?=
 =?utf-8?B?VFcrMFBnSEtJeVQzUGhERnRwbEpHUHFYTWVsRzBVeHlWdHVRL1RiVUR3bzg1?=
 =?utf-8?B?YlRFYUVNa3dxeGVUZFVKWnQxRVBvMHA4SHpJczB0WERXaVFtYk5XRy9LUmhP?=
 =?utf-8?B?VGhBVVhEd1NRcFZiV0FoSmdiSGZyNUZkL0g1UGdnNUwvbmZLYWdmNlBwKzBj?=
 =?utf-8?B?Z3Q4dFluUkpyOGpFbjZISFBVbXdmZndKRDlVbVpxbHB2bk5nUnBXMWEzZWdy?=
 =?utf-8?B?bkNBZjRPUnVoNXY2MmJwQ2lGOXUxUUJGN05KdXBqTkpCVGtseG1FV2lGeE9Q?=
 =?utf-8?B?anVKUzl6aElXVmwzQllNcSsrTy9vazNOY210RDY4Uml4a2VCSW5WcnluYWY0?=
 =?utf-8?B?VFdNZm9naUF6VkErRkRqOU50R3kycE82QkVzV3JRLy8xRjFzVzcrU3FwaTR5?=
 =?utf-8?B?bURRQ3hJZnZQTjhyMmVKZCtKNXJXL0lsRDRBa3dhZmw5MktoVDYvNEhETzRn?=
 =?utf-8?B?cWlQSFZqWkFGK3BYbkFPS0owUkM3REt2ZVBOTW1QdG84d3pJQzZsaWNWNFQz?=
 =?utf-8?B?NzZpSERuWStVUnMzTFZ2OWM5ZzNQang5a1FFNUxuMTJnSmtna1MxQXo0V1ZH?=
 =?utf-8?B?K3Frc1FBdWtpOHBMMGpYOGVkbm5MeVlFWVpGUjg5UVIrSlV0Zkw5N3pTYTM1?=
 =?utf-8?B?YUJrd0lXN2JzeEN3bThhaFE4QUZXaXRDeHhpMVJDb1dseWY4QjZCenRGOTlw?=
 =?utf-8?B?WWFFYis3Vys4UGtZbjM4L0dKSWNtZXRUd0dkZm5uMWdNVlZSUXZTVTA3QTdJ?=
 =?utf-8?Q?O7tI=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <81E820DCB834F7468F71F2B07E4C8B07@eurprd02.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: lvrZeE4/+/rzEJLnqpgDFnRFDrlMONz9E6Qcu2pRSQo81PrN6h1MoWQARNFADIbehg/AJ6PxeWvPjkqbAntztKA9WuShuCotl0DlwpG9UK+b4a+LvqnEdvhMBN7ekvKKKJU5L2+DJprwCx3A5VI3VGI5HCUU1B+JiLqW7DtFPhGTI8wBHNLqNSda6YyJVS7jHdnpRCF9ojuyGs3RkBIBBeiXVwUhfwZAMlMR/p2LIUOnLzsGTkYweKI/xTWkPaxISBDZPO22lZATZbkLnoJNCZEslOmNLhjeKkMNFWHFzr4GksBJkZd/hBJf+p2PyrEOK62MhMOA3IiVYGTyFySOsadc5bfgAiXWIBqhA+LE3/ccAjujuGy2cpLSXZh9fxDXdvjAOtOoyt+QvfNT0OM/fMy+alPXHDVFNoq2cZpAueFetbX7aQEF03XSS4pGtoPPWdxm/rmFO+Fqsrg5dSethHtHZD0KwGZ8uc9DnE9wwByuefXNjQA71AuvCGdsGpsjSR85q+90RLihFCH+d6/zBfqN1JcOCrDDyDeH1s18UGTzwBnaCHAxmUSmB/ECY2F1YKqSD/WkEa6tMnQ0QTJmdHlVlnwp6zOh/0/pUGkfMKGcp0goQPd3fuErxd8Nb91A
X-OriginatorOrg: habana.ai
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB9PR02MB6619.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cd4a5eda-f622-463a-ada4-08dc5c6b3d97
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Apr 2024 10:11:24.4177 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d4d4539-213c-4ed8-a251-dc9766ba127a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vEMIK+zE50H/VQgheFBp45VJYD3D04EGWPVUfBDyspJRfXrNcEqg3FwfPr2egikbYVOUtXnQM8ENVoDrdqG77w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR02MB6182
X-MailControlDKIMCheck: cGFzcyBoYWJhbmEuYWkgW3Bhc3Nd
X-MailControl-OutInfo: MTcxMzA4OTUzMTpGUEtleTEucHJpdjpaE85WhTghor4+euVRgA1mwnCMXmFKDkChUmAA4fXEIYr02c9FOOLqRVhmWlMZgjvaFqLnxiTnP0KeKCj0vZN+PF6J6YQygOHB3HbVMIAw7wJnoyfYEUMZod3alitHDgaqfbxC7GEfFEhMbnBInJqurvOPqJKJeq81PHpAfiQcNOvnPChNmhFZ2nckyTW8SUYTXmVRBJ0ZcoyvqSJCFQvAlm7mMeQdRusvNoNggUPEzx2GuVf5foPDiaAkHFMelrJAPH0R2qr1m6BGFIk532QnCwGs2gM8r+CffEHxi0xOooKWjpPDa4jXcrDsWEPYowIMwOFKGm2Qu1yKF1JLiO+E
X-Scanned-By: MailControl 44278.2143 (www.mailcontrol.com) on 10.68.1.120
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

T24gMTQvMDQvMjAyNCAxMToxMSwgS29ieSBFbGJheiB3cm90ZToNCj4gTm93IHRoYXQgdGhlIGZv
cm1lciBtbWlvIGhhbmRsZXJzIGFyZSBmdWxseSByZW1vdmVkLCB0aGlzDQo+IGRlYnVnZnMgZmls
ZSB3aWxsIGJlIHVzZWQgZm9yIG1taW8gYWNjZXNzIChyZWFkL3dyaXRlKQ0KPiB0aHJvdWdoIHRo
ZSBkZWJ1Z2ZzIGlvY3RsIGZpbGUgb3BlcmF0aW9uLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogS29i
eSBFbGJheiA8a2VsYmF6QGhhYmFuYS5haT4NCj4gLS0tDQo+ICAgZHJpdmVycy9ncHUvZHJtL3hl
L3hlX2RlYnVnZnMuYyB8IDEyICsrKysrKysrKysrKw0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAxMiBp
bnNlcnRpb25zKCspDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2Rl
YnVnZnMuYyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9kZWJ1Z2ZzLmMNCj4gaW5kZXggYzliMzBk
YmRjMTRkLi5jZTI3NTE2ZmZhYzAgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94
ZV9kZWJ1Z2ZzLmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2RlYnVnZnMuYw0KPiBA
QCAtMTExLDEyICsxMTEsMjIgQEAgc3RhdGljIGludCBmb3JjZXdha2VfcmVsZWFzZShzdHJ1Y3Qg
aW5vZGUgKmlub2RlLCBzdHJ1Y3QgZmlsZSAqZmlsZSkNCj4gICAJcmV0dXJuIDA7DQo+ICAgfQ0K
PiAgIA0KPiArc3RhdGljIGxvbmcgeGVfZGVidWdmc19tbWlvX2lvY3RsKHN0cnVjdCBmaWxlICpm
LCB1bnNpZ25lZCBpbnQgY21kLCB1bnNpZ25lZCBsb25nIGFyZykNCj4gK3sNCj4gKwlyZXR1cm4g
MDsNCj4gK30NCj4gKw0KPiAgIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZmlsZV9vcGVyYXRpb25zIGZv
cmNld2FrZV9hbGxfZm9wcyA9IHsNCj4gICAJLm93bmVyID0gVEhJU19NT0RVTEUsDQo+ICAgCS5v
cGVuID0gZm9yY2V3YWtlX29wZW4sDQo+ICAgCS5yZWxlYXNlID0gZm9yY2V3YWtlX3JlbGVhc2Us
DQo+ICAgfTsNCj4gICANCj4gK3N0YXRpYyBjb25zdCBzdHJ1Y3QgZmlsZV9vcGVyYXRpb25zIG1t
aW9fZm9wcyA9IHsNCj4gKwkub3duZXIgPSBUSElTX01PRFVMRSwNCj4gKwkudW5sb2NrZWRfaW9j
dGwgPSB4ZV9kZWJ1Z2ZzX21taW9faW9jdGwsDQo+ICt9Ow0KPiArDQo+ICAgdm9pZCB4ZV9kZWJ1
Z2ZzX3JlZ2lzdGVyKHN0cnVjdCB4ZV9kZXZpY2UgKnhlKQ0KPiAgIHsNCj4gICAJc3RydWN0IHR0
bV9kZXZpY2UgKmJkZXYgPSAmeGUtPnR0bTsNCj4gQEAgLTE1NSw2ICsxNjUsOCBAQCB2b2lkIHhl
X2RlYnVnZnNfcmVnaXN0ZXIoc3RydWN0IHhlX2RldmljZSAqeGUpDQo+ICAgCWZvcl9lYWNoX2d0
KGd0LCB4ZSwgaWQpDQo+ICAgCQl4ZV9ndF9kZWJ1Z2ZzX3JlZ2lzdGVyKGd0KTsNCj4gICANCj4g
KwlkZWJ1Z2ZzX2NyZWF0ZV9maWxlKCJtbWlvIiwgMDY0NCwgcm9vdCwgeGUsICZtbWlvX2ZvcHMp
Ow0KPiArDQo+ICAgI2lmZGVmIENPTkZJR19GQVVMVF9JTkpFQ1RJT04NCj4gICAJZmF1bHRfY3Jl
YXRlX2RlYnVnZnNfYXR0cigiZmFpbF9ndF9yZXNldCIsIHJvb3QsICZndF9yZXNldF9mYWlsdXJl
KTsNCj4gICAjZW5kaWYNCg0KQWNrIGZvciBib3RoIHBhdGNoZXMuDQoNClJldmlld2VkLWJ5OiBP
ZmlyIEJpdHRvbiA8b2JpdHRvbkBoYWJhbmEuYWk+DQo=
