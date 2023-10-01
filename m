Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFBD2E748ED
	for <intel-xe@archiver.kernel.org>; Sun,  1 Oct 2023 08:51:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 593FF10E059;
	Sun,  1 Oct 2023 08:51:34 +0000 (UTC)
Received: from cluster-b.mailcontrol.com (cluster-b.mailcontrol.com
 [85.115.56.190])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC02610E059
 for <intel-xe@lists.freedesktop.org>; Sun,  1 Oct 2023 08:51:30 +0000 (UTC)
Received: (from mailcontrol@localhost)
 by rly48b.srv.mailcontrol.com (MailControl) with ESMTP id 3918pSrZ024259
 for intel-xe@lists.freedesktop.org; Sun, 1 Oct 2023 09:51:28 +0100
Received: from rly48b.srv.mailcontrol.com (localhost [127.0.0.1])
 by localhost (envelope-sender obitton@habana.ai) (MIMEDefang) with ESMTP id
 3918pQqH023740 (TLS bits=256 verify=OK)
 for intel-xe@lists.freedesktop.org; Sun, 01 Oct 2023 09:51:28 +0100 (BST)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
 by rly48b.srv.mailcontrol.com (MailControl) id 3918oW8P012312
 for intel-xe@lists.freedesktop.org; Sun, 1 Oct 2023 09:50:32 +0100
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02lp2109.outbound.protection.outlook.com [104.47.11.109])
 by rly48b-eth0.srv.mailcontrol.com (envelope-sender obitton@habana.ai)
 (MIMEDefang) with ESMTP id 3918oVWU011966 (TLS bits=256 verify=OK)
 for intel-xe@lists.freedesktop.org; Sun, 01 Oct 2023 09:50:32 +0100 (BST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NXa1jYnU1HDx6I2joUPXQPw6aenYajopqQb1oLh7FY11SnnasrJZ8XsZA7mtVDFmeIYMQtLyTLrmhU2t5W+F7fqph0Fu78bA40nroDSdPmkBUMipNG5sW704AQ19aFvVhLm1dkwD4ecllz43V7BE6UIIMr2+ktTeDEdLwVtjqFT9tIII8J5pm4CcsSOZT9C5ZVYF4PiKxG5IUeE+j9gyDRZATsC8BzHplSpbdvcPP/A42imuiR0cYJJFGsWL4BxngKANXYrVQIdO+X+5TavUuwdrysEt+jyD5WEMwclcoZgk0NqJBV9bJpzCZb94bm9OHVRl1z7al4VvJ2EHz/cPUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gW1ozPXYMip0EId/QZJB8m2mrLoNEHnVRlBNwwq69c4=;
 b=Y1h3JxvZj5IUE33vZYtHBejuoHauTs8izxdXY+QHKwElVmT90By5PO6bm7VG176kXFxbB5/TNEnIAFjmzCBYSpWRg0pyewRduV7o3SIH8NjyPQwc4YkzsOVjOwJm7yJBVScxkFcmlMKyqkzL+lKUlJxaBnJMMGOLAIowGebtYoBTXVtzEvb863pwwdA98Z2eVWftlPeqRG+xePHj5sSNFKa6S2daWZ7uZqqrT3AYHNNnzCKLPUAKRadi/qvTBRT/DsrIpJEStL1XYbPTGBKz322shflpbRz520p6M2T5z2k7/AJKsputTwOzAevfnv1MBMdcP1G5zgZZSsoXiq7C1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=habana.ai; dmarc=pass action=none header.from=habana.ai;
 dkim=pass header.d=habana.ai; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=habana.ai; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gW1ozPXYMip0EId/QZJB8m2mrLoNEHnVRlBNwwq69c4=;
 b=BC+/KqRvaNVvjr5oUz5S9YL3R1TbM9SMEeHghaiiuoAiV4Gt6rd5hZelLScLJiXCE0UxPrK37wSqtD3D0nCi1AmRAAdX7wTKEv9s37uBnIZ1lReT1PJetARdkuOjIJ5ZmOTjY+lr0vSjnlAhKerYbNnqK+47DundJkLQsIskEEqGJizVkO9GjVXmRplrqElot///JvC3NsoGWDmA9uzQHDWO9jqDCCrEDNK+PuwJ3dztnYAK5xSatDZ9rCoqKItCuqW8MeyzkUFGDggGK/NvORUq3SPTE0oyBtU9TlMXDZ8F1//fU00Fbwc0G5D5xemMKcD5kAUgzV2R9tH8fmfHAg==
Received: from DB9PR02MB6619.eurprd02.prod.outlook.com (2603:10a6:10:211::10)
 by GV2PR02MB8770.eurprd02.prod.outlook.com (2603:10a6:150:7b::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.28; Sun, 1 Oct
 2023 08:50:28 +0000
Received: from DB9PR02MB6619.eurprd02.prod.outlook.com
 ([fe80::6623:3577:f97f:22c3]) by DB9PR02MB6619.eurprd02.prod.outlook.com
 ([fe80::6623:3577:f97f:22c3%7]) with mapi id 15.20.6813.027; Sun, 1 Oct 2023
 08:50:27 +0000
From: Ofir Bitton <obitton@habana.ai>
To: Andrzej Hajda <andrzej.hajda@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
Thread-Topic: [Intel-xe] [PATCH] drm/xe: implement driver initiated functional
 reset
Thread-Index: AQHZ8RbXdkFMA3UAqE6hGEvs6PZsy7A0pniA
Date: Sun, 1 Oct 2023 08:50:27 +0000
Message-ID: <eab66481-c899-2ee1-7c32-c9339db87417@habana.ai>
References: <20230927074607.3027012-1-andrzej.hajda@intel.com>
In-Reply-To: <20230927074607.3027012-1-andrzej.hajda@intel.com>
Accept-Language: he-IL, en-US
Content-Language: he-IL
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=habana.ai;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB9PR02MB6619:EE_|GV2PR02MB8770:EE_
x-ms-office365-filtering-correlation-id: 42f4e68a-4905-4462-19a9-08dbc25b75da
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: JyAPaPTN20YKV+DYlh6+nFadwe+XuhM/RI/L0qmaleorEHx0p3w2MSmh/Xb5LRnVS2WvEIuqY2IRaUFymgUih6Ed9OT/kcVncUZZE8mNd+shLxVyFcPU21r7ERQd7+grwoShOA0XOec0aWas8FXk/nslDdurqHXgkag3etxuO3I2Vq+q0Jdi1g3WtdMR6geXOwPlAfBiO7tpEEDITqpCvEVABCUiar7TbB+Su818Xbu2aoUPneL9zUR9f7O+rLQbcP/RNpcZzuOYxhObSAw+J8rjvwOMpyLThmteV2fztTOAILO0XNJwyGJ9aBq9T1W2NiAvNJqwl+aN7z3sI2Ko2VXGkCKeq5Iu7PwxeTS3Ob8Jm8jIk2rSvYolsmnYrnSBGC96XRZLqiMqtBwcgFZt/tmVc1QuYb1HmScNM2lstmpgwD3/irLE2eoXrUKsLg8JcnD/5QoVKaMCbxR31J59Ga/ikSN+ay0bhmA5qo8wuOu4RM8qgfdK16KOYLiwELAIWMVHxj4X+iWprRQ4JW36z6Dui4MbCw7Am3NhsjZl5NYZZmM1tQTqhvhN6VlIXl6e3Y30TBHkZljGgkQKPURWybEhBv8cRH7tDdE2VjLFB33NMKsKWDxteRZO3hwKaxHRH7de71LhpMub+eL1YbZbv0Xcz7jY2SpIGe32zPTWSSkabCYOqQiHMtgNKkaVTJc2
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB9PR02MB6619.eurprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39850400004)(366004)(376002)(136003)(396003)(346002)(230922051799003)(64100799003)(1800799009)(451199024)(186009)(36756003)(31696002)(86362001)(31686004)(26005)(2616005)(53546011)(2906002)(82960400001)(6512007)(6506007)(83380400001)(71200400001)(6486002)(478600001)(122000001)(8936002)(8676002)(41300700001)(38100700002)(38070700005)(64756008)(66476007)(110136005)(76116006)(66446008)(316002)(91956017)(66946007)(66556008)(5660300002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MS9hR1E1YzkwUUd0VUVleG9Yc2Z5c1dmRUN2Yy83TEkwZDYvczh4OVd6QlNI?=
 =?utf-8?B?a0ZWU1llQ21ub1NlTEFYUEhHaUQ1S1pjWXJvb2gvQ1diTXowdnByTVJud21j?=
 =?utf-8?B?S1FLOFkvZXRTMHZiY2xSOXN0VzVFR3pQVUJSVk9sM0d0ZDVSZkJSelpLRWla?=
 =?utf-8?B?VWVIcStnK0hrSUF1Vjk0enF2U3BqclIvaUovRmRvMHdSTXd0ekJ0YzFsNG1J?=
 =?utf-8?B?MjVqdTA4dmhKcitIQ3FXZTZRWEl2MWtKM2FFeGRpcEgxM0d5cWdMam1STitX?=
 =?utf-8?B?cEFVRldwcmpLUXdpZ2wwTGJTVCtvRVVjbno2ZXMvdExJamR6UmpxY291Rks5?=
 =?utf-8?B?eERIWDA4dWtTZUJsWmRBVlBWc1hIWW1ad1BqM1JvL0ZYUjlaVjd4UFFkblJw?=
 =?utf-8?B?V1dDUXd3RS9FWjNiUEwvZWJnT05DY2V4WWY3RHc3WUQyNU02VUtVNFlYM0hu?=
 =?utf-8?B?bmQwQ04wNUIvMHI1dHBSNHlUZ3ZQS3l1Kzl0RmN5d2RSZWNicFhLMTR6b0ov?=
 =?utf-8?B?dHlSYXVYTzUrcHY3V1kyTCtVZWh2WUEyKzBWRHZicHNyOU12S3p4a0hMMlpE?=
 =?utf-8?B?UFNFbVd4Q1JYYmtQWVQ1RlJ1N2lvSWpyN2luSXJ4dEtaaVEzY2xCRWJNSGxI?=
 =?utf-8?B?QXFDcDNyejQxT3VrNzhHbjM0eUd3Rkt1aDRNQXhrdHJtekUwMW9ZWStFczFq?=
 =?utf-8?B?VnpaM080N1RFd3ptRkc5RVA1eGl1VkcyNWk3eEFsRWVZbTFpS0tFaVpMejMr?=
 =?utf-8?B?VmxWakZFWmM5YkFWelpkUW1iVkJaQ0Frb0VlK1d5VUpDWmxldEFlWVViUm04?=
 =?utf-8?B?c2g3WUFoejcxeFIzV0lQZ1p2dTI3TktUVC85YlY1TjhYRkhCZ0M0OXlxbU0w?=
 =?utf-8?B?M2JkdlRaSUZEcDJJcDNBb25PS0ppdTlKVEo1VkRpNElPejUxVERXK25KTWV3?=
 =?utf-8?B?d0ZjbWVJVW4wUm1yV0pIOVlOVHQ4bkI3Sy9ZdWR5S0VBdnY5U2hwbWUvTnFV?=
 =?utf-8?B?dXkwQlg2Z015Nnk2bzFpVnJMZE81enQ3OUE1SEllcWJLa1o5QzZiL0pDbi9K?=
 =?utf-8?B?S25rdXJhTDgxRmJSajMrSEdnSlNtV2NUaGtmTjVVOVZxbVRJOXVSa2NXU2F0?=
 =?utf-8?B?VkFzSU56V2FvYkdCbjAwWXdwSDlyeTNNMzZ2ZUc5OUFUVFFJVEtYTkJaWUJ2?=
 =?utf-8?B?MEpUNzB2K1dLU043TEJ0eEl6U0tiU3pYd0lMK2k5YS9iUHd4OWthblhIUEh2?=
 =?utf-8?B?Um1IcXQzanl3RzkyQVFiTlpOclNGY2h4VUFVUHlaS0VCUFJrZ09MTUVzMENX?=
 =?utf-8?B?RGp3U3RYbTZnUGVlb2F4cXFzRFdYZlBSSXEvaXhzTTNSOW1hKzJWM3YwYmEr?=
 =?utf-8?B?dEEyVzVDVkl6NXJNdTlEK2t5UWpvYXI1UHdMWENYb0I1eDE3Q3BzMFMxalIx?=
 =?utf-8?B?TVRvc3JrZm44elNFRE9keGRUaHVTSjFmZ1RCOCtKR21uS3JSTkVKa0R3Z1Zv?=
 =?utf-8?B?K0p1YzBZRGNjRHNOaUVDMjJYK2NLdWlRdzVHTHBEbkk0Y1FOMTd2Q3VwcXNS?=
 =?utf-8?B?UHo0NDcwSStTZktueDZocTd4b2xDWGVrbHAzdWdvK0VDc25NMERxOWdGYXdn?=
 =?utf-8?B?N1oydWZrdmp3TkZqMWg1VlBKaDd2OUpobVJ5NTJicW5zWk9aVjJyRUg4aUoy?=
 =?utf-8?B?R1pnL2g5N3RKNHcrOFlZTnVFWE5qK29yOXZDU0RLd1RBdkFnWXpGcDZBbkNv?=
 =?utf-8?B?SGxPUFBiUTdSdGlEZ1dmbGVkV0tLWXRBVWg3RWN5Zy9IeldtQkdEcVJjempo?=
 =?utf-8?B?eUE2T2xPRXNWZllQcTl5a3lKOUJpVUhxSWRicWY1bnY0M2N1MitQL2Ywempi?=
 =?utf-8?B?K2dBUzhxcFExUkhSZU1CeWZyTXdub21GMUJBbURoZlJFNkZkNTI5bUdoTisv?=
 =?utf-8?B?SlNvbFpZWWpLVXRMc2JYY3NWL0xiTmRvN0RMUDFQNm1uKzR2algxK01td29T?=
 =?utf-8?B?Wk03MjM1clo1bGlHbUJkQWN1bkpDSmh2cGlmUmt2TjR1b0RQUjN0TFh6Zml3?=
 =?utf-8?B?bkVzdnkzbHAxSW16dDgwc29pQ3ZpNnhJWXNtYk1MVjFQa3V0aGFNVkNtN1hh?=
 =?utf-8?Q?3Ztc=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <594E0DD7D80E344CB8A56826B4DC4C3E@eurprd02.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: LIG+kfVmvHXJZUik06KvcQIuQa0YLpxx2qlFpNQ3dTStcpOpTyeoyfdMRSeYUA7rHYxk9P+RAYtlfYg1lwIb8nIzbT/DpOLiRa0oeZ96NdtZ5FWtkxYCdAwwiCLKalZcdaqGPONXyEeTSOnpqWdb+sGEFqtZLqUtdo0FYjBJum20+NlodtU5rrm8Gwe/u3hMT0zbKrjSMe8QKw6IGkBNo4ADiLO5xZrQD2UOszL0TKgZOKBd/8wAi7cKh0fKdPNOTZUGOhlrL17kAkG85EstmWE0S1cXQ/lpI7Mn+tOyVyEFFGsB2nsLi5rb3R5mMh81eDtxBkw3Agj/QRd1BIJeMVBkV+9rRRF1sq6mgdxQRU18ONd5CAXkHt11pHJav0QkXXY1AwV2qC7AEJrKS3OP3DctyXOpo2Q/JKsVUAPMk7sPRX5dZu75PW0+1IGCIg774hy/+aVx9rKDII+rrm6UhoAsgvsxTgd0icp0Jm9HTRTC2rCyy1g/PuIOZhmVMYZs1/7fa5PbJYvztEjGqeNNSjV9Zi/CsTQkef6DdoqSdWD8v4JmSal3SXpB2Cn4IQbs+8lb50sgnZvCHF5PiPSrPhlKJoMauRNGUtNVNiS9OCHgckCyWIIthSJ27T8hgR+IrHPaIi1EQYA7UPlKCJ1wsHXXd4umPozdKBD5xGjwycLkfJpbVybDmjfOwN2oB35luFPPLkdMVBpGucqfW460Tasiea/nA/72C6pKVkhYQrpYP35Pgg/EOBNcGQ13k9gVgEcMiXTVzr/E6d9OFiLIakQDo8Q7zptW6QCSTo0JZzM=
X-OriginatorOrg: habana.ai
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB9PR02MB6619.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 42f4e68a-4905-4462-19a9-08dbc25b75da
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Oct 2023 08:50:27.7634 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d4d4539-213c-4ed8-a251-dc9766ba127a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gZUB96clDBudu1JtFSbcMYQ+0DqMMR2fsqBEKQB07HL6o6P3asnTmBZZGTh3OT+mPRiLlcLdQQyPxCwjCKtF+w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR02MB8770
X-MailControlDKIMCheck: cGFzcyBoYWJhbmEuYWkgW3Bhc3Nd
X-MailControl-OutInfo: MTY5NjE1MDI4NzpGUEtleTEucHJpdjqIN9E0LLdWp3NUPQ1DsO+1Jywt1tBcX4JZddPPfWPy3vENeg4CwXCKDe0h2Hf5J9NNytNkJdN7M0HTB5004sABhm8oik8gkcMGIgggZwqoAAEimKkRmBQSIkQ0oPGGyUFjs5kakJcWBewBWOOX5EXnEYFI9+xrPpO0kOLegSvWK/J3LrLiYAXGWNVnsNQwej4UK3d5jByz3AzXGs5ahzoIZHVFNaR8qTbnkflnWe7Mk2ZLY1/lUK/FRfAsKRg3wwJ+P+fukDTI8JGSc4zSWVzyP8HnsCgJqJkOThQgalLtCcBpZMDk6gIN1/AByboP+fzaohfCoxbKIzecR/FUQNPp
X-Scanned-By: MailControl 44278.2141 (www.mailcontrol.com) on 104.47.11.109
X-Mailcontrol-Refers-To: 3918pQqH023740
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=habana.ai;
 h=from:to:subject:date:message-id:references:in-reply-to:content-type:content-id:content-transfer-encoding:mime-version;
 s=fpkey81949-1; bh=gW1ozPXYMip0EId/QZJB8m2mrLoNEHnVRlBNwwq69c4=;
 b=Ig/5Okvr9c7HVb/teT02l0sDOOSeztJW8Cz0eLSds+VsWN82br7q5KFQWc8c6aIqeANYMezvkj7SgP0XeEfG852n2jxeq2Ow7e9Mcm05XAFoqjFncMyJsO8TpSpd+uqS6ysKAXeuhQ+Ez7Fo4X5R5NHL//tc00ot+6t4W331kPJLrttb8u+v1750hgk3ol2XDxdi4JP6edkdAK/zKgG2NGJRnphHD0+UEfXyX3OHbg4bbZn0bDheLljUdeLeZ7OOgNDaYWneQdEZiC1kRW0a1odh5z+lvSXcTzdkY7RP7IaHKNps8L5w+gJpYRR1vm+AFAmRcWOEEsF88cj9oySEQQ==
Subject: Re: [Intel-xe] [PATCH] drm/xe: implement driver initiated
 functional reset
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

T24gMjcvMDkvMjAyMyAxMDo0NiwgQW5kcnplaiBIYWpkYSB3cm90ZToNCj4gRHJpdmVyIGluaXRp
YXRlZCBmdW5jdGlvbmFsIHJlc2V0IChGTFIpIGlzIHRoZSBoaWdoZXN0IGxldmVsIG9mIHJlc2V0
DQo+IHRoYXQgd2UgY2FuIHRyaWdnZXIgZnJvbSB3aXRoaW4gdGhlIGRyaXZlci4gSW4gY29udHJh
c3QgdG8gUENJIEZMUiBpdA0KPiBkb2Vzbid0IHJlcXVpcmUgcmUtZW51bWVyYXRpb24gb2YgUENJ
IEJBUi4gSXQgY2FuIGJlIHVzZWZ1bCBpbiBjYXNlDQo+IEdUIGZhaWxzIHRvIHJlc2V0LiBJdCBp
cyBhbHNvIHRoZSBvbmx5IHdheSB0byB0cmlnZ2VyIEdTQyByZXNldCBmcm9tDQo+IHRoZSBkcml2
ZXIgYW5kIGNhbiBiZSB1c2VkIGluIGZ1dHVyZSBhZGRpdGlvbiBvZiBHU0Mgc3VwcG9ydC4NCj4g
DQo+IFNpZ25lZC1vZmYtYnk6IEFuZHJ6ZWogSGFqZGEgPGFuZHJ6ZWouaGFqZGFAaW50ZWwuY29t
Pg0KPiAtLS0NCj4gSGkgYWxsLA0KPiANCj4gVGhpcyBpcyBpbml0aWFsIGF0dGVtcHQgdG8gaW1w
bGVtZW50IERyaXZlci1GTFIgaW4geGUuIEltcGxlbWVudGF0aW9uDQo+IGlzIGNvcGllZCBmcm9t
IGk5MTUuIEkndmUgc2tpcHBlZCBjb21tZW50cywgYnV0IEkgY2FuIHJlLWFkZCB0aGVtIGlmDQo+
IHJlcXVlc3RlZC4NCj4gSW4gaTkxNSBEcml2ZXItRkxSIGlzIHBlcmZvcm1lZCBvbiBkcml2ZXIg
dW5sb2FkIGlmIEdTQyB3YXMgdXNlZC4NCj4gSW4geGUgR1NDIGlzIG5vdCB5ZXQgc3VwcG9ydGVk
LCBidXQgSSBoYXZlIGFkZGVkIHRyaWdnZXIgdG8gcGVyZm9ybSBGTFINCj4gaW4gY2FzZSBHVCBm
YWlscyB0byByZXNldCwgSSBndWVzcyB0aGlzIGNvdWxkIGJlIHByb3BlciB1c2UtY2FzZSBhbmQN
Cj4gb2YgY291cnNlIHRoaXMgaXMgcHJlcmVxdWlzaXRlIHRvIEdTQyBzdXBwb3J0Lg0KPiANCj4g
U2luY2UgdGhpcyBpcyBteSAxc3QgcGF0Y2ggdG8geGUgcGxlYXNlIGJlIG1lcmNpZnVsIGluIGNv
bW1lbnRzIDopDQo+IA0KPiBSZWdhcmRzDQo+IEFuZHJ6ZWoNCj4gLS0tDQo+ICAgZHJpdmVycy9n
cHUvZHJtL3hlL3JlZ3MveGVfZ3RfcmVncy5oIHwgIDYgKysrKysNCj4gICBkcml2ZXJzL2dwdS9k
cm0veGUveGVfZ3QuYyAgICAgICAgICAgfCAgMiArKw0KPiAgIGRyaXZlcnMvZ3B1L2RybS94ZS94
ZV9ndF90eXBlcy5oICAgICB8ICAzICsrKw0KPiAgIGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9tbWlv
LmMgICAgICAgICB8IDM4ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysNCj4gICA0IGZpbGVz
IGNoYW5nZWQsIDQ5IGluc2VydGlvbnMoKykNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0veGUvcmVncy94ZV9ndF9yZWdzLmggYi9kcml2ZXJzL2dwdS9kcm0veGUvcmVncy94ZV9n
dF9yZWdzLmgNCj4gaW5kZXggZTEzZmJiZGY2OTI5ZWEuLjc2OWE4ZmQwMDU5MzFhIDEwMDY0NA0K
PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUvcmVncy94ZV9ndF9yZWdzLmgNCj4gKysrIGIvZHJp
dmVycy9ncHUvZHJtL3hlL3JlZ3MveGVfZ3RfcmVncy5oDQo+IEBAIC0zNTksNiArMzU5LDEyIEBA
DQo+ICAgI2RlZmluZSBSQ1VfTU9ERQkJCQlYRV9SRUcoMHgxNDgwMCwgWEVfUkVHX09QVElPTl9N
QVNLRUQpDQo+ICAgI2RlZmluZSAgIFJDVV9NT0RFX0NDU19FTkFCTEUJCQlSRUdfQklUKDApDQo+
ICAgDQo+ICsjZGVmaW5lIEdVX0NOVEwJCQkJCVhFX1JFRygweDEwMTAxMCkNCj4gKyNkZWZpbmUg
ICBMTUVNX0lOSVQJCQkJUkVHX0JJVCg3KQ0KPiArI2RlZmluZSAgIERSSVZFUkZMUgkJCQlSRUdf
QklUKDMxKQ0KPiArI2RlZmluZSBHVV9ERUJVRwkJCQlYRV9SRUcoMHgxMDEwMTgpDQo+ICsjZGVm
aW5lICAgRFJJVkVSRkxSX1NUQVRVUwkJCVJFR19CSVQoMzEpDQo+ICsNCj4gICAjZGVmaW5lIEZP
UkNFV0FLRV9BQ0tfR1QJCQlYRV9SRUcoMHgxMzAwNDQpDQo+ICAgI2RlZmluZSAgIEZPUkNFV0FL
RV9LRVJORUwJCQlCSVQoMCkNCj4gICAjZGVmaW5lICAgRk9SQ0VXQUtFX1VTRVIJCQlCSVQoMSkN
Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndC5jIGIvZHJpdmVycy9ncHUv
ZHJtL3hlL3hlX2d0LmMNCj4gaW5kZXggMWFhNDRkNGY5YWMxYzguLjFlMGI3NjAwMGVkNDZiIDEw
MDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3QuYw0KPiArKysgYi9kcml2ZXJz
L2dwdS9kcm0veGUveGVfZ3QuYw0KPiBAQCAtNjA0LDYgKzYwNCw4IEBAIHN0YXRpYyBpbnQgZ3Rf
cmVzZXQoc3RydWN0IHhlX2d0ICpndCkNCj4gICAJeGVfdWV2ZW50X2d0X3Jlc2V0X2ZhaWx1cmUo
dG9fcGNpX2RldihndF90b194ZShndCktPmRybS5kZXYpLA0KPiAgIAkJCQkgICBndF90b190aWxl
KGd0KS0+aWQsIGd0LT5pbmZvLmlkKTsNCj4gICANCj4gKwlndC0+bmVlZHNfZmxyX29uX2Zpbmkg
PSB0cnVlOw0KPiArDQo+ICAgCXJldHVybiBlcnI7DQo+ICAgfQ0KDQpJIHRoaW5rIHRoaXMgc2hv
dWxkIGJlIHBsYXRmb3JtIGRlcGVuZGVudCBhbmQgbm90IHNldCB0byB0cnVlIGJ5IGRlZmF1bHQu
DQoNCj4gICANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndF90eXBlcy5o
IGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d0X3R5cGVzLmgNCj4gaW5kZXggZDQzMTBiZTNlMWU3
YzguLmRjMTk0ZTk2NTZhYmQ1IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUveGVf
Z3RfdHlwZXMuaA0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3RfdHlwZXMuaA0KPiBA
QCAtMzQ3LDYgKzM0Nyw5IEBAIHN0cnVjdCB4ZV9ndCB7DQo+ICAgCQkvKiogQG9vYjogYml0bWFw
IHdpdGggYWN0aXZlIE9PQiB3b3JrYXJvdWRucyAqLw0KPiAgIAkJdW5zaWduZWQgbG9uZyAqb29i
Ow0KPiAgIAl9IHdhX2FjdGl2ZTsNCj4gKw0KPiArCS8qKiBAbmVlZHNfZmxyX29uX2Zpbmk6IHJl
cXVlc3RzIGZ1bmN0aW9uYWwgcmVzZXQgb24gZmluaSAqLw0KPiArCWJvb2wgbmVlZHNfZmxyX29u
X2Zpbmk7DQo+ICAgfTsNCj4gICANCj4gICAjZW5kaWYNCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS94ZS94ZV9tbWlvLmMgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfbW1pby5jDQo+IGlu
ZGV4IDNjY2MwYWY0NDMwYmU0Li41OTNlY2M5OGNkZmU4YSAxMDA2NDQNCj4gLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL3hlL3hlX21taW8uYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfbW1p
by5jDQo+IEBAIC00LDYgKzQsNyBAQA0KPiAgICAqLw0KPiAgIA0KPiAgICNpbmNsdWRlIDxsaW51
eC9taW5tYXguaD4NCj4gKyNpbmNsdWRlIDxsaW51eC91bml0cy5oPg0KPiAgIA0KPiAgICNpbmNs
dWRlICJ4ZV9tbWlvLmgiDQo+ICAgDQo+IEBAIC0zNjQsOSArMzY1LDQ2IEBAIHN0YXRpYyB2b2lk
IHhlX21taW9fcHJvYmVfdGlsZXMoc3RydWN0IHhlX2RldmljZSAqeGUpDQo+ICAgCX0NCj4gICB9
DQo+ICAgDQo+ICtzdGF0aWMgdm9pZCBkcml2ZXJfaW5pdGlhdGVkX2ZscihzdHJ1Y3QgeGVfZ3Qg
Kmd0KQ0KPiArew0KPiArCWNvbnN0IHVuc2lnbmVkIGludCBmbHJfdGltZW91dCA9IDMgKiBNSUNS
TzsgLyogc3BlY3MgcmVjb21tZW5kIGEgM3Mgd2FpdCAqLw0KPiArCXN0cnVjdCB4ZV9kZXZpY2Ug
KnhlID0gZ3QtPnRpbGUtPnhlOw0KPiArCWludCByZXQ7DQo+ICsNCj4gKwlkcm1fZGJnKCZ4ZS0+
ZHJtLCAiVHJpZ2dlcmluZyBEcml2ZXItRkxSXG4iKTsNCj4gKw0KPiArCXJldCA9IHhlX21taW9f
d2FpdDMyKGd0LCBHVV9DTlRMLCBEUklWRVJGTFIsIDAsIGZscl90aW1lb3V0LCBOVUxMLCBmYWxz
ZSk7DQo+ICsJaWYgKHJldCkgew0KPiArCQlkcm1fZXJyKCZ4ZS0+ZHJtLCAiRHJpdmVyLUZMUi1w
cmVwYXJlIHdhaXQgZm9yIHJlYWR5IGZhaWxlZCEgJWRcbiIsIHJldCk7DQo+ICsJCXJldHVybjsN
Cj4gKwl9DQo+ICsJeGVfbW1pb193cml0ZTMyKGd0LCBHVV9ERUJVRywgRFJJVkVSRkxSX1NUQVRV
Uyk7DQo+ICsJeGVfbW1pb19ybXczMihndCwgR1VfQ05UTCwgMCwgRFJJVkVSRkxSKTsNCj4gKwly
ZXQgPSB4ZV9tbWlvX3dhaXQzMihndCwgR1VfQ05UTCwgRFJJVkVSRkxSLCAwLCBmbHJfdGltZW91
dCwgTlVMTCwgZmFsc2UpOw0KPiArCWlmIChyZXQpIHsNCj4gKwkJZHJtX2VycigmeGUtPmRybSwg
IkRyaXZlci1GTFItdGVhcmRvd24gd2FpdCBjb21wbGV0aW9uIGZhaWxlZCEgJWRcbiIsIHJldCk7
DQo+ICsJCXJldHVybjsNCj4gKwl9DQo+ICsJcmV0ID0geGVfbW1pb193YWl0MzIoZ3QsIEdVX0RF
QlVHLCBEUklWRVJGTFJfU1RBVFVTLCBEUklWRVJGTFJfU1RBVFVTLA0KPiArCQkJICAgICBmbHJf
dGltZW91dCwgTlVMTCwgZmFsc2UpOw0KPiArCWlmIChyZXQpIHsNCj4gKwkJZHJtX2VycigmeGUt
PmRybSwgIkRyaXZlci1GTFItcmVpbml0IHdhaXQgY29tcGxldGlvbiBmYWlsZWQhICVkXG4iLCBy
ZXQpOw0KPiArCQlyZXR1cm47DQo+ICsJfQ0KPiArDQo+ICsJLyogQ2xlYXIgc3RpY2t5IGNvbXBs
ZXRpb24gc3RhdHVzICovDQo+ICsJeGVfbW1pb193cml0ZTMyKGd0LCBHVV9ERUJVRywgRFJJVkVS
RkxSX1NUQVRVUyk7DQo+ICt9DQo+ICsNCj4gICBzdGF0aWMgdm9pZCBtbWlvX2Zpbmkoc3RydWN0
IGRybV9kZXZpY2UgKmRybSwgdm9pZCAqYXJnKQ0KPiAgIHsNCj4gICAJc3RydWN0IHhlX2Rldmlj
ZSAqeGUgPSBhcmc7DQo+ICsJc3RydWN0IHhlX2d0ICpndDsNCj4gKwl1OCBpZDsNCj4gKw0KPiAr
CWZvcl9lYWNoX2d0KGd0LCB4ZSwgaWQpDQo+ICsJCWlmIChndC0+bmVlZHNfZmxyX29uX2Zpbmkp
DQo+ICsJCQlkcml2ZXJfaW5pdGlhdGVkX2ZscihndCk7DQo+ICAgDQo+ICAgCXBjaV9pb3VubWFw
KHRvX3BjaV9kZXYoeGUtPmRybS5kZXYpLCB4ZS0+bW1pby5yZWdzKTsNCj4gICAJaWYgKHhlLT5t
ZW0udnJhbS5tYXBwaW5nKQ0KDQpOb3Qgc3VyZSBtbWlvX2ZpbmkgaXMgdGhlIGJlc3QgcGxhY2Ug
dG8gcHV0IHRoaXMsIGFzIHRoaXMgaXMgbm90IG1taW8gDQpyZWxhdGVkLg0KDQotLQ0KT2Zpcg0K
DQoNCg==
