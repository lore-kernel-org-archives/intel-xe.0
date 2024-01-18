Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06DFFC47DAF
	for <intel-xe@archiver.kernel.org>; Thu, 18 Jan 2024 19:07:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A50E010E0D9;
	Thu, 18 Jan 2024 19:07:58 +0000 (UTC)
Received: from cluster-d.mailcontrol.com (cluster-d.mailcontrol.com
 [85.115.60.190])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F76210E0D9
 for <intel-xe@lists.freedesktop.org>; Thu, 18 Jan 2024 19:07:57 +0000 (UTC)
Received: (from mailcontrol@localhost)
 by rly12d.srv.mailcontrol.com (MailControl) with ESMTP id 40IISPAv111597
 for intel-xe@lists.freedesktop.org; Thu, 18 Jan 2024 18:28:25 GMT
Received: from rly12d.srv.mailcontrol.com (localhost [127.0.0.1])
 by localhost (envelope-sender ttayar@habana.ai) (MIMEDefang) with ESMTP id
 40IISOhp111423 (TLS bits=256 verify=OK)
 for intel-xe@lists.freedesktop.org; Thu, 18 Jan 2024 18:28:25 +0000 (GMT)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
 by rly12d.srv.mailcontrol.com (MailControl) id 40IIS0iF106447
 for intel-xe@lists.freedesktop.org; Thu, 18 Jan 2024 18:28:00 GMT
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03lp2232.outbound.protection.outlook.com [104.47.51.232])
 by rly12d-eth0.srv.mailcontrol.com (envelope-sender ttayar@habana.ai)
 (MIMEDefang) with ESMTP id 40IIRwhj106273 (TLS bits=256 verify=OK)
 for intel-xe@lists.freedesktop.org; Thu, 18 Jan 2024 18:28:00 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V2zhYsRybWewcUuSDNNzV3il2Kovy3PuLqSE48jy+OJoaIYUjnfE0GOmsM6A4z7l2/p7ldVmvCVowYobh3dp92SXO6cTm/70AqA8JYGBCW/HN+VaWp9fLQ3n0+gHY17KmVvDgywdZZ+3yZGjPIg0AV5zLGj9aOpxUDR2aUrjEI9XzgHooBxkFHGWbULybzt8QXeGOfv0JL14sF2NXjUjrVmnZEnX1ci4NOz2qrFVp2TzEuxtHR+cCrw5griCwH/dD23WzmYExfdkRXZpqk78xapKrilc8Oj1cREax8QjT3dbkljGa9fzmPyqPFSunSBvYBOrlCGdZWJN+NOZd68KfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xTL5GH9rA4DjdjsaN0hiLzBn1rQ1LWAE3k+cwhvsbg0=;
 b=CiKClfm9MUP6poCSFVFTGO4UN93oDm/cu8NYWOH9V/TuG420zdkqV7oYmQLbKgFh7iPhgHxbXQG4fP6v8Aveg9HW8gsMGCE/HXsnPlollkhlMqRy0ylxswWHi7ECc6qQfnIaWuxjWX5Pieb4UfupVhNCqK9jYu/rU90OGn76ZSexnUMRhN2baTVNxUuVrUt5iXtlX2PZ/zsZ4r7c50dHBKV5Q+P8+T9fKywxt5rmFJwQMEpaht+LDBCHQi4zuP1qYmfyAVo+EOFH2gbE6enkDUtRN9iBfbwIHTlPH6bxFjn/qZWJ5WZCX/msJrSBL29qw7WT1uhKzqehcAQVuzFU3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=habana.ai; dmarc=pass action=none header.from=habana.ai;
 dkim=pass header.d=habana.ai; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=habana.ai; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xTL5GH9rA4DjdjsaN0hiLzBn1rQ1LWAE3k+cwhvsbg0=;
 b=IKXTa/GZy3OQZjdI5tBdoJ5aBgBy+PuPRE4w7GNSphT+qbiiGC99Bf5qGY8lE6Izo+Q612mxwOQO1PyDBCc5ToJruIwzBvuCzns8ZExvgub89ugQHuadWFmeQo8yTFSklP9gMHxO6iEviahGxdXO1V2HK2eTWLVbqKOOTmQ/xjkP1g61NUWHPGcNil5SlSD9ZXkHF7/LbWWD/ymghlcXraQhorU2TKi8epQ9WbMLJufo/fUMPg37J6uQh/6qGd4Zj490yQorM5mcWh6mB3Os5R+1j4lc4kjrUuvfMVj/7NiH7vlwVgO2PjA9WSn8PxNkRx1B7IF9bGDl8A1mgBMcWQ==
