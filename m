Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82E85C48BC3
	for <intel-xe@archiver.kernel.org>; Mon, 19 Feb 2024 12:00:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB86810E21F;
	Mon, 19 Feb 2024 12:00:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=habana.ai header.i=@habana.ai header.b="b9TJ8Ld2";
	dkim=pass (2048-bit key; unprotected) header.d=habana.ai header.i=@habana.ai header.b="e+9q/1FW";
	dkim-atps=neutral
Received: from cluster-b.mailcontrol.com (cluster-b.mailcontrol.com
 [85.115.56.190])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FC8010E17C
 for <intel-xe@lists.freedesktop.org>; Mon, 19 Feb 2024 12:00:10 +0000 (UTC)
Received: (from mailcontrol@localhost)
 by rly17b.srv.mailcontrol.com (MailControl) with ESMTP id 41JC033J138164;
 Mon, 19 Feb 2024 12:00:03 GMT
Received: from rly17b.srv.mailcontrol.com (localhost [127.0.0.1])
 by localhost (envelope-sender kelbaz@habana.ai) (MIMEDefang) with ESMTP id
 41JBxxWw134645
 (TLS bits=256 verify=OK); Mon, 19 Feb 2024 12:00:03 +0000 (GMT)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
 by rly17b.srv.mailcontrol.com (MailControl) id 41JBxEaf125680;
 Mon, 19 Feb 2024 11:59:14 GMT
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01lp2051.outbound.protection.outlook.com [104.47.1.51])
 by rly17b-eth0.srv.mailcontrol.com (envelope-sender kelbaz@habana.ai)
 (MIMEDefang) with ESMTP id 41JBx6IT118908
 (TLS bits=256 verify=OK); Mon, 19 Feb 2024 11:59:14 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ikL6SVU/PmcMKH6c3KP2DBYNgvGfChR6jOBzNNg0TQAjJ7kqnU9FDXGi66t8ZpJQ07C+MjBfXFtDyawRztRscZpwQtusgtZz5BdoafZq2ktWVBvIAD14JILY/WTOPnOqwxEGYKuxOR9RVsD8niQNEySvdhpjH/P0i1pZopG4burtDuYmM2dLZ0F/m2lLeb/OjzuxTV+v+UvCnLzV23O/MOvcInRzKqfadKP+64UIfJPS55+4N1EiDoV3hNGoGobteH+wD1BLfOMI4shJPABrEo/2ruCdyG2h3K+6q4GWaOqZK6H8jttRF0AdJun/QTCZOfqVZhJIc0PqonClRZO2FQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6efEejjjmfaRrTiwEJmfxHhpmbSH4FSyPjS+a3690k4=;
 b=ifClZ4Spga3w9ihaPWK3lMgVBAkIa9ILijQAIL0K8h6b+D+uoRVs1n/UoNQ80cY9YgxdDyYgks71cirxuYpgRh7BMDVfDyPglwsyw2B+mhMh5Sbmmrzgb2meeQ7Hz296HwcVO97y5vF2J3HSi0zfqpLXz7n1kbyla2sg35xhHBG6n6u9ajZoSU4jIYa1RMZy+ydKtIL72qSxvojPnluk3263yW/VyZHBOlVHioWZdCCubmT6CJ9KrAn4ayNflGKHShNCtITsCy6vS02xi9ZAsTXiVF4xCZbEtRH0wETWHQxb0hlVY+J3Wrbj+SgUgDTgVkt/gg93PgufwCQpzhFRXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=habana.ai; dmarc=pass action=none header.from=habana.ai;
 dkim=pass header.d=habana.ai; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=habana.ai; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6efEejjjmfaRrTiwEJmfxHhpmbSH4FSyPjS+a3690k4=;
 b=b9TJ8Ld23kIE8dx2ErR7KMyGKHVURzj2/3JJKTmrbMGPN2eOtiekNN8ktCcTEaVX4DIt2QKiI1ty9bxYpWZ9K3/4b4e5AUNwDLvk+GSgA5uU3GD/t9lhTbFCJArAki4ytN+mKtcpXu7gWVkUnWn68S3uN2hqKHz8JpT5WC+yVYxSPNG1WDXy7BYwM0AH5gjtE4ShgYnNES9TiC7EWHhM4yhkMLsmwPU3aHufoGoPlQG+eoxiXd3GH13Yk0UyrrLjZjDiw9e29aWYjQZFyAulY6CjxrZBRdjImNOouOevrPw9K/HR1Az9cWGx0151vnr1eOyc2up5Ggkp1V0109Py+Q==
