Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E916C369B5
	for <intel-xe@archiver.kernel.org>; Wed, 25 Sep 2024 09:36:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08D2910E2FD;
	Wed, 25 Sep 2024 09:36:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=habana.ai header.i=@habana.ai header.b="o5Q1QVaQ";
	dkim-atps=neutral
Received: from cluster-b.mailcontrol.com (cluster-b.mailcontrol.com
 [85.115.56.190])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48E5710E7DF
 for <intel-xe@lists.freedesktop.org>; Wed, 25 Sep 2024 09:36:48 +0000 (UTC)
Received: from rly16b.srv.mailcontrol.com (localhost [127.0.0.1])
 by rly16b.srv.mailcontrol.com (MailControl) with ESMTP id 48P9ai8i442429
 for <intel-xe@lists.freedesktop.org>; Wed, 25 Sep 2024 10:36:44 +0100
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
 by rly16b.srv.mailcontrol.com (MailControl) id 48P9a1JR432435
 for intel-xe@lists.freedesktop.org; Wed, 25 Sep 2024 10:36:01 +0100
Received: from DU2PR03CU002.outbound.protection.outlook.com
 (mail-northeuropeazlp17012029.outbound.protection.outlook.com [40.93.64.29])
 by rly16b-eth0.srv.mailcontrol.com (envelope-sender illevi@habana.ai)
 (MIMEDefang) with ESMTP id 48P9ZxlJ431163 (TLS bits=256 verify=OK)
 for intel-xe@lists.freedesktop.org; Wed, 25 Sep 2024 10:36:01 +0100 (BST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DrmGnt0N8/SZAoTWCJmYdSt5LmuSh/CUwVlmDx07ydPg8gV/7FF1KvQ6bo7RARnuPfW2U8K7vHytkyusFoj/3IH6lKit3xwGFBjaGBAwy1SUeq2hggZzLUNpfCGUZiiI9GQyK7movJIlRWg0wzVEpNJLTHvttwbNkJWXHkmiaYovRg8EJELb8Dwhmx9+p0hLmEWLGnxeUW53wOB3DNNpeAQifOzncTfKBV2ZQSNxQhQVsqDjBVzc09i+JawBnmoJGY82SgW7lhx95vmVNVaRSUBZZkwWi5SN0pO0DsVTlLu/AqAORBfSzmQQg8SpFnFtWl035sGmor1EnXWChLMJ4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YLoUtqFdlu2gNbK4VoEHMFDLkOe+pq1xVwKhGh54D48=;
 b=cPY/Q0aqqeNOSP88Kga9n6NvaSQaDJ4gPKriUv/ZTgWgrZmWffZsvtEPyZ1LTbnnrEjcmnsqAr98e7nIiAH15TwFzBYlcMML8kCoKL4UKM+7lB344yADwxhuysF8oJ81bMOy19vOhixiU3Qq2V7+PClavGuk7soaWkNTwIG92XSHQPb1Ob7aUUZVB6HdZjd83tNiWTBm98e93RHF/iUVA41TaKK9hfZTWew+CQ4VJ52+miRRvfjV9vfbEmY0HEI5VOBIEiLw0VWfGsgSEYP76I06c1SXoS7EVrwJRxLjzEEdAuogqh50BmdJgRloMpbA1NRQPB5Tc/xG3ln+huZIQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=habana.ai; dmarc=pass action=none header.from=habana.ai;
 dkim=pass header.d=habana.ai; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=habana.ai; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YLoUtqFdlu2gNbK4VoEHMFDLkOe+pq1xVwKhGh54D48=;
 b=o5Q1QVaQx/riynV0ZeisY58SmmaqXkIaS6R/FAhDPdkFaZAeeprz/6z0zFdLzJ+QUpVHHu9p7iETM5yYjqIPLDMUliSeX6N1iwRNi9zHsCv5qfWyjrAJ60iwEWgp0CKcA/Uh23eq76/83FMQAGuQ57kn1t9O/vR+n/AVW1HoCjFKCwkw9yOkcmSrE0ALAKK4z0lpqnpmvpQQ1GStcuUopO+8Wj39XpxQ033adlygvwtPmQt98cAFK1i1uIOSj8z0jIOo/8yAe67CV2FaYojjIw4p4k5wynNlKIJtPU2gD630rTUXQSOOvBRQr5i7gdREaJ6AcGGDufi0XltBLp3Hdg==
Received: from AS8PR02MB9862.eurprd02.prod.outlook.com (2603:10a6:20b:61a::13)
 by PRAPR02MB7860.eurprd02.prod.outlook.com (2603:10a6:102:279::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.25; Wed, 25 Sep
 2024 09:35:57 +0000
Received: from AS8PR02MB9862.eurprd02.prod.outlook.com
 ([fe80::77a2:c23f:25b2:972f]) by AS8PR02MB9862.eurprd02.prod.outlook.com
 ([fe80::77a2:c23f:25b2:972f%6]) with mapi id 15.20.7982.022; Wed, 25 Sep 2024
 09:35:57 +0000
From: Ilia Levi <illevi@habana.ai>
To: "Wajdeczko, Michal" <michal.wajdeczko@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Piorkowski, Piotr" <piotr.piorkowski@intel.com>, Ilia Levi
 <ilia.levi@intel.com>
Subject: Re: [PATCH] drm/xe: Add memirq report page address helpers
Thread-Topic: [PATCH] drm/xe: Add memirq report page address helpers
Thread-Index: AQHbDydGn9jsWqHFuEm5u72TDWHRZrJoPlUA
Date: Wed, 25 Sep 2024 09:35:57 +0000
Message-ID: <25da5b70-6190-44ba-92dd-f54a01a504e3@habana.ai>
References: <20240925084445.1495-1-michal.wajdeczko@intel.com>
In-Reply-To: <20240925084445.1495-1-michal.wajdeczko@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=habana.ai;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR02MB9862:EE_|PRAPR02MB7860:EE_
x-ms-office365-filtering-correlation-id: 8665d7a5-507f-46bd-2ef1-08dcdd457583
x-ld-processed: 0d4d4539-213c-4ed8-a251-dc9766ba127a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?dkxKVU45S0ZVQUx6R2ZmdjF6dEQyVXVLUjN0UEc5M3YrRUtvbktPS2xQS3Vn?=
 =?utf-8?B?cDA0amx5V3RBVzlnRXZIU3NuSFJZUjJJOEF5YmtBSXZQbUNJbjZWR2gzbkRH?=
 =?utf-8?B?Zmd5eGtaTHFGSm5jeFg0eTY4cVFqdmt6aXdjdFRVMFQ2M050NktuQllkT1dR?=
 =?utf-8?B?U1VFdXdzSlBINUJ6Q2RnY0tuTzM1Y0tNekVJR0xPd3BVRWQ2VFg5Sjk1c2l2?=
 =?utf-8?B?eGdibytCbCtrWEpCTGJ4cHBzNGRMeXdxemRaNVBiR3pxYnBNdjl4dWNQM1Fv?=
 =?utf-8?B?cFNzbHlmTWtGZ2dNWnJZTHB0S3Z6UFhQR2xuYTVod0NVZktkVEx6bE91bW5w?=
 =?utf-8?B?b2RuQmo1WlhxV25kYWtDOWRKY2FmMzdzbFdrUnZueXFnQ3VWbURxa3FJNXR3?=
 =?utf-8?B?cVVhanhxZHdLWURCOE1LN1g1Y1FaVnZXRGMrWEFXd2tSUmhFMHNtS09wTHcw?=
 =?utf-8?B?ZTlObk4rZ3JrcXY0bUhNckQvSlNYWEVNZVAvVDl5a051ajhtVU1RZDNTU0gr?=
 =?utf-8?B?dzVZZmFmQlB5ZFNmQVl5RExHdDdJVG9wN3B2SytKRGtkNUlnckVTRGVFWm4w?=
 =?utf-8?B?L0VlNEt4dlpsYkMrMGdyOUtGVGZQbnMzMVV1UmlPTGVVbDFKWFExb0NLeUta?=
 =?utf-8?B?Q244UDZ1cUVVZnFKOGxyM2JhMTROZXMxTmFqWXBTZ0xEVHhRU1VoQ3MvSnFu?=
 =?utf-8?B?dkZoQVpCdlBnM3d5dlZwZDhwbXlURzQ2ZjQzb05jMEtCR0cxZUg5TTRzOEFW?=
 =?utf-8?B?TTYyN0hPMUZ6Sk1Ha3E2UVVtb3E2cTZOZVVjYWNza2RKRU13b3RFVnpQd1R2?=
 =?utf-8?B?dFZMYUxFZ0JpUndaTmYzZUZPUG5HMDh3MzlIZmMyZzdPekx3Y1dYWmZ2ZnpK?=
 =?utf-8?B?eWZ0NXZhQk9WenBZckJxeXAzbUljTzlJR3pEVTRDUDZPZ2VWb0ExL3pxM1Jo?=
 =?utf-8?B?WncvbE9aNnZVWmkrN2tiZm1OTnpKQVVJZHFYWGtJR1RONzdUUzV1Y2Y4cHVP?=
 =?utf-8?B?b05UTVR5ekFJZzlXR3NXU213YmJibU1LR2RBazRTL0JmaXdCOGFMVlpEQ0t6?=
 =?utf-8?B?bXBCNmRvNkdiOUpmdk5mQ3ZlWkVTVDJVR283WnVmSUpsM1pFaUxrdlhMT0hK?=
 =?utf-8?B?WTMrUCtqVCtFZlUyT0lXNlU4RGtZOXRndTFyNHY5M1RRYkNmSjFJOUVnb2Zq?=
 =?utf-8?B?a091M2J0MEFRWDJWMkM2QllwZHl6UWpxN1NlUDg3aXZycmQvODNCSWhGY2Ex?=
 =?utf-8?B?V3FKS3Z6RXpoZlZ2a0NHU3hoSmhFbmhLditYczRnU1laMndXSWZobnBnOHJv?=
 =?utf-8?B?ZWU4MjRFc2FSdnc1dGhaTFFHWnhEUEVzR3BmZDBlckZiYXd5bGdkSmx1WHR0?=
 =?utf-8?B?YWNSRjlOL3VBT2IrMm1iakxnQ0xLMmxnVXljdStDeEFCRVFpSnAwN1F6M0F4?=
 =?utf-8?B?VStqQ1ZGV3ZjYUNCcFVRMDJlZ0R0cGNpdmFYVXFOemhwdkJHY1NIWnlmRUFI?=
 =?utf-8?B?cDdsdlduVEpYSzIzTTZoYzh1UUNlSU96K1RSYVU5c0M4UlRYTCsxSjNtZ0tD?=
 =?utf-8?B?YkpScUNVVEtCbG9qVFNaVzE1OXAvZHFZRU90SEs2aGFRNTdVY014S29WRVJZ?=
 =?utf-8?B?T20zUkJ1RHM2alp5OFBpZjdETkhQMjZBSUUxY000ZmtOQks2S01ab0lOT09J?=
 =?utf-8?B?Mzl3dTBqcElwemdldGZHMTUzR2dDZS90YW0vOC9lMCtzbWZ6YWIrL2VxWnF3?=
 =?utf-8?B?TTZHV2I1bDA4aDcyb0JEWXZnMnFwZk1mdGdvREZ0UTJrWkVPbzZoL2xZdDZx?=
 =?utf-8?B?SWlZaytuUHZnbytUT3NUdVZyNUdBR2NzYXZUTWhIMGF1TEU3TmFwSE9UL21s?=
 =?utf-8?B?Wmk2U2dKNE1sWDFyVTl6ZnhNbFlJdEJlSStseTVuQndsWUE9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR02MB9862.eurprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WmlRajJFRmYrYjdpbWFWQWpMWjgzdXp1djVybzJaL3JGTDR6anJVejg2VnNh?=
 =?utf-8?B?U1ZyOHY3czd0SkxVLzdvcE5RZUVpM3J5cnJlM2gxc1V2RVZzUlZYOWFDb3VQ?=
 =?utf-8?B?Mmd0Rm5ncGxLaml3T2V0Um9YRzZ3UjNpQVd1cGxJL1A3UjVtanRuRHF2dEVD?=
 =?utf-8?B?OHU3RW5Wa25EdFFudUxYcU1qOXZWVloyVlRDaVdheWtMQjZwdmxHUi9qOGJU?=
 =?utf-8?B?aUREcXlTdWJ1aDc0NHpqSFFJWWVCZXMvTk5CWjFnNVdvSkliaSswYzg4L0xR?=
 =?utf-8?B?bHhoUnRwSytzQldrM3lnZW9nUHY3Y2NuYU5tVmNUZVpiOVNwVXJJWkJVK2x0?=
 =?utf-8?B?NmJ4Rk5MRnZuZkp3Y1hZNHlRSER2MGV6VGZwdHlsVDNyNkhVOXA3RVNXbGdY?=
 =?utf-8?B?YW5jc2VpdmIwRHVEWnNNYUhRaW1rcXZ1S1FEZFFIb0lPYWsweXN2TGgzL3FI?=
 =?utf-8?B?LzN2M0d2TEZuQWFhVm1VdVhrQ1doL09aQnNvLzlFYnlMOUZPRTl6THBUZG9Y?=
 =?utf-8?B?WERxZnhtMkJCdTRxTG42TEtMU3dZa0VDMHlKYzlSTlN3cGRDQ2pHMHlyeXNF?=
 =?utf-8?B?YXVMQkRzb3R4aEhFTmo2M3ltSmVyYW1jaWhkaUJOYlRSZVZSUkNISDcyRUNk?=
 =?utf-8?B?NUc1SFUraEJjb29uVEt0Tm4zMndkZGw3L0hyd1ZmK05mQU03b0owZTJGbzE1?=
 =?utf-8?B?Q29TNlJMT0pTMkUyaG1McDFuZ1lLWnptWnF5L29adTZySjU1eXdJcGRUOUpk?=
 =?utf-8?B?clEvek1ZdVFMZ2NNdnloZWt6dnl0bXV3bnBUaFVXdER1QmVvaU5ROVhmb0lY?=
 =?utf-8?B?SW5SUWxxY3NGSkVMZEcxQUNGTWdwaHM3VlVxd0xBSElpRGRDQUFCS2k2ZE1T?=
 =?utf-8?B?TWVtMGcxQkxmZ2NmMXZQYjhNT2pxT1JEWVpzRTE1TVdjNnR6eitFSHlVSU5V?=
 =?utf-8?B?RTl4VG9qZFl0NVlsSCtZSjQxTzY2SVlKZXZRVFlnQkhSMGpkZi9zTFFoMlpw?=
 =?utf-8?B?a0g4ODViVWdhVkRsTWZCTUNqdStzcVBiUzVNSmliS1NCRzZ0RXQrd2RFdjY0?=
 =?utf-8?B?cGdiRnlKelRPdkVtMURDTHY3OXUvL3VwUTZxVWFCTmtIOUxpbTQ5MnBxUEEz?=
 =?utf-8?B?Y0NXOGtRaklhdjg0cWY5MU40bFNaSDJqeWpUV0YwK3R2ZXZrZ2l4eGQ3WmhT?=
 =?utf-8?B?Q0J1VjEzYnFQbmlBb25lbXNnMVlQZGgwdEFGb284b3k4UDBNUHFiaDd4OHZP?=
 =?utf-8?B?cldoNXlFd3A4MGRlQTFTZFAyMW40Y1NHQ2ptdFRtTDFKYW03cmFIVEZJc3Fx?=
 =?utf-8?B?OGJVcnhVU1c1RUF3Q0ZiaGoyMFU0dGRlNjE2V29KMkZET1BBMGpxMktlL2Qz?=
 =?utf-8?B?QzVSYm0ycWN4L2pjbW5hdmcraGdLcGtrbTdEWXBOVHZJMFNNYXpTL04ydUdU?=
 =?utf-8?B?VXpwSHJzUnJXLytwcjAvZkdRZzY4MW11RXFVWjZGREtMbllRVVVFTXczdHhr?=
 =?utf-8?B?ZU9kMk9JR0o5MU5DOFZXWktEUDFiN0M3NGtnVU9JK1FIeGI4N2VTNUJnZkxY?=
 =?utf-8?B?TlVlRExzbkdZTG15QUV0TG9jN3pBbzdNVTRCK29uZEgvNklCNEpmZ1ZDTlA3?=
 =?utf-8?B?RjBBMEJHdmhFakJhdG1JeWFKN1pvMzREcVNaVmZPay9NS1l0aUZWYjhVdjZ2?=
 =?utf-8?B?TzJ5ZmNuenhCSHdwMGlTNit1NTJPQjdSV3JPV2FDM3M3LyttZ2RLbXRpMHhT?=
 =?utf-8?B?bFV6WlJNSGFyZHFibGlHdkxpcHlwZlV6bEdnVHFnaE9mRnFJY3BXamhuZVFD?=
 =?utf-8?B?RWJ5ZlI0RmNhemhZVGwwODVVZzFxRkdYdU4xK1NJUlh0WG5US21BVm5sWUtQ?=
 =?utf-8?B?RERSZlovVmY1eU9TSHY0Ui84bHhOWlZocWhpR0NJUW05cXgxVmE3VzZJeG02?=
 =?utf-8?B?dVkvMHhJNEJoaHlkdnZBYWZpYUpzTmhsL2hjSWtvMWpaSC9BQ01zRU0yWVl5?=
 =?utf-8?B?aEU2MVJ2NUdId3gyRkRBOXNvOVNrUXVwMnFyUE1KenpDL0lBcmZhNUx3aStB?=
 =?utf-8?B?UUUydjFYV0NYOEFPVmxXWVREV3lRVzJNT3c0S3dZS0hHcFBMeE5XR0VFSUk3?=
 =?utf-8?Q?F/JM=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <BA2589714992684DA5C3380081FC47BC@eurprd02.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: YCXpKq4/pszk//fUudvFZqB5BNjEk7yxvy/K/7S89gw8bcUrHlJJd6rIEYybpSqkaXHx+SQUXqtwuv0mleN0OjsHf4SmlGdbDbZAd1Nk+vA5Ly1di3t/DcgxsldL2PmoeAHovruLsWK6aPcTPTkNmSwTUL1Duqen5AJjv75cJpw+ckSSnR3uBoA1QW1IWUt28h/sfCbJwxT3DCYLXWg2o/XoQCyZ4BI5oPs+tEsmR5fP6wM/BAQFJWcc98+NRTf5B7OdvAHIjLn0ywUhavUJHpUqpcvuV/fj/W1j5i4dZCXCsxCdtOfRhbrv8wX3lmshWyMpJAF/4Ek7Dknx/JJa9wsmgWzJmXluRR5K43YEkhNekEqHjiIuBgTHpjtu0sw95y5wt4syAf5HxLfPtTWVfR8ZzPH+XU8SjIK1zA+Vkpr+2pBgZvbe7VW3LjH4M8aUZlzOr80okZhpFMQMmHniixei3OWzBjQvU6fwJHzWDlopqumvC1Krw+c9xpD6go59z+3tZyUheRnTTuA3V0F+KmXaqqik1MjMLuGQzbKuTmc8hjfoEPxWUtJOqItoJWTm6M4PGHb+c387SrE8/0ec4wnABgQJFsvu4ZK+Z2Us90FvK4rYsWSY74mm2OfS1l9V
X-OriginatorOrg: habana.ai
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR02MB9862.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8665d7a5-507f-46bd-2ef1-08dcdd457583
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Sep 2024 09:35:57.3446 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d4d4539-213c-4ed8-a251-dc9766ba127a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5hKH9PXAYlGE9IWneLK98n1pbyDO6ZdH9gEhSdzLK166CQQUBn+PCFIX7PxNyeHBgdJvOo/rqGYZrM6xd44Hlw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PRAPR02MB7860
X-MailControlDKIMCheck: cGFzcyBoYWJhbmEuYWkgW3Bhc3Nd
X-MailControl-OutInfo: MTcyNzI1NzAwNDpGUEtleTEucHJpdjofXH7X0jUZ+ZXl7HywfgV5r0vJKY2LL8y1iIxCzb8j3tLVxCOyAosqEn+z4zTuA/iHtkFyaMwvdHqfBwAJstiF4bc0asUNqKdPQ7m7xAcYGVcOa/Z2d7QFbeh8Tdi85aPInVs+oE6jSy/iuuQIPEtTZ2X2CKBn+5+MWAfww1T6NlST/N+seknnFG0t7XCSQPX13CYYB5+TuXrGRvMvleonfk5/oEGp0Vf+4/NsdEfjwoNiNmYhfZTdngHfRWx+Q8L6vKWLT2p3sAxBsnm2dCi74cO49MfGFRPe8W3PpMof1LeUlIBxnSC5wyq/CkUtA8O+xDNzja9Y8EBoF0W6FVsw
X-Scanned-By: MailControl 44278.2145 (www.mailcontrol.com) on 10.66.1.126
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

T24gMjUvMDkvMjAyNCAxMTo0NCwgTWljaGFsIFdhamRlY3prbyB3cm90ZToNCj4gQm90aCB4ZV9t
ZW1pcnFfe3NvdXJjZSxzdGF0dXN9X3B0ciBmdW5jdGlvbnMgYXJlIG5vdyBzdHJpY3RseSBmb3IN
Cj4gb2J0YWluaW5nIGFuIGFkZHJlc3Mgb2YgdGhlIG1lbW9yeSBiYXNlZCBpbnRlcnJ1cHQgcmVw
b3J0IHBhZ2VzDQo+IHVzZWQgYnkgdGhlIEhXIGVuZ2luZXMuIFdoZW4gaW5pdGlhbGl6aW5nIHRo
ZSBHdUMgdGhhdCBkb2VzIG5vdA0KPiByZXF1aXJlIHNwZWNpYWwgcGVyIGluc3RhbmNlIHBhZ2Ug
cHJlcGFyYXRpb24sIHdlIGRvbid0IG5lZWQgdG8NCj4gYWJ1c2UgdGhlc2UgcHVibGljIGZ1bmN0
aW9ucyBhbmQgcGFzcyBhIE5VTEwgaW5zdGVhZCBvZiB2YWxpZCBod2UNCj4gcG9pbnRlci4gQWxz
bywgd2l0aG91dCBmdXJ0aGVyIGZpeGVzLCB0aGlzIGFjdHVhbGx5IG1heSBsZWFkIHRvDQo+IE5Q
RCBjcmFzaCBvbmNlIHRoZSBod19yZXBvcnRzX3RvX2luc3RhbmNlX3plcm8oKSB3aWxsIGJlIHRy
dWUuDQo+IA0KeGVfbWVtaXJxX2luaXRfZ3VjIGlzIG5vdCBzdXBwb3NlZCB0byBiZSBjYWxsZWQg
aW4gdGhlIGZsb3cgdGhhdCB3aWxsIHJldHVybiB0cnVlIGZvciBod19yZXBvcnRzX3RvX2luc3Rh
bmNlX3plcm8oKSwgYnV0IEkgYWdyZWUgdGhhdCBpdCdzIGEgZ29vZCBjaGFuZ2UgdG8gbWFrZS4N
Cg0KUmV2aWV3ZWQtYnk6IElsaWEgTGV2aSA8aWxpYS5sZXZpQGludGVsLmNvbT4NCj4gQWRkIGlu
dGVybmFsIGhlbHBlcnMgdGhhdCB3aWxsIHByb3ZpZGUgcmVwb3J0IHBhZ2UgYWRkcmVzc2VzIGJh
c2VkDQo+IHNvbGVseSBvbiB0aGUgaW5zdGFuY2UgbnVtYmVyLCB3aGljaCB3aWxsIGJlIGFsd2F5
cyAwIGZvciBib3RoIEd1Q3MuDQo+IA0KPiBGaXhlczogZWY2MTAzZDIwZjk3ICgiZHJtL3hlOiBt
ZW1pcnEgaW5mcmEgY2hhbmdlcyBmb3IgTVNJLVgiKQ0KPiBTaWduZWQtb2ZmLWJ5OiBNaWNoYWwg
V2FqZGVjemtvIDxtaWNoYWwud2FqZGVjemtvQGludGVsLmNvbT4NCj4gQ2M6IFBpb3RyIFBpw7Ny
a293c2tpIDxwaW90ci5waW9ya293c2tpQGludGVsLmNvbT4NCj4gQ2M6IElsaWEgTGV2aSA8aWxp
YS5sZXZpQGludGVsLmNvbT4NCj4gLS0tDQo+ICBkcml2ZXJzL2dwdS9kcm0veGUveGVfbWVtaXJx
LmMgfCAzNSArKysrKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tDQo+ICAxIGZpbGUgY2hh
bmdlZCwgMjEgaW5zZXJ0aW9ucygrKSwgMTQgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX21lbWlycS5jIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hl
X21lbWlycS5jDQo+IGluZGV4IDNmOGQ0Y2E2NDMwMi4uNzE1ZGM1OTAzNzg3IDEwMDY0NA0KPiAt
LS0gYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfbWVtaXJxLmMNCj4gKysrIGIvZHJpdmVycy9ncHUv
ZHJtL3hlL3hlX21lbWlycS5jDQo+IEBAIC0yNjEsNiArMjYxLDE1IEBAIGludCB4ZV9tZW1pcnFf
aW5pdChzdHJ1Y3QgeGVfbWVtaXJxICptZW1pcnEpDQo+ICAJcmV0dXJuIDA7DQo+ICB9DQo+ICAN
Cj4gK3N0YXRpYyB1MzIgX19tZW1pcnFfc291cmNlX3BhZ2Uoc3RydWN0IHhlX21lbWlycSAqbWVt
aXJxLCB1MTYgaW5zdGFuY2UpDQo+ICt7DQo+ICsJbWVtaXJxX2Fzc2VydChtZW1pcnEsIGluc3Rh
bmNlIDw9IFhFX0hXX0VOR0lORV9NQVhfSU5TVEFOQ0UpOw0KPiArCW1lbWlycV9hc3NlcnQobWVt
aXJxLCBtZW1pcnEtPmJvKTsNCj4gKw0KPiArCWluc3RhbmNlID0gaHdfcmVwb3J0c190b19pbnN0
YW5jZV96ZXJvKG1lbWlycSkgPyBpbnN0YW5jZSA6IDA7DQo+ICsJcmV0dXJuIHhlX2JvX2dndHRf
YWRkcihtZW1pcnEtPmJvKSArIFhFX01FTUlSUV9TT1VSQ0VfT0ZGU0VUKGluc3RhbmNlKTsNCj4g
K30NCj4gKw0KPiAgLyoqDQo+ICAgKiB4ZV9tZW1pcnFfc291cmNlX3B0ciAtIEdldCBHR1RUJ3Mg
b2Zmc2V0IG9mIHRoZSBgSW50ZXJydXB0IFNvdXJjZSBSZXBvcnQgUGFnZWBfLg0KPiAgICogQG1l
bWlycTogdGhlICZ4ZV9tZW1pcnEgdG8gcXVlcnkNCj4gQEAgLTI3MywxNCArMjgyLDE4IEBAIGlu
dCB4ZV9tZW1pcnFfaW5pdChzdHJ1Y3QgeGVfbWVtaXJxICptZW1pcnEpDQo+ICAgKi8NCj4gIHUz
MiB4ZV9tZW1pcnFfc291cmNlX3B0cihzdHJ1Y3QgeGVfbWVtaXJxICptZW1pcnEsIHN0cnVjdCB4
ZV9od19lbmdpbmUgKmh3ZSkNCj4gIHsNCj4gLQl1MTYgaW5zdGFuY2U7DQo+IC0NCj4gIAltZW1p
cnFfYXNzZXJ0KG1lbWlycSwgeGVfZGV2aWNlX3VzZXNfbWVtaXJxKG1lbWlycV90b194ZShtZW1p
cnEpKSk7DQo+ICsNCj4gKwlyZXR1cm4gX19tZW1pcnFfc291cmNlX3BhZ2UobWVtaXJxLCBod2Ut
Pmluc3RhbmNlKTsNCj4gK30NCj4gKw0KPiArc3RhdGljIHUzMiBfX21lbWlycV9zdGF0dXNfcGFn
ZShzdHJ1Y3QgeGVfbWVtaXJxICptZW1pcnEsIHUxNiBpbnN0YW5jZSkNCj4gK3sNCj4gKwltZW1p
cnFfYXNzZXJ0KG1lbWlycSwgaW5zdGFuY2UgPD0gWEVfSFdfRU5HSU5FX01BWF9JTlNUQU5DRSk7
DQo+ICAJbWVtaXJxX2Fzc2VydChtZW1pcnEsIG1lbWlycS0+Ym8pOw0KPiAgDQo+IC0JaW5zdGFu
Y2UgPSBod19yZXBvcnRzX3RvX2luc3RhbmNlX3plcm8obWVtaXJxKSA/IGh3ZS0+aW5zdGFuY2Ug
OiAwOw0KPiAtDQo+IC0JcmV0dXJuIHhlX2JvX2dndHRfYWRkcihtZW1pcnEtPmJvKSArIFhFX01F
TUlSUV9TT1VSQ0VfT0ZGU0VUKGluc3RhbmNlKTsNCj4gKwlpbnN0YW5jZSA9IGh3X3JlcG9ydHNf
dG9faW5zdGFuY2VfemVybyhtZW1pcnEpID8gaW5zdGFuY2UgOiAwOw0KPiArCXJldHVybiB4ZV9i
b19nZ3R0X2FkZHIobWVtaXJxLT5ibykgKyBYRV9NRU1JUlFfU1RBVFVTX09GRlNFVChpbnN0YW5j
ZSk7DQo+ICB9DQo+ICANCj4gIC8qKg0KPiBAQCAtMjk1LDE0ICszMDgsOSBAQCB1MzIgeGVfbWVt
aXJxX3NvdXJjZV9wdHIoc3RydWN0IHhlX21lbWlycSAqbWVtaXJxLCBzdHJ1Y3QgeGVfaHdfZW5n
aW5lICpod2UpDQo+ICAgKi8NCj4gIHUzMiB4ZV9tZW1pcnFfc3RhdHVzX3B0cihzdHJ1Y3QgeGVf
bWVtaXJxICptZW1pcnEsIHN0cnVjdCB4ZV9od19lbmdpbmUgKmh3ZSkNCj4gIHsNCj4gLQl1MTYg
aW5zdGFuY2U7DQo+IC0NCj4gIAltZW1pcnFfYXNzZXJ0KG1lbWlycSwgeGVfZGV2aWNlX3VzZXNf
bWVtaXJxKG1lbWlycV90b194ZShtZW1pcnEpKSk7DQo+IC0JbWVtaXJxX2Fzc2VydChtZW1pcnEs
IG1lbWlycS0+Ym8pOw0KPiAgDQo+IC0JaW5zdGFuY2UgPSBod19yZXBvcnRzX3RvX2luc3RhbmNl
X3plcm8obWVtaXJxKSA/IGh3ZS0+aW5zdGFuY2UgOiAwOw0KPiAtDQo+IC0JcmV0dXJuIHhlX2Jv
X2dndHRfYWRkcihtZW1pcnEtPmJvKSArIFhFX01FTUlSUV9TVEFUVVNfT0ZGU0VUKGluc3RhbmNl
KTsNCj4gKwlyZXR1cm4gX19tZW1pcnFfc3RhdHVzX3BhZ2UobWVtaXJxLCBod2UtPmluc3RhbmNl
KTsNCj4gIH0NCj4gIA0KPiAgLyoqDQo+IEBAIC0zNDMsMTAgKzM1MSw5IEBAIGludCB4ZV9tZW1p
cnFfaW5pdF9ndWMoc3RydWN0IHhlX21lbWlycSAqbWVtaXJxLCBzdHJ1Y3QgeGVfZ3VjICpndWMp
DQo+ICAJaW50IGVycjsNCj4gIA0KPiAgCW1lbWlycV9hc3NlcnQobWVtaXJxLCB4ZV9kZXZpY2Vf
dXNlc19tZW1pcnEobWVtaXJxX3RvX3hlKG1lbWlycSkpKTsNCj4gLQltZW1pcnFfYXNzZXJ0KG1l
bWlycSwgbWVtaXJxLT5ibyk7DQo+ICANCj4gLQlzb3VyY2UgPSB4ZV9tZW1pcnFfc291cmNlX3B0
cihtZW1pcnEsIE5VTEwpICsgb2Zmc2V0Ow0KPiAtCXN0YXR1cyA9IHhlX21lbWlycV9zdGF0dXNf
cHRyKG1lbWlycSwgTlVMTCkgKyBvZmZzZXQgKiBTWl8xNjsNCj4gKwlzb3VyY2UgPSBfX21lbWly
cV9zb3VyY2VfcGFnZShtZW1pcnEsIDApICsgb2Zmc2V0Ow0KPiArCXN0YXR1cyA9IF9fbWVtaXJx
X3N0YXR1c19wYWdlKG1lbWlycSwgMCkgKyBvZmZzZXQgKiBTWl8xNjsNCj4gIA0KPiAgCWVyciA9
IHhlX2d1Y19zZWxmX2NmZzY0KGd1YywgR1VDX0tMVl9TRUxGX0NGR19NRU1JUlFfU09VUkNFX0FE
RFJfS0VZLA0KPiAgCQkJCXNvdXJjZSk7DQoNCg==
