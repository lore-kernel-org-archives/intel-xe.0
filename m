Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C22EC47DDB
	for <intel-xe@archiver.kernel.org>; Tue, 23 Jan 2024 17:35:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4933C10E55E;
	Tue, 23 Jan 2024 17:35:16 +0000 (UTC)
Received: from cluster-d.mailcontrol.com (cluster-d.mailcontrol.com
 [85.115.60.190])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7768410E55E
 for <intel-xe@lists.freedesktop.org>; Tue, 23 Jan 2024 17:35:14 +0000 (UTC)
Received: (from mailcontrol@localhost)
 by rly02d.srv.mailcontrol.com (MailControl) with ESMTP id 40NHZDIw238035
 for intel-xe@lists.freedesktop.org; Tue, 23 Jan 2024 17:35:13 GMT
Received: from rly02d.srv.mailcontrol.com (localhost [127.0.0.1])
 by localhost (envelope-sender dliberman@habana.ai) (MIMEDefang) with ESMTP id
 40NHZBBD237426 (TLS bits=256 verify=OK)
 for intel-xe@lists.freedesktop.org; Tue, 23 Jan 2024 17:35:13 +0000 (GMT)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
 by rly02d.srv.mailcontrol.com (MailControl) id 40NHYKDu226465
 for intel-xe@lists.freedesktop.org; Tue, 23 Jan 2024 17:34:20 GMT
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2050.outbound.protection.outlook.com [104.47.12.50])
 by rly02d-eth0.srv.mailcontrol.com (envelope-sender dliberman@habana.ai)
 (MIMEDefang) with ESMTP id 40NHYJHB226288 (TLS bits=256 verify=OK)
 for intel-xe@lists.freedesktop.org; Tue, 23 Jan 2024 17:34:20 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HXzxjBgf4Uw34egnGNSjiSGHigFMlg0B2azCwMTyvFwfSxMUb+H6Lx76aF4yOkJW0VYT9G5znnm1W3tuJLHn1+z8BNJ6e3y4eKx7rOgUQHAbhpTuDyI+a44JOY4AkCp2GTe56K5bBPseJUMY7O1dZzYitwfk387+Jb79jhaqi13aKvRmUJeoTtJ+P/clVzKa/ldJ6RLoltjaCV4qnnRVAndAq+ON2zfZAEdEd+BUlwm1xQ6shFdklJzXnyFPQ5jIYgyp9FHpXAJTHNrWESNyoEgXOLoi4XoLxSHcbyu/NxqOY+4ixDhOZOPadyo1B3nLNbD41j8TD1qggI7TWdA/Qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8lRHbtoUKSeB/gpOKmvR525r/yv4G7zXYWranvZgGEY=;
 b=WtE1teqvwUe8yPtC09nzbTQZI8KjDUcsShNVsI7QcrAu8CwXd1g/ab2K+eDmIMtxb16yU3nhRi588kfawmhcC/aWKNGXJdNcG5mGrmfpP/cCyVw2F5uZrmTDoS9pmPw9aE4eNtDDzWbWYihCLnTXQOYqT5vdZnK7W51gLyR8gVyA/3rSXtc2kBFUQSu1Sq1bGedbNBnco8aDLJpqdQtJAva75EfwrcbJ3HEykNTxS+8INoAOY1CtJk0jjcDOfM16EDfurqjyk4qsHOqtGsGsbjjGxsN017K1xibeV1X7CYSm1xmAmQ9ugFDEUXqCwmp4IQLPnStSKTuheTxPxdAMRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=habana.ai; dmarc=pass action=none header.from=habana.ai;
 dkim=pass header.d=habana.ai; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=habana.ai; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8lRHbtoUKSeB/gpOKmvR525r/yv4G7zXYWranvZgGEY=;
 b=k9Lxi6mk2ReryV/tN3QKh4YC5pzDjXwvjir9QbqonZAJjI9YzYYNFdd6ES4VNEPQDB5jqgKvbSKi7tVlUVMHjHIL6GuyA0tAjRC++F9dSjKie488IZBKa1csLieRFgdPrSPx0INQLNKP0VsI2b2Zc4WNl0AR4zNeFgUjBZ4WATN75uBqypn+FtGcoOlqUrkKuvuGuONDz0YZdbYZ+fXaSC8K0383Aa+Iupl5oBcDn+cYd8szfdpWwRmn86nAeL99fUCM3YgFta5ZFhGuTvBRKie4oqeCA3rEnr0aBCeMNeR+mAm69ezDIcXwK1/yyfwUBIEkfihMe/jaC/mEvucCyA==