Received: from DU0PR02MB7873.eurprd02.prod.outlook.com (2603:10a6:10:345::21)
 by AM7PR02MB5863.eurprd02.prod.outlook.com (2603:10a6:20b:10a::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.38; Mon, 19 Feb
 2024 11:59:04 +0000
Received: from DU0PR02MB7873.eurprd02.prod.outlook.com
 ([fe80::1652:fd49:d66f:ca07]) by DU0PR02MB7873.eurprd02.prod.outlook.com
 ([fe80::1652:fd49:d66f:ca07%4]) with mapi id 15.20.7292.029; Mon, 19 Feb 2024
 11:59:04 +0000
From: Koby Elbaz <kelbaz@habana.ai>
To: =?utf-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
CC: "Summers, Stuart" <stuart.summers@intel.com>, "Winiarski, Michal"
 <michal.winiarski@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v6 1/2] drm/xe: add a new debugfs file - mmio
Thread-Topic: [PATCH v6 1/2] drm/xe: add a new debugfs file - mmio
Thread-Index: AQHaVIAfkN+NpFEElku7+JY+JlPajLD0WxiAgAk8UQCADPibgIAHHQuA
Date: Mon, 19 Feb 2024 11:59:04 +0000
Message-ID: <42c55b01-d6f0-4869-a17c-ce859b5168b6@habana.ai>
References: <20240131195953.852641-1-kelbaz@habana.ai>
 <41d1faeb0cc7e8a0ffe9f3258c22ca3ef566ea34.camel@intel.com>
 <6d0d6a8b-7794-44ce-adb2-8c8d7b7bae49@habana.ai> <Zc1K7WMR1z_JT5hf@intel.com>