Received: from DU2PR02MB7573.eurprd02.prod.outlook.com (2603:10a6:10:2d8::6)
 by AM7PR02MB6483.eurprd02.prod.outlook.com (2603:10a6:20b:1b8::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.24; Thu, 18 Jan
 2024 18:27:56 +0000
Received: from DU2PR02MB7573.eurprd02.prod.outlook.com
 ([fe80::866d:e302:d95c:6c78]) by DU2PR02MB7573.eurprd02.prod.outlook.com
 ([fe80::866d:e302:d95c:6c78%3]) with mapi id 15.20.7202.024; Thu, 18 Jan 2024
 18:27:56 +0000
From: Tomer Tayar <ttayar@habana.ai>
To: Moti Haimovski <mhaimovski@habana.ai>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe/vm: bugfix in xe_vm_create_ioctl
Thread-Topic: [PATCH] drm/xe/vm: bugfix in xe_vm_create_ioctl
Thread-Index: AQHaSjROuelL7UwC6kOcENewSTjegrDf47QA
Date: Thu, 18 Jan 2024 18:27:56 +0000
Message-ID: <99777359-52b7-46d6-be92-bf15743cf38c@habana.ai>
References: <20240118173155.3851635-1-mhaimovski@habana.ai>
In-Reply-To: <20240118173155.3851635-1-mhaimovski@habana.ai>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=habana.ai;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DU2PR02MB7573:EE_|AM7PR02MB6483:EE_
x-ms-office365-filtering-correlation-id: 4a381c7e-31f9-42af-b7d9-08dc18533107
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: r9WL/ReEfIyvPHqq/ccHN6nAAqnAFu6hF2FNu8dLunjxFnkPSm5mGYECdm+qgRqD2esmbeSqPkOn5nj08xSGx1V25AfpBVLCa2Kazp3HybtFna4WUBXG0QPDqBNGwRvTaTmhLgQujK/P5exbExOibitJJIL3aYgsQMeuGpADn3YOlwUw19W3VVVjVCqrM9btvI95sd8YgbyS5HcQce8psVpT/SKgcbDl9EJIGjJWofjARke8lIQpJ9Y097qtDJOBgQirSCsbxsF/Q+aNZxIGVgPISOxeGM9oMxg15wmr2lFnhScO91htKnbpFiWaqhkmSlhmQNRUT5tMXxvqXn7NV6hPtG52poU/EYOJ6pjTet7q1+3e32TT07Iubj++jHyqhDQ2jpcx2Afn6ULr7SNYgatEDDCrpfApxoxpUDNrlt9B2ta2jtRmw5elPZnhll/ehG+EMaoY762be+IHijza0ueue/5IjD0MtlW2afsehCi8oJCd7h1y0WF6hacrLo9ADgRAFsA7nha/+0MyVyPK+X7lTkyc3VWJog2GhJtPEu/sQNbrkkrrFVrB1dQztViIN2SO7j+2jJlBNF47NOr1tBthN3l+BZRTdsJnSSLH9r9KEgAbt3lNA2LALww9RkBKxw00l2ERCOo76wGqFGSZcjI1YsQA2zg5zLWZmHkutRmhho1bzhx8/ul7d3s2a0wt
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DU2PR02MB7573.eurprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(376002)(39850400004)(346002)(396003)(136003)(230922051799003)(64100799003)(451199024)(1800799012)(186009)(2616005)(26005)(71200400001)(6506007)(6512007)(53546011)(83380400001)(316002)(86362001)(4326008)(66446008)(8676002)(8936002)(76116006)(31696002)(478600001)(91956017)(6486002)(64756008)(110136005)(122000001)(66476007)(66946007)(82960400001)(66556008)(38100700002)(31686004)(38070700009)(41300700001)(2906002)(5660300002)(36756003)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UDBzMVdKWkFtN3UyanlNTlhFRTdQRkZIMytMQmxrSEdCLzBySmNNV0lGUGRo?=
 =?utf-8?B?TWQzbXhYWVJLTHpSbTUza01SMDVybzZ5SCtLM2VtVDNCT0RLVC9MSi8rRWZv?=
 =?utf-8?B?T1lhOWVDeVJxNGNJaE9tRS81L3o1ZXdNQWtmd1c0WUFBTGgzMjQ2ZTNCM216?=
 =?utf-8?B?YnhzSFlMMHFmR3FQaVBWMm9yN2JjVWlFbmNZS1JvK3JvRm1SanB1QkNycWxX?=
 =?utf-8?B?OG5aSTdCRmhtc0U3T1hyeHRwSlJaT0x3OFgvYVB1OUQzdUtFc2VkajhBMTZS?=
 =?utf-8?B?dHFPZi85ZEljSnpMblRmVndjM1V5ZEVaeXNvdzVYUkZKbWZkeUFIQVMzS2NZ?=
 =?utf-8?B?eGNHRmZ3WkpDQmlIVzBjVDJxRWhEeFY2enlEbUZSNWFiUHhkb1Q4K3NLYUVY?=
 =?utf-8?B?VEtWaHVXVXJ6d2dHbG9Lb3ZsY0lRSDR3ZFlhTDZnR0p4ZXhrS3hJQ1dMS2Vv?=
 =?utf-8?B?RzVsaDFuY0ExYWxyNDE4VTdBSmJBUUdEbVhpaWFLblhtcGJVN2hoaGZncXVq?=
 =?utf-8?B?S0hqUnVrbnZsK1pLYVdkUGRKazRwdWJmWkNhOTBmb2ZyNWZVcmNuVkp2RFJh?=
 =?utf-8?B?c3lUYjJqdFk5OHFGVzVITXp0OEpXaVUzNzlmeGF2aVl0UWpTNEVHUklKc0hD?=
 =?utf-8?B?S1A3Vy9ZTTAxT1BxcGExOWpkOXB2dmtUK0NEK1RlcjM1SHFCWjlQcFNOakZ1?=
 =?utf-8?B?NGJIbm9oQVQvN3pkRjMwdEw3dnZOTlh0a0tYdFA0TWNPTkZLblpyWkc5NFlS?=
 =?utf-8?B?V3U4Nk5SNUxRNnIvV09ZVWNqUTh0aFRWMC9FVVBYeGY4dFhNamNoTnhxbUdL?=
 =?utf-8?B?dVV3L2hNMkZFY2lMOTQzTkpxbnJkZlZiL1AvUXVQME1XbGZkcm4yQTNEeXU5?=
 =?utf-8?B?YitVdkJmYkVLWEZZVnQ3c01CcFZRV0cxeEdhL05QSWExQ01IZlQxbk9SM1M3?=
 =?utf-8?B?cVRBeCt2Q2dtOTZ6RzNHOEVYd0pyd2FjSWlkYk1UOW44RnpSZWM1eHFmYVgv?=
 =?utf-8?B?R2tWRGdyQk5iM2hISEtZc2VVZ0sralIwdUZNZERabGFKbThsVU9YNmt5QW1T?=
 =?utf-8?B?U0Y1RnhVRDNubkJlN1ZmQWxpVktGYTVHTmhpb1FWL2szd3NsQStMc3JWK3pj?=
 =?utf-8?B?ei9BdmNYVC9nVW5uUWhYeFB2UVIyek1aNTREODBGT0hHZ0lSellmak9PekdQ?=
 =?utf-8?B?blc2U1E5SklTaE1pMzEyVTdjUlRMRC9tc1Q2bzk1Mmp0aEJta2FJRGkvYW5v?=
 =?utf-8?B?TjNEWlEyT2kzZ1lFYkRnMk5UcU5hRG9MTHQrV3d2Q28yczhUd294elZPMHg0?=
 =?utf-8?B?ZDN3UWFycmJWMCtkUVVTQXlycGZnelBlUll0Unc0NlNkeUNFVmxBUmkvTTR6?=
 =?utf-8?B?UDJqazlSYXc1M3FpZy9FczFROUVRdXpwejVIellZd29ZRUpycUNhbFYxaFor?=
 =?utf-8?B?c3Z1Y2oybXN1S2hxOVFPS3NXZVp0YXpPY3gyR3FtQ0VGY2Y1SlZLVjNCWlVj?=
 =?utf-8?B?VTh1MFlzWm9MekxqQXpEOGR2Rms3K1lzWHp1V2h2cFlyMXlnWWl4K3BWNmFZ?=
 =?utf-8?B?dzI5eDViUjdJbEZyK0N4WkhnNklneS9rNmFKTGtGVUpwdVhwQldRNTZML056?=
 =?utf-8?B?RWgyMzN4UDlOS0tuQ005TUVMaE1raFRJY25ZZVZzNUY3T0ozQUJEcXBDOFEw?=
 =?utf-8?B?dGRLbjJ2emtXQ0I4QjVRVWRJTkNRRDFLNzFFZDV0QnlmUjFZWG5DZ0RlcWRZ?=
 =?utf-8?B?SEkxZ0dwOU5ZUUJCMTFhZXlPZFNsZG9NSW9zWEVxaGtVQlNSMlAwc2prbkcz?=
 =?utf-8?B?cW1NZGt1ZUI2NEs3QzZjdlp0cmFxeWFqVjVuM0xNbUhuR1ZxRDNJaXlKSjFs?=
 =?utf-8?B?Zk50YTFGZVQ1SmRYa1grampSMmExbXhuNnRKeHBDa1ZwN052RFphc3V1WEpT?=
 =?utf-8?B?bk9nSHVOYWlvNWJUQktQTmJaSHV4aldaM2t6R0xNbjM1cjRrdUo3b0hQdENL?=
 =?utf-8?B?c3d1cDZwME9zWVJ2Q1pJeFdNak9wbE4yTVp2eUk4eVJqbzNtVElaR0h1b0VT?=
 =?utf-8?B?cTNXa0hER2ZyQnc3UzF1bU1mZldXUkpHejZER3YvSUltbENYdFNLK2FtWkxl?=
 =?utf-8?Q?xTbM=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <35D4228896E49F4BB5397E55D0B713E6@eurprd02.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: E34zMtsYQjj6RDmV18QD9T/DLJTdfgsxL2Ckf/h3H5Z765a1VOac4RoVIwh7Ylu6Kmqf6R8+Fg1wUzumUc9Gf55DGSjlohMsSOGotL059FmT7Bl0kD+5xQyxZv4JlXXP5FVEZA4ZzqT5q2BIePaD5k6gtKBhnnm1IOVk/boM0hqexKtHjfxPWOWVbqV1mbsuATe0YIq+T7qa+3gICBGIbsD384YIhBA/Yuy5K/NGukWCF8VaNins+08Xc3DS2G0tTh8YEiaszWyjcXDfh3qke0KE99rJ5KreiQmb8lyeIeckB/X3yUPvm6rbWyLsAaJrwwitTMNgxstbZVJ9ZC6hiEuc5UbSiGMit0u94Gqjo3X5TboXsCwNxhwTUm9AyOTzaIFIRw0MyaN+HDsqksmnRRgeqcjVPKLhu4ywpFvOou8+7gMrjN4q9uFUg6efNiJ0abqoDCr3eJRBVXCe61RmcNOPXWbvA7Pgh+T1kf3S7ocT4/AnFq8UTQOcMBzFgnwMfToHOXJmt7/CS8Hqcf9YaqWomm3bzIZiAFjnBkz4Tqf18TSIRlTJZsjEurzcMTPaRySazcELF3j2Ql3O47Ulb2tPd6SxtwY5qMDMq8Ad8PhtgQ6FhLx/YsoEGATQlxSW
X-OriginatorOrg: habana.ai
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU2PR02MB7573.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a381c7e-31f9-42af-b7d9-08dc18533107
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jan 2024 18:27:56.3635 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d4d4539-213c-4ed8-a251-dc9766ba127a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0nngsqF6eKAuCnpFtCTJYgaWu6uy+jh255d/vaTJGqdvTi7aWosxRy1SYgjegqaY4JZDdjuGpriVFBwJ/3yu/w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR02MB6483
X-MailControlDKIMCheck: cGFzcyBoYWJhbmEuYWkgW3Bhc3Nd
X-MailControl-OutInfo: MTcwNTYwMjUwNTpGUEtleTEucHJpdjrMVrl51q5cJV4H6gLT1Hs5G5jVz7gyD1B4uHKuYk1ViGSQYMQObj5KA9aaqdZ1hoZbLeU3/tk0NhYn7DRZXApDmtvYci45QbxPjaHn3FFDUO7VAaLABsucyZLDEXZiGtyJhpTgk7jy+WC9QxpNwfcCmbtkROUK9qHcEpd7psFEfd/ttmU9Uz0ECrRt8II0zJ7lka7tyA3KwhURK+B8Qn/uT46/c7Y2W23EZa/+pcSLsvPCdqdJK6o8c6Wu9S+tl1uq8bhVLp7OLWxOgEkxFTGTNza4P5OzY5yGB4qaJGcQloGnLMuLhcB5+cOfsiwDAjQERRLNbic0itYy9Ydv9dS3
X-Scanned-By: MailControl 44278.2143 (www.mailcontrol.com) on 104.47.51.232
X-Mailcontrol-Refers-To: 40IISOhp111423
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=habana.ai;
 h=from:to:cc:subject:date:message-id:references:in-reply-to:content-type:content-id:content-transfer-encoding:mime-version;
 s=fpkey81949-2; bh=xTL5GH9rA4DjdjsaN0hiLzBn1rQ1LWAE3k+cwhvsbg0=;
 b=bMl+1yEqLjju+mbNDeAZLDivgfYCGlT+2M8JAsjnUn1N+wc8xVGR+aKsgSCUddDyJ7dRlvAU3VpkC2c3l+qHj5GYChSeEWgjX6n19Pp6fzJD3rTEBFoGlMk3LotYiOGWhz1AXPR4G13NwIj6BIwpezbCHQvPwIMItr9OC8O7KMO+D72wYKe7+qp8lYGPGPppKRJMGC6AzQbJn4NnW+c0R1i0KAheiS5IpHMkqbJqa2vFCqVFhGYhqkT8BaT4n/r1muRxYlkIqXlG5PUUO7bcZWdNwdGFnpUojdQsj6xXtecSZx5wRXuItaSlyAmjxsm3Zmg/qWuBECp4/nzhMthWqA==
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

T24gMTgvMDEvMjAyNCAxOTozMSwgTW90aSBIYWltb3Zza2kgd3JvdGU6DQo+IEZpeCB4ZV92bV9j
cmVhdGVfaW9jdGwgcm91dGluZSBub3QgZnJlZWluZyB0aGUgdm0taWQgYWxsb2NhdGVkIHRvIGl0
DQo+IHdoZW4gdGhlIGZ1bmN0aW9uIGZhaWxzLg0KPg0KPiBSZWxhdGVzIHRvOiBGU1ctMTM2MCB4
ZV92bV9jcmVhdGVfaW9jdGwgZG9lcyBub3QgZnJlZSB2bSBpZCBvbiBlcnJvci4NCg0KUGxlYXNl
IGRvbid0IGluY2x1ZGUgaW50ZXJuYWwgdGlja2V0cy4NCg0KPg0KPiBTaWduZWQtb2ZmLWJ5OiBN
b3RpIEhhaW1vdnNraSA8bWhhaW1vdnNraUBoYWJhbmEuYWk+DQo+IC0tLQ0KPiAgIGRyaXZlcnMv
Z3B1L2RybS94ZS94ZV92bS5jIHwgMjIgKysrKysrKysrKysrKy0tLS0tLS0tLQ0KPiAgIDEgZmls
ZSBjaGFuZ2VkLCAxMyBpbnNlcnRpb25zKCspLCA5IGRlbGV0aW9ucygtKQ0KPg0KPiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3ZtLmMgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVf
dm0uYw0KPiBpbmRleCBhN2U3YTBiMjQwOTkuLjhkYmUxMzY3NmEyZiAxMDA2NDQNCj4gLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL3hlL3hlX3ZtLmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hl
X3ZtLmMNCj4gQEAgLTE4NTUsMTAgKzE4NTUsOCBAQCBpbnQgeGVfdm1fY3JlYXRlX2lvY3RsKHN0
cnVjdCBkcm1fZGV2aWNlICpkZXYsIHZvaWQgKmRhdGEsDQo+ICAgCW11dGV4X2xvY2soJnhlZi0+
dm0ubG9jayk7DQo+ICAgCWVyciA9IHhhX2FsbG9jKCZ4ZWYtPnZtLnhhLCAmaWQsIHZtLCB4YV9s
aW1pdF8zMmIsIEdGUF9LRVJORUwpOw0KPiAgIAltdXRleF91bmxvY2soJnhlZi0+dm0ubG9jayk7
DQo+IC0JaWYgKGVycikgew0KPiAtCQl4ZV92bV9jbG9zZV9hbmRfcHV0KHZtKTsNCj4gLQkJcmV0
dXJuIGVycjsNCj4gLQl9DQo+ICsJaWYgKGVycikNCj4gKwkJZ290byBlcnJfZXhpdDsNCj4gICAN
Cj4gICAJaWYgKHhlLT5pbmZvLmhhc19hc2lkKSB7DQo+ICAgCQltdXRleF9sb2NrKCZ4ZS0+dXNt
LmxvY2spOw0KPiBAQCAtMTg2NiwxMSArMTg2NCw5IEBAIGludCB4ZV92bV9jcmVhdGVfaW9jdGwo
c3RydWN0IGRybV9kZXZpY2UgKmRldiwgdm9pZCAqZGF0YSwNCj4gICAJCQkJICAgICAgWEFfTElN
SVQoMSwgWEVfTUFYX0FTSUQgLSAxKSwNCj4gICAJCQkJICAgICAgJnhlLT51c20ubmV4dF9hc2lk
LCBHRlBfS0VSTkVMKTsNCj4gICAJCW11dGV4X3VubG9jaygmeGUtPnVzbS5sb2NrKTsNCj4gLQkJ
aWYgKGVyciA8IDApIHsNCj4gLQkJCXhlX3ZtX2Nsb3NlX2FuZF9wdXQodm0pOw0KPiAtCQkJcmV0
dXJuIGVycjsNCj4gLQkJfQ0KPiAtCQllcnIgPSAwOw0KPiArCQlpZiAoZXJyIDwgMCkNCj4gKwkJ
CWdvdG8gZnJlZV9pZDsNCj4gKw0KPiAgIAkJdm0tPnVzbS5hc2lkID0gYXNpZDsNCj4gICAJfQ0K
PiAgIA0KPiBAQCAtMTg4OCw2ICsxODg0LDE0IEBAIGludCB4ZV92bV9jcmVhdGVfaW9jdGwoc3Ry
dWN0IGRybV9kZXZpY2UgKmRldiwgdm9pZCAqZGF0YSwNCj4gICAjZW5kaWYNCj4gICANCj4gICAJ
cmV0dXJuIDA7DQo+ICsNCj4gK2ZyZWVfaWQ6DQoNCk1heWJlICJlcnJfZnJlZV9pZCI/DQoNCj4g
KwltdXRleF9sb2NrKCZ4ZWYtPnZtLmxvY2spOw0KPiArCXhhX2VyYXNlKCZ4ZWYtPnZtLnhhLCBp
ZCk7DQo+ICsJbXV0ZXhfdW5sb2NrKCZ4ZWYtPnZtLmxvY2spOw0KPiArZXJyX2V4aXQ6DQoNCkFu
ZCBoZXJlIG1heWJlICJlcnJfdm1fY2xvc2VfYW5kX3B1dCI/DQoNClRoYW5rcywNClRvbWVyDQoN
Cj4gKwl4ZV92bV9jbG9zZV9hbmRfcHV0KHZtKTsNCj4gKwlyZXR1cm4gZXJyOw0KPiAgIH0NCj4g
ICANCj4gICBpbnQgeGVfdm1fZGVzdHJveV9pb2N0bChzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LCB2
b2lkICpkYXRhLA0KDQoNCg==