Received: from DB9PR02MB9946.eurprd02.prod.outlook.com (2603:10a6:10:461::11)
 by DB5PR02MB10334.eurprd02.prod.outlook.com (2603:10a6:10:48d::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.32; Tue, 23 Jan
 2024 17:34:17 +0000
Received: from DB9PR02MB9946.eurprd02.prod.outlook.com
 ([fe80::d9fc:5d73:317b:eac1]) by DB9PR02MB9946.eurprd02.prod.outlook.com
 ([fe80::d9fc:5d73:317b:eac1%6]) with mapi id 15.20.7202.035; Tue, 23 Jan 2024
 17:34:17 +0000
From: Dani Liberman <dliberman@habana.ai>
To: "De Marchi, Lucas" <lucas.demarchi@intel.com>
Subject: Re: [PATCH v2] drm/xe/irq: allocate all possible msix interrupts
Thread-Topic: [PATCH v2] drm/xe/irq: allocate all possible msix interrupts
Thread-Index: AQHaTEiV4tmJHXljTEmlQFZikJM1H7DnnFsAgAAP24A=
Date: Tue, 23 Jan 2024 17:34:17 +0000
Message-ID: <6f2080ad-135f-4c7e-bd40-47f531db2d7f@habana.ai>
References: <20240121090214.2072923-1-dliberman@habana.ai>
 <fxq47vgjlyhjeijm26ftw37zzcza4ai4jwgxtvuekpe4t2y2z5@dxhsegrvwkul>
In-Reply-To: <fxq47vgjlyhjeijm26ftw37zzcza4ai4jwgxtvuekpe4t2y2z5@dxhsegrvwkul>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=habana.ai;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB9PR02MB9946:EE_|DB5PR02MB10334:EE_
x-ms-office365-filtering-correlation-id: d51dc401-f640-4a4a-fb21-08dc1c3986b2
x-ld-processed: 0d4d4539-213c-4ed8-a251-dc9766ba127a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 19ma3g8qHE7mrnqEVrd26cmm/1hfp1mg8aQgFut2IP6ncjZpj1ukFpfzgEvRfWqUBpvLy/lDeGb4I/NqnwVO/ZUxh166oHps1vVZ2dvdbesjwdKDx0TJ48cLU+oOH7KIVpOHl2mzXtqnM2gOsuDHMxuNLZEAB8yFBjzC4lDWq33shclFo4xGCbVL1sHFQ0zfq+VnK8WlaQreshbxDoMG2oQhv3WsqLFjmNB30/2xAWyoVqFkK6gNvjkR+7iSSLdOIk4I17cn1vnxa8hZUV2GWKi7KBFECStKkD8nsiNv0IR41OCkCEvddsM9p1tBbvq5izs0iv76/XBcFq3ptL9+oNPvhyGxOCqUei8dx1sHuIqAaRLt3p1gf4V+0FC92g5yOkC+LjwoZyhhObd/cfws8IhhjypxzYtTEIvc8AfiyqgiWyWa3O7GHXjGH3Mnm0ZjwykC0m7L5eiIc7XdeoktawG3JaeQcIbV0Y0q9rniIJBSQzTmxnu2HTA+QPgdVoKtNLqV8+fOXdR52+xOOdWyenBHyQi4ZH/0/Iao1yygyI3va9EJyvffXdjhYQDOOPxXkfSoiqKaoRd8gs/WWRe+l2d7WiFvcSQyn0RboNxOEco5XRlyuf4Q0tADIDie1+ZynoV3FaL/YqKq6DxltbDjcQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB9PR02MB9946.eurprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39850400004)(376002)(136003)(346002)(396003)(366004)(230922051799003)(1800799012)(186009)(451199024)(64100799003)(38070700009)(66899024)(6506007)(53546011)(122000001)(478600001)(71200400001)(2616005)(6512007)(66476007)(4326008)(8676002)(316002)(8936002)(38100700002)(91956017)(66946007)(6916009)(66446008)(82960400001)(76116006)(66556008)(83380400001)(64756008)(86362001)(31686004)(26005)(31696002)(36756003)(41300700001)(5660300002)(2906002)(6486002)(45980500001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Zm9acXY0OWZqSFZ5MmlMcHd6RTNub2wwWWFCRjdHUTRPZU5HMTJPMkJpZ3Iz?=
 =?utf-8?B?U1U4cjlDbndEb3RreE44cHFQRndJbDMwMll4VHozTXluWitLYTRyOG9hQ0Vp?=
 =?utf-8?B?YTVxNlhTMzhWV3M3MWJaZDE3VGJNRW0yaXkySEZwUWRmV0JiVzFHOEFXdmxX?=
 =?utf-8?B?RThVQ1QvT2lZVUhacDg0YzdBcmEybjJVVko5RVdBcmcwVC9IRmE3enBkUHd3?=
 =?utf-8?B?UlBOWUhCRkh5LzE4eUhKUm9pL2Q2dDJWU3lJS1pmYTdaRElnUXRreGZ2TWIw?=
 =?utf-8?B?MG1DZ3F2UGJLaExPalZZTXlGL2lkYkc5NEdxajVrNGg4UlY1NXY0UmNZQ2xM?=
 =?utf-8?B?NzQ5Mk1TOGV3dXFVTkd2TmloWnprcEwvMS9kZVZ3azhRa3EyMWhibTJ3MERY?=
 =?utf-8?B?VCs2Ynl4d3drb1ZxNG9YUFBmblI4YkhJL2dzR0hlUWZNUzdzOGh5ajVpTHlF?=
 =?utf-8?B?ZmZLS0R3ZDJwUjVMMHRYYUR0UEt2TmEra3hhMk5HbkN4YW5VNnQyOE1zY3Nw?=
 =?utf-8?B?THdacVlTcDQrRkRwaXJIZkI4QVBhMHdJVVdnanRqZ0ZleGFLNUR0VlJMaHV0?=
 =?utf-8?B?OUc3YUlqdlI2VzdQQWdtQmlDejF6ZlZQSnJZdWtaODJERW9xM1BJOVorQkpP?=
 =?utf-8?B?WDh2WEdUSnNTRFFTZVhyMjRKZ0tVbnJRNGZiRnJBZEtwclllalZOYWwzeXNZ?=
 =?utf-8?B?MHcxbWVYQ1lrYit5MGhhcVNqQU4rbGxJS2tsckNKNWc5amk5UDhwTVFWcjFu?=
 =?utf-8?B?TDhHcE9lZ2hZZ3NzWDc2MGlaV2tvTTNUcmlUQnJJNnNUSnR1dklySVAvMGpj?=
 =?utf-8?B?dFZDTm5EMHZIYmhTUkpPd1h2SCt0SHlqczNUVDJJK1FWSkI4NVhmb3A0N1Fh?=
 =?utf-8?B?WCt2aGpWN2Z6OFZnQmtTYkhzM1BvRXRuYzd3WVZ0YjM4RGs0ekNaQUVKWlFS?=
 =?utf-8?B?RFZZaGE5K3dqam1OSi91V2VwVk9aU0gzZ2tOQWtCY2g5aURHaW1KUEsxbjU0?=
 =?utf-8?B?NDZvSFgyYVZHVUtOTElHTDQ3b2loeUk2VFY4U3JsaEoxOTZwNDVxL00zbGsz?=
 =?utf-8?B?NTFhRHUxbThoRWZVdFNXZHpEY242T3lzRlg3RHBGdUpSbGJpbnhwaXhBWkJ1?=
 =?utf-8?B?cnJZaHFEeVZpQjNUeXVEMUNRVnpsMTNINlBsaktzUW0xOXNpRjAvMTBhN3Rw?=
 =?utf-8?B?ZEJzWG5aSVVwcXpuQXpCQ002WVY5dDJCeWttcUVnQlZ6TmJmUlpGRlBVZTVm?=
 =?utf-8?B?OVNrS1JZN1M4d2dsRUtJUWtLeDNKbGFpK0w0eER3S3BPSzBXNHl6V3FRRFN3?=
 =?utf-8?B?MDJ0L1Z5d2ltYzJ5T3ZNZ1UzS0NsTW9VNGJQRmFhYklkRGFZWHB1b0tBY01W?=
 =?utf-8?B?K1dpOE1hazlRbEVFV0YwazFYelFsUFI2NWV5TnhyREtDTGh0MGlwQkpTTlNC?=
 =?utf-8?B?UFlqWFJLSVY1TFRXSCtHZ29ya1F4SU5qNEhMbTk1b0NlMGRGQXQvLzBNa0Qx?=
 =?utf-8?B?VWlDWkhWRjliaTdSbVpURUhxbUxTWW9ZektRdEdTTUZpWFVCWk5WYkE0aEJu?=
 =?utf-8?B?SXBadE10Zit2eDhFR3B6NVd6SHNOMzIraGEwUFFBSVMzTEc2ZVR4OXJJTUox?=
 =?utf-8?B?SGQ0ZndkWkFKbmRETE5sSzZSZmwwbndpeDFnN0Fja1lPVzJ5dGZaa1VFSkdp?=
 =?utf-8?B?Q1dYdE1VQVg2M1BETWR4VTIzWnYvcVVDVGFhMjNGSktSM2I3ZmNRWFJUenBk?=
 =?utf-8?B?OWtOKzk2U29menlGNnBZb08xbWQrSVFyMnZVNVc5TjRGaHJUNEk3QzZIQnds?=
 =?utf-8?B?UWR2WUpJR2RPdGV4dWw5UGNLdGs1U1pvOVU3U041WnVQUlAyUWhTTXdpTEk5?=
 =?utf-8?B?NC9EOXpjR1NTNS8wZjI4MFQ3QXVGSVZLUXkxYnIrbjhjcUphdXNOazNUbDJm?=
 =?utf-8?B?VFdWN2xOcUdwSm1GZXAwYWFWMFpWN1FBQldEaTNRNDRxUzV2bFhyMEQ1cEx4?=
 =?utf-8?B?OGZGU2E5QStiaXVYK3hrc0Q4ZU5jMHR1OEl6OG4yemt0SjBBK0VMTnRoeEoy?=
 =?utf-8?B?YUtheFNmM2xTQU9yRFhqM29wOW5EUTRNbnBsVWdSdmcxNUdhQzZoQmlPYTVr?=
 =?utf-8?Q?gdOI=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <28B8F9D91A950F4388CA2083DC0E01DF@eurprd02.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: oeMWMYZTfCgafS5bhCBwl+ICcnuRp78Df6aGbLM8AthrQGCJxIwA5AWkQyZStNCV+3UycTgU0lRPDk7ZLlSYo1q9N6cCNEKID8XEY1mMXy3PPnLnOtTtu78Jt8D+uHL9IBmcQlDl8IpgWL2EcNrxH2b9sBkAcZBLvJctxScXjclVlEU8ijTsCFcltzaVl/R5lHmSg0bbU2XQ4QHKX2PeBqOCZX74ank/8xi0dqsIU9rlTE4SMe8C3UwdEQiLTzZjcJrm27cpHsTw7dbjaHxGDgbtAyUBHPQc4Q12jVUVDB3/RLY1a49W1UTfcvdbC2j9r56UsKGAhe4rsZXG/8kiR+y4EkHzDu0Ilkc8s95XosRaizU2Ky+VdXLv8t9V/o80TWPtORD2aZmWtZi5Xc58+eCWJrFgQx4G4n0+X4busiHeuNlnE9ucPB1XjRvljv2e0euYzefRcBd+KsOSi0gE0FJlrv3Et5VCo82HfVbQJQVoPXRrzc7FKg+VPxTO39UUmQQg9Qz8+L1m125g5GOpbgGDp3UGeT9mxfbj36NkSPcvM4oo8SXqNLMD9liYhQxr6DmhZJVYH7utXA/lnc+HFEAMWz6ZiI0KFwP4oRsIsM/ROF0JdYp8KPJsmiX2B3MP
X-OriginatorOrg: habana.ai
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB9PR02MB9946.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d51dc401-f640-4a4a-fb21-08dc1c3986b2
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jan 2024 17:34:17.7985 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d4d4539-213c-4ed8-a251-dc9766ba127a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RlyTCOgr2Sn1lObaJaBZE92TEZUXane1L7CQYJrarVaHOITvtGOXwzpZnso2Ijni5np7P69eLW9WWB5XgGY9lw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB5PR02MB10334
X-MailControlDKIMCheck: cGFzcyBoYWJhbmEuYWkgW3Bhc3Nd
X-MailControl-OutInfo: MTcwNjAzMTMxMjpGUEtleTEucHJpdjpI9L3wjliNS4kpbHP3rcd4pMPjrKf5kmkp7ZgsY5+xZTBsTQOwZr4h6plgr0XK3ZHNV3LiysgFc0LHxJs5rh7U32eUEKsLMELdE3azVaDF4PE2J4CTULndilVPmKnYQAOg4e1dndqOxQI3bi0G+r7uWF/8LDHDBkaU6K9/rWI8PCVu1cth3E46u4prlGMZ1ZhmpJVAVh0ToyB+u24sfgiRukYpiPVEwDJow0NxLV+t9V3mhtfLVHmRdquukWhIMOPhiYvVtawb3PmTRgyJHiQ+vZmZKkOh6ectTMMkN5XqSKFMP6kixU4v+pWuUkHmYl5XozCwHdzQjyZ5c9hWh7Vm
X-Scanned-By: MailControl 44278.2143 (www.mailcontrol.com) on 104.47.12.50
X-Mailcontrol-Refers-To: 40NHZBBD237426
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=habana.ai;
 h=from:to:cc:subject:date:message-id:references:in-reply-to:content-type:content-id:content-transfer-encoding:mime-version;
 s=fpkey81949-2; bh=8lRHbtoUKSeB/gpOKmvR525r/yv4G7zXYWranvZgGEY=;
 b=L/Sh31rvbG3r8YrO+AAwD8eBFoa1HUSWWzFdJmCCRrhL66Tq3OvyBYwJI1lxXbB0Qz15cUd4y9Wc4NdkR3vRgStX+21E0TnvddqBP1KgYx/Rc94cGvZmtu8udG0vxYLfSOp1yQZmiwzsBxM+SguCPfJjNABeSs0qay9y7YNAyJLG3j6h4ugut3SnUqnqaTavqilHQwcbPr/5lDtjR2+f2GlpLuEIUK2Vu9hmJ9rRBIxts5SZqIh+5/WpIq7g3oVOhTSzVxV51TR5+D5UA04f6N74ctxNQd6Z+Aru23aIIkol2LBPq1qCxn5BMA04xSdYUaXcbdk4yDRqamksSF7QNA==
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
Cc: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

T24gMjMvMDEvMjAyNCAxODozNywgTHVjYXMgRGUgTWFyY2hpIHdyb3RlOg0KPiBPbiBTdW4sIEph
biAyMSwgMjAyNCBhdCAxMTowMjoxNEFNICswMjAwLCBEYW5pIExpYmVybWFuIHdyb3RlOg0KPj4g
SWYgcGxhdGZvcm0gc3VwcG9ydHMgTVNJWCwgZHJpdmVyIG5lZWRzIHRvIGFsbG9jYXRlIGFsbCBw
b3NzaWJsZQ0KPj4gaW50ZXJydXB0cy4NCj4+DQo+PiB2MjoNCj4+IMKgLSBkcm9wIG1zaXhfY2Fw
IGFuZCB1c2UgdGhlIGFwaSByZXR1cm4gY29kZSBpbnN0ZWFkLg0KPj4gwqAtIGZpeCBjb21taXQg
bWVzc2FnZS4NCj4+DQo+PiBDYzogT2hhZCBTaGFyYWJpIDxvc2hhcmFiaUBoYWJhbmEuYWk+DQo+
PiBDYzogTHVjYXMgRGUgTWFyY2hpIDxsdWNhcy5kZW1hcmNoaUBpbnRlbC5jb20+DQo+PiBTaWdu
ZWQtb2ZmLWJ5OiBEYW5pIExpYmVybWFuIDxkbGliZXJtYW5AaGFiYW5hLmFpPg0KPj4gLS0tDQo+
PiBkcml2ZXJzL2dwdS9kcm0veGUveGVfaXJxLmMgfCAxNSArKysrKysrKysrKysrLS0NCj4+IDEg
ZmlsZSBjaGFuZ2VkLCAxMyBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQ0KPj4NCj4+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfaXJxLmMgYi9kcml2ZXJzL2dwdS9kcm0v
eGUveGVfaXJxLmMNCj4+IGluZGV4IDkwN2M4ZmYwZmEyMS4uN2EyM2QyNWMxMDYyIDEwMDY0NA0K
Pj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2lycS5jDQo+PiArKysgYi9kcml2ZXJzL2dw
dS9kcm0veGUveGVfaXJxLmMNCj4+IEBAIC02NjIsNyArNjYyLDcgQEAgaW50IHhlX2lycV9pbnN0
YWxsKHN0cnVjdCB4ZV9kZXZpY2UgKnhlKQ0KPj4gew0KPj4gwqDCoMKgwqBzdHJ1Y3QgcGNpX2Rl
diAqcGRldiA9IHRvX3BjaV9kZXYoeGUtPmRybS5kZXYpOw0KPj4gwqDCoMKgwqBpcnFfaGFuZGxl
cl90IGlycV9oYW5kbGVyOw0KPj4gLcKgwqDCoCBpbnQgZXJyLCBpcnE7DQo+PiArwqDCoMKgIGlu
dCBlcnIsIGlycSwgbnZlYzsNCj4+DQo+PiDCoMKgwqDCoGlycV9oYW5kbGVyID0geGVfaXJxX2hh
bmRsZXIoeGUpOw0KPj4gwqDCoMKgwqBpZiAoIWlycV9oYW5kbGVyKSB7DQo+PiBAQCAtNjcyLDcg
KzY3MiwxOCBAQCBpbnQgeGVfaXJxX2luc3RhbGwoc3RydWN0IHhlX2RldmljZSAqeGUpDQo+Pg0K
Pj4gwqDCoMKgwqB4ZV9pcnFfcmVzZXQoeGUpOw0KPj4NCj4+IC3CoMKgwqAgZXJyID0gcGNpX2Fs
bG9jX2lycV92ZWN0b3JzKHBkZXYsIDEsIDEsIFBDSV9JUlFfTVNJIHwgDQo+PiBQQ0lfSVJRX01T
SVgpOw0KPj4gK8KgwqDCoCBudmVjID0gcGNpX21zaXhfdmVjX2NvdW50KHBkZXYpOw0KPg0KPiBG
cm9tIGRvY3M6DQo+IMKgwqDCoMKgQWRkaXRpb25hbGx5IHRoZXJlIGFyZSBBUElzIHRvIHByb3Zp
ZGUgdGhlIG51bWJlciBvZiBzdXBwb3J0ZWQgTVNJIA0KPiBvciBNU0ktWA0KPiDCoMKgwqDCoHZl
Y3RvcnM6IHBjaV9tc2lfdmVjX2NvdW50KCkgYW5kIHBjaV9tc2l4X3ZlY19jb3VudCgpLsKgIElu
IGdlbmVyYWwgDQo+IHRoZXNlDQo+IMKgwqDCoMKgc2hvdWxkIGJlIGF2b2lkZWQgaW4gZmF2b3Ig
b2YgbGV0dGluZyBwY2lfYWxsb2NfaXJxX3ZlY3RvcnMoKSBjYXAgdGhlDQo+IMKgwqDCoMKgbnVt
YmVyIG9mIHZlY3RvcnMuwqAgSWYgeW91IGhhdmUgYSBsZWdpdGltYXRlIHNwZWNpYWwgdXNlIGNh
c2UgZm9yIA0KPiB0aGUgY291bnQNCj4gwqDCoMKgwqBvZiB2ZWN0b3JzIHdlIG1pZ2h0IGhhdmUg
dG8gcmV2aXNpdCB0aGF0IGRlY2lzaW9uIGFuZCBhZGQgYQ0KPiDCoMKgwqDCoHBjaV9ucl9pcnFf
dmVjdG9ycygpIGhlbHBlciB0aGF0IGhhbmRsZXMgTVNJIGFuZCBNU0ktWCB0cmFuc3BhcmVudGx5
Lg0KPg0KPg0KPg0KPj4gK8KgwqDCoCBpZiAobnZlYyA8PSAwKSB7DQo+PiArwqDCoMKgwqDCoMKg
wqAgaWYgKG52ZWMgPT0gLUVJTlZBTCkgew0KPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLyog
TVNJWCBjYXBhYmlsaXR5IGlzIG5vdCBzdXBwb3J0ZWQgaW4gdGhlIGRldmljZSwgdXNpbmcgDQo+
PiBNU0kgKi8NCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIG52ZWMgPSAxOw0KPj4gK8KgwqDC
oMKgwqDCoMKgIH0gZWxzZSB7DQo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBkcm1fZXJyKCZ4
ZS0+ZHJtLCAiTVNJWDogRmFpbGVkIGdldHRpbmcgY291bnRcbiIpOw0KPj4gK8KgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgcmV0dXJuIG52ZWM7DQo+PiArwqDCoMKgwqDCoMKgwqAgfQ0KPj4gK8KgwqDC
oCB9DQo+PiArDQo+PiArwqDCoMKgIGVyciA9IHBjaV9hbGxvY19pcnFfdmVjdG9ycyhwZGV2LCBu
dmVjLCBudmVjLCBQQ0lfSVJRX01TSSB8IA0KPj4gUENJX0lSUV9NU0lYKTsNCj4NCj4gdGhlc2Ug
YXJlIGp1c3QgcG9zc2libGUgZmxhZ3MsIHNvIHdoYXQgeW91IGRpZCBhYm92ZSB3YXMgZm9yIG5v
dGhpbmc/DQo+IElmIHBsYXRmb3JtIGRvZXNuJ3Qgc3VwcG9ydCBNU0lYIGFuZCB3ZSBwYXNzIGUu
Zy4gMTYsIHdlIHdpbGwgc3RpbGwgaGF2ZQ0KPiBqdXN0IDEgYWxsb2NhdGVkLiBTbywgYXMgSSBz
YWlkIGluIHRoZSBvdGhlciB2ZXJzaW9uLCB0aGlzIGlzIGp1c3QgYQ0KPiBtYXhpbXVtIHRoZSAq
KmRyaXZlcioqIHdhbnRzIHRvIGRlYWwgd2l0aC4gU3RpbGwgbm90IGNsZWFyIHdoeSB3ZSBuZWVk
DQo+IHRoaXMgcmF0aGVyIHRoYW4ganVzdCBwYXNzIGEgdmFsdWUgZm9yIG1heCB0aGF0IGNvdmVy
cyBhbGwgdGhlDQo+IHBsYXRmb3Jtcy4NCj4NCj4gTHVjYXMgRGUgTWFyY2hpDQoNCldlIG5lZWQg
aXQgZm9yIHRoZSBtaW5pbXVtIG1zaXggdmVjdG9ycyB2YWx1ZS4NCg0KVGhlIG1heGltdW0gbXNp
eCB2ZWN0b3JzIGFsbG93ZWQgaXMgMkssIGxldHMgc2F5IHdlIGhhdmUgYSBwbGF0Zm9ybSB3aXRo
IA0KMUsgaW50ZXJydXB0cywgd2UgbXVzdCBlbnN1cmUgYWxsb2NhdGlvbiBvZiAxSyB2ZWN0b3Jz
Lg0KDQpJZiB3ZSBwYXNzIG1pbl92ZWMgPSAxLCBtYXhfdmVjID0ySyBhbmQgdGhlIGFwaSB3aWxs
IGFsbG9jYXRlIG9ubHkgNTEyLCANCml0IHdpbGwgc3RpbGwgcGFzcyBhbmQgd2Ugd29uJ3QgaGF2
ZSBhbnkgaW5kaWNhdGlvbi4NCg0KQWJvdXQgdGhlIGRvY3MsIHNvIHllcywgaWYgd2UgaGF2ZSBh
IHBsYXRmb3JtIHNwZWNpZmljIGNvZGUsIHdlIGtub3cgDQpleGFjdGx5IHRoZSBudW1iZXIgb2Yg
aW50ZXJydXB0cyBhbmQgd2Ugd2lsbCBqdXN0IHVzZSBhIGRlZmluZS4gQnV0IA0Kc2luY2UgaXQn
cyBhIGNvbW1vbiBjb2RlIHRoYXQgc2hvdWxkIHN1cHBvcnQgbW9yZSB0aGFuIDEgbXNpeCBwbGF0
Zm9ybSwgDQp3ZSBuZWVkIHRvIHVzZSB0aGlzIGFwaS4NCg0KRGFuaSBMaWJlcm1hbg0KDQo+DQo+
PiDCoMKgwqDCoGlmIChlcnIgPCAwKSB7DQo+PiDCoMKgwqDCoMKgwqDCoCBkcm1fZXJyKCZ4ZS0+
ZHJtLCAiTVNJL01TSVg6IEZhaWxlZCB0byBlbmFibGUgc3VwcG9ydCAlZFxuIiwgDQo+PiBlcnIp
Ow0KPj4gwqDCoMKgwqDCoMKgwqAgcmV0dXJuIGVycjsNCj4+IC0tIA0KPj4gMi4zNC4xDQo+Pg0K
DQo=