In-Reply-To: <Zc1K7WMR1z_JT5hf@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=habana.ai;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DU0PR02MB7873:EE_|AM7PR02MB5863:EE_
x-ms-office365-filtering-correlation-id: 8d0dab07-fe63-4c2e-cadc-08dc31422b3b
x-ld-processed: 0d4d4539-213c-4ed8-a251-dc9766ba127a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: JU9c/Cdbry5Cskz+D7zbuAF5PEdfePnpSuUN4WknTHxJhkpYyr78V3WmuXnvFIWinp5z7QYN9j9HXnDET1HlZaJCJEiR2F24Tqp4MIPuKZZK8cZopC8Zw1OAbgESs6+zSUW577u4CURSSgLpjGiL+XDktl2ZkTnXQNZLNfkN0XfytW1Ie9PJxT23ZbnDLnHe8gfxd3Tas4k70OENtd9DpqPCy0kCpjK3BkXOyJ0eE1OtWni8TnHXjhmODSsH78XIEOFYwv1rh9wClC9l+711hr+PmuKKgK7BeRV2tq9b3oyrOKhmujW1KufcVQUOelFfDBv+Mc1dZdqkQ2VkNnK4LHD+sW//ONgkDB9hQYJenL8u4XzRWrr+APMjnswUEebGRF4/6ZcO0yauS8ThLVyzbIC76RV3fqL/Hgxoo55JiYZy1e1TZJxvyb4zTt1OpSLMPX2CLNUdEJYKHyyf0Ly7kwYqU+Lr51IoDFJYygKAaZtPba5nVotMs4raO0lFZhxKqcZxShypW7Ymjf5G28537dwKn1o4G549eWcIpBbulanFEznS0zXQVfG8hlwlNq25KESRTviIlIKeUSTN4rDgiasjS6F+/rud2WgmlQhyBmE=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DU0PR02MB7873.eurprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?emNTOGpXellKdHBQMVFPdGg3aFZmS3lSTVNPa0ZTemlWeEJzdWRsZ3dwSDRn?=
 =?utf-8?B?dERFdE9BOFVuSFV6UkhsdEpPWU96ZG9SeENGa3dlMTlUUHRQSHVDclcyUVB1?=
 =?utf-8?B?aC9jOU1EU0xDZ2FsRGhCeTZjRDZOQisxQjVscDQ0UkgvS2YwdURTRXVQZ2FY?=
 =?utf-8?B?d3hpUWlxMGcwaFd1QUNpZ2lOWENXbHRDdVJBVDQ3dU5oWWRRT1cvRkVUWmZ0?=
 =?utf-8?B?ZGorcjVjVEh5OStqKzhXaGtxS0kyeURzTDMzRHFYc1d6OTdBbGdRRUQyMWdr?=
 =?utf-8?B?NFlKcWF2WUZHZXZYRzE2Q3dxRHVyek5UcmpDMWNVYnZJcGZzMU10WjBDaUo5?=
 =?utf-8?B?NEhUUUt0RjlFOXJGM0tUbWdHTmVza21va0hKejBoZHVhaFlGazAvRE1lNjAv?=
 =?utf-8?B?SDJzM1VQNGNSWU9nL291Njd0RjJUN3RCOUFCNXJtdXBUamlDbGYvQkhZWm5Y?=
 =?utf-8?B?b2NRaW10aStIWFNpZHFObExYWFQxclZmelczWWFzVG1jSG9sYkpRUkVCaFRN?=
 =?utf-8?B?aDh0MGIvWGJiQ3d5bnBzelhiTXNMR2FaMk96SWt3akxEY0E3VG1ZcVpjU0xL?=
 =?utf-8?B?UlJDMWlObFhDOTFQSWFJVkFIUC9JZkNRT3duUEx6OHp3THk0b1dxRzhvZHVp?=
 =?utf-8?B?WExTaitJVkdzZk9vUFcvNGFzN3pnYUYxbngrdUUrclFxNlByZUFlM2Nsd3Bz?=
 =?utf-8?B?OHFYR0d5RHJ0am56TTBNc1VnYmpEb0h0ZUJQSW1jdk15MnQ3MHZTYkwvUnpO?=
 =?utf-8?B?c2Rrb2ZRN1hielZIWlc5K3dRdWptNmFGdmxYOHhFbmFoMDVtQldNbDJCVzIv?=
 =?utf-8?B?NUdtZmpkaTNwaFlkVnd3b0E1QXN1WnVTVkN0aVA0d1FJN0J0bVdJSnZNdTE1?=
 =?utf-8?B?YlFXOWJOV2x3SS9tVXpWTU50Z3NXeWRpNDRRQjNpY3Y5d3BVZ2RHQ1cwWk5r?=
 =?utf-8?B?cXBRT2Q5NTE4OWlESGJBT2RaRjhwRzV2WVhmemZSS0Fwc05lTXc5TTJaMW5n?=
 =?utf-8?B?TFhGZ0dTU2lBYzU1Y3BUOEZFaGdQaXZsV09OeGZGeDNYT3lvNkNsWm1PYzBO?=
 =?utf-8?B?ZWMvRlZidkRoOHExOVVrUmZ5TDF6UXpqR0F3dUxFNFJ4VllIN05oYUppcUsr?=
 =?utf-8?B?eVNRckpISlF2a3NqTnkxTFBmMC9VVUpMMVdzbnkrQk0weXFxVEs4VU90NHJx?=
 =?utf-8?B?aXNmemxtdFFRSjYzNHROZ3Z0MER4OG04ejFSVSs1OElXS0RLK0FIdXpjODRz?=
 =?utf-8?B?ckMxSW5uUDFxYlFEWmVSWERsa3JuRmx1Z2JMWmVKd2xvbUpiR1kvbVB6WUx4?=
 =?utf-8?B?U083Zit5anhuMkFkcHdMb21SOFlPREkvamZPU0VoMEowVnhJK1lDSnE2OTQ4?=
 =?utf-8?B?NEJJUXFZNGFQczNvREdadndGbHppUGRBNUlsK0Foc1lxOGYrVlk4YlpsV282?=
 =?utf-8?B?Qlo4amxsdDVYUVd6YnJ0TUozb1ljeGZPa1pRWGFwZUtWMDJLZWFwQVpsVGFj?=
 =?utf-8?B?QTlvektlN2NCNUIvZm1uUEh2czY4aW5CV0dvSW5Bb3h6aSsxQkV5YUhCaHRZ?=
 =?utf-8?B?S1lIdk8wQnlseVJVcHFUNnVCQVpFRkR2UG1RT2N4bElEMmx5aGFnRGd0UXZF?=
 =?utf-8?B?SzQ4cXhqeEQwREgwL0lzRXBjU3dZdDZJUFdBRXZHbEtwMWZOTHVtbXV6VFh0?=
 =?utf-8?B?WGZFOVg3Mk1rRzVpSnBiK1VjdWI4QXhrNHpYYmUwUmRLSUFzeVJHRzdvSTJv?=
 =?utf-8?B?VWNidmx0cHJwK01UTDk4eVhxd1N4Z0I4TERBT2xWTDNhSmRXZUhvcXNuYkNR?=
 =?utf-8?B?OEZNRm92T05UL3pEdXQxNWVKWEFjN0VCWm1MSnBvWXBTN2dvUThxV3pLWDk2?=
 =?utf-8?B?T0krdVFuSUhibG5mQ0g4eldpVWk2OFVTY0VVUWxoeElkdUdXbUhFY0xlNXVJ?=
 =?utf-8?B?dExlR2NSNDh1a0F2SWZPUHR5WHhRYU9VVlkvdFJwbldaaHZSTDhzSWpUSTJK?=
 =?utf-8?B?K0tDc3BEMy8vRk9sMzZicExYMDY0MHJjejVOeVVIYXVhUldFMytQanVENlFU?=
 =?utf-8?B?NmZLOS8rYVljMDRZTTlBSXQvSzZtMW5RL1J2eU8rVUtUcDdRaXdkdzl0SFRL?=
 =?utf-8?Q?nRns=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <843E52A35C5B5549A832F242A2A769D4@eurprd02.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: wsKOwLGPjWXoSiDl/2tpxi5tpc0z70eCJKlfrhAME7F9Vq+1h3BXJxxopgy2wGk7jwhtK1jzy/j+qr5W1EaKu6kXPpSP+K44aLKfynL+QWmchDGwZoMHyBzngywUQI+sl6YTIuUlaP9qRqZ7/b9y6ebzMNkWI5zLD+IEUsjHhuw3JD9DKgd1lx7OtVkTHRXXu35my+29ea4LSl86V5StkpN5iseiw6388euut2XC2MEiyEYN+BQ5XftqEaE4p4Scja7yF9rsWStnRpHVbDq8kbmda/WPBOKyCtzpPEyvD8/Hgzo0nvorKg8rYNyE206H9XZzlaTkm4Hj7arZQI5aLDbpdCSTcqoMX3zt3aQNtU/WWAdC7+5FzLn74gnMH0/Hxpwe8Pyj0cH5Izl6nrcC4/LYmodliwTe0gaafB1dBiVOUO8XbodGmG3UcvL6ZxIZyLcj1mFXuQakwafPq/qM46kBarIKqaD2mr4DFQETuYrcFXsbY2L5j1EBYUZvQT+LrRaPrndekP5gqxDp5Zil0B60BX0msorS4iKhjz20OGyKKMjRveIgbREe5CQ12YKrFOthmKRfR9M6Cx+4O1ouf8f87nxPjjSqFGztRB0dtRCvn6GbJ97C8o1h8Ofk88Sm
X-OriginatorOrg: habana.ai
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU0PR02MB7873.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d0dab07-fe63-4c2e-cadc-08dc31422b3b
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Feb 2024 11:59:04.2117 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d4d4539-213c-4ed8-a251-dc9766ba127a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qkR7221J8TuvtLJtjtrHYn0WU/wnsEg+W00Xpe216Uxpzuk4Pj7BnxP6bgXeQoUJnyslFnJdw+VgZ3cZ8IO0ZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR02MB5863
X-MailControlDKIMCheck: cGFzcyBoYWJhbmEuYWkgW3Bhc3Nd
X-MailControl-OutInfo: MTcwODM0NDAwMjpGUEtleTEucHJpdjpr/Y4A+Ib/0UQp/c5+Byf+fiXpajRT8IZwvqBQ1UKgUIM3fh6KysIFmcZT4KUx9DiH6OL3rpg3BCkM7qFAhyH1TWYFVG5QanEGQvn2Y0s0+vGiJc9LdWI+cnEOuV2//9zd0+HjfvDP97m6JD7Q+m0pcDos2HvsqDhLO9qQ+8FZZuNbRpiqf5mjWyTpfoAkwzl0MX6sv4zOqKrH4NWp0OCCaiFt7r0n6ENwtN/VxQYYQgI3yRnzYUj5cSiIyhgo2NCdVXnxwEeaMnk9kGNqiRn9iJLmj07vwAouXRcP7q6spjql6R1xt5+Nq8r2TPhiGPR+n9Mb5Lpic13w0KMubMBA
X-Scanned-By: MailControl 44278.2143 (www.mailcontrol.com) on 104.47.1.51
X-Mailcontrol-Refers-To: 41JBxxWw134645
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=habana.ai;
 h=from:to:cc:subject:date:message-id:references:in-reply-to:content-type:content-id:content-transfer-encoding:mime-version;
 s=fpkey81949-2; bh=6efEejjjmfaRrTiwEJmfxHhpmbSH4FSyPjS+a3690k4=;
 b=e+9q/1FWqb9yvzitYIdslO1PTFx2qa+zffiUyT+F/xcq+ViqAreVvlAau+CM2L9FYKZmAiJpBtBt0sZjDeTXnRbH7aha5uysKr2QnqWmZ3IZ8bH8rc6FERe0J2cfbXRZhSi0NFzwTGi3c/9aXdV9ctXl3KZTy/b6/klHyzatNc5Raf5Ef6VnAJffBd0IDB83eYKwqa+gdWiszl+O7UrHBs+uzOXeizN37iuequYFqXB3KPQ/P/pc2jeck4T7iz0RRVkGXS9TB3e1gc7eJh2iMmmAq4jxFSPSTCDSeDisE5T+EWsACw+6odOsxrTZnzQmC8ODMqeCMZC6sgC6nv8MrA==
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

T24gMTUvMDIvMjAyNCAxOjIxLCBWaWxsZSBTeXJqw6Rsw6Qgd3JvdGU6DQo+IE9uIFR1ZSwgRmVi
IDA2LCAyMDI0IGF0IDA1OjE2OjIzUE0gKzAwMDAsIEtvYnkgRWxiYXogd3JvdGU6DQo+PiBPbiAz
MS8wMS8yMDI0IDIyOjE0LCBTdW1tZXJzLCBTdHVhcnQgd3JvdGU6DQo+Pj4gT24gV2VkLCAyMDI0
LTAxLTMxIGF0IDIxOjU5ICswMjAwLCBLb2J5IEVsYmF6IHdyb3RlOg0KPj4+PiBOb3cgdGhhdCB0
aGUgZm9ybWVyIG1taW8gaGFuZGxlcnMgYXJlIGZ1bGx5IHJlbW92ZWQsIHRoaXMNCj4+Pj4gZGVi
dWdmcyBmaWxlIHdpbGwgYmUgdXNlZCBmb3IgbW1pbyBhY2Nlc3MgKHJlYWQvd3JpdGUpDQo+Pj4+
IHRocm91Z2ggdGhlIGRlYnVnZnMgaW9jdGwgZmlsZSBvcGVyYXRpb24uDQo+Pj4gU29ycnkgSSBk
b24ndCBrbm93IHRoZSBoaXN0b3J5IGhlcmUgb2YgdjAtdjUsIGJ1dCBvbmUgcXVlc3Rpb24sIHdp
dGgNCj4+PiBpZ3QtZ3B1LXRvb2xzL3Rvb2xzL2ludGVsX3JlZyB3ZSBjYW4gcmVhZCBhbmQgd3Jp
dGUgTU1JTyByZWdpc3RlcnMNCj4+PiB3aXRob3V0IG5lZWRpbmcgdG8gaGF2ZSB0aGUgZHJpdmVy
IGxvYWRlZCBhdCBhbGwgKGkuZS4gc3RyYWlnaHQgdGhyb3VnaA0KPj4+IHRoZSBCQVJzKS4gV2h5
IGRvIHdlIHdhbnQgdG8gYWxzbyBwdXQgdGhpcyBjYXBhYmlsaXR5IGluIHRoZSB4ZSBkZWJ1Z2Zz
DQo+Pj4gdGhlbj8NCj4+Pg0KPj4+IFRoYW5rcywNCj4+PiBTdHVhcnQNCj4+IEhpIFN0dWFydCwN
Cj4+IFNvcnJ5IGZvciB0aGUgbGF0ZSByZXNwb25zZSwNCj4+IFRvIHNvbWUgZXh0ZW50IHdlIGNh
biB1c2UgaXQsIGhvd2V2ZXIsIGl0IGRvZXMgbm90IHNhdGlzZnkgb3VyDQo+PiBkZXZlbG9wbWVu
dCBuZWVkcy4NCj4+IE1vcmVvdmVyLCB0aGlzIGNoYW5nZSB3YXMgcmVjZW50bHkgYWdyZWVkIHVw
b24gdGhyb3VnaG91dCB0aGUgcmVtb3ZhbCBvZg0KPj4gdGhlIGZvcm1lciBtbWlvLWlvY3RsIGNv
ZGU6DQo+PiBodHRwczovL3BhdGNod29yay5mcmVlZGVza3RvcC5vcmcvc2VyaWVzLzEyMzQwMy8N
Cj4gSWYgc29tZW9uZSBpbnRlbmRzIHRvIGhvb2sgdGhpcyB1cCBpbnRvIGludGVsX3JlZyB0aGVu
IHBsZWFzZQ0KPiBtYWtlIHN1cmUgaXQncyBfbm90XyB0aGUgZGVmYXVsdCBwYXRoLiBXaGVuIGRl
YnVnZ2luZyBJIHdhbnQgbXkNCj4gcmVnaXN0ZXIgYWNjZXNzZXMgdG8gZ28gZGlyZWN0bHkgdG8g
aGFyZHdhcmUgYW5kIG5vdCBiZQ0KPiBwb3RlbnRpYWxseSBtdWNrZWQgdXAgYnkgYSBidXN0ZWQg
ZHJpdmVyLg0KDQpUaGVyZSdzIG5vIGludGVudGlvbiB3aGF0c29ldmVyIHRvIGRvIHNvLiBBcyBh
IG1hdHRlciBvZiBmYWN0LCB0aGUNCmRlYnVnZnMgbW1pbyBpb2N0bCBpcyBwYXJhbGxlbC9pbmRl
cGVuZGVudCBpbnRlcmZhY2UuDQoNClRoYW5rcywNCktvYnkNCj4+DQo+Pj4+IFNpZ25lZC1vZmYt
Ynk6IEtvYnkgRWxiYXogPGtlbGJhekBoYWJhbmEuYWk+DQo+Pj4+IC0tLQ0KPj4+PiAgICBkcml2
ZXJzL2dwdS9kcm0veGUveGVfZGVidWdmcy5jIHwgMTIgKysrKysrKysrKysrDQo+Pj4+ICAgIDEg
ZmlsZSBjaGFuZ2VkLCAxMiBpbnNlcnRpb25zKCspDQo+Pj4+DQo+Pj4+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0veGUveGVfZGVidWdmcy5jDQo+Pj4+IGIvZHJpdmVycy9ncHUvZHJtL3hl
L3hlX2RlYnVnZnMuYw0KPj4+PiBpbmRleCAwMWRiNWIyN2JlYzUuLjIxYjIyNTdhYTNhOCAxMDA2
NDQNCj4+Pj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2RlYnVnZnMuYw0KPj4+PiArKysg
Yi9kcml2ZXJzL2dwdS9kcm0veGUveGVfZGVidWdmcy5jDQo+Pj4+IEBAIC05OCwxMiArOTgsMjIg
QEAgc3RhdGljIGludCBmb3JjZXdha2VfcmVsZWFzZShzdHJ1Y3QgaW5vZGUgKmlub2RlLA0KPj4+
PiBzdHJ1Y3QgZmlsZSAqZmlsZSkNCj4+Pj4gICAgICAgICAgIHJldHVybiAwOw0KPj4+PiAgICB9
DQo+Pj4+DQo+Pj4+ICtzdGF0aWMgbG9uZyB4ZV9kZWJ1Z2ZzX21taW9faW9jdGwoc3RydWN0IGZp
bGUgKmYsIHVuc2lnbmVkIGludCBjbWQsDQo+Pj4+IHVuc2lnbmVkIGxvbmcgYXJnKQ0KPj4+PiAr
ew0KPj4+PiArICAgICAgIHJldHVybiAwOw0KPj4+PiArfQ0KPj4+PiArDQo+Pj4+ICAgIHN0YXRp
YyBjb25zdCBzdHJ1Y3QgZmlsZV9vcGVyYXRpb25zIGZvcmNld2FrZV9hbGxfZm9wcyA9IHsNCj4+
Pj4gICAgICAgICAgIC5vd25lciA9IFRISVNfTU9EVUxFLA0KPj4+PiAgICAgICAgICAgLm9wZW4g
PSBmb3JjZXdha2Vfb3BlbiwNCj4+Pj4gICAgICAgICAgIC5yZWxlYXNlID0gZm9yY2V3YWtlX3Jl
bGVhc2UsDQo+Pj4+ICAgIH07DQo+Pj4+DQo+Pj4+ICtzdGF0aWMgY29uc3Qgc3RydWN0IGZpbGVf
b3BlcmF0aW9ucyBtbWlvX2ZvcHMgPSB7DQo+Pj4+ICsgICAgICAgLm93bmVyID0gVEhJU19NT0RV
TEUsDQo+Pj4+ICsgICAgICAgLnVubG9ja2VkX2lvY3RsID0geGVfZGVidWdmc19tbWlvX2lvY3Rs
LA0KPj4+PiArfTsNCj4+Pj4gKw0KPj4+PiAgICB2b2lkIHhlX2RlYnVnZnNfcmVnaXN0ZXIoc3Ry
dWN0IHhlX2RldmljZSAqeGUpDQo+Pj4+ICAgIHsNCj4+Pj4gICAgICAgICAgIHN0cnVjdCB0dG1f
ZGV2aWNlICpiZGV2ID0gJnhlLT50dG07DQo+Pj4+IEBAIC0xNDIsNiArMTUyLDggQEAgdm9pZCB4
ZV9kZWJ1Z2ZzX3JlZ2lzdGVyKHN0cnVjdCB4ZV9kZXZpY2UgKnhlKQ0KPj4+PiAgICAgICAgICAg
Zm9yX2VhY2hfZ3QoZ3QsIHhlLCBpZCkNCj4+Pj4gICAgICAgICAgICAgICAgICAgeGVfZ3RfZGVi
dWdmc19yZWdpc3RlcihndCk7DQo+Pj4+DQo+Pj4+ICsgICAgICAgZGVidWdmc19jcmVhdGVfZmls
ZSgibW1pbyIsIDA2NDQsIHJvb3QsIHhlLCAmbW1pb19mb3BzKTsNCj4+Pj4gKw0KPj4+PiAgICAj
aWZkZWYgQ09ORklHX0ZBVUxUX0lOSkVDVElPTg0KPj4+PiAgICAgICAgICAgZmF1bHRfY3JlYXRl
X2RlYnVnZnNfYXR0cigiZmFpbF9ndF9yZXNldCIsIHJvb3QsDQo+Pj4+ICZndF9yZXNldF9mYWls
dXJlKTsNCj4+Pj4gICAgI2VuZGlmDQo+Pg0KDQo=
