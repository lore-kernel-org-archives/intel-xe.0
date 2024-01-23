Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DC21C47258
	for <intel-xe@archiver.kernel.org>; Tue, 23 Jan 2024 07:01:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A013510E140;
	Tue, 23 Jan 2024 07:01:50 +0000 (UTC)
Received: from cluster-b.mailcontrol.com (cluster-b.mailcontrol.com
 [85.115.56.190])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC04610E140
 for <intel-xe@lists.freedesktop.org>; Tue, 23 Jan 2024 07:01:38 +0000 (UTC)
Received: (from mailcontrol@localhost)
 by rly32b.srv.mailcontrol.com (MailControl) with ESMTP id 40N71ZJa323355
 for intel-xe@lists.freedesktop.org; Tue, 23 Jan 2024 07:01:35 GMT
Received: from rly32b.srv.mailcontrol.com (localhost [127.0.0.1])
 by localhost (envelope-sender dliberman@habana.ai) (MIMEDefang) with ESMTP id
 40N71Y2L323082 (TLS bits=256 verify=OK)
 for intel-xe@lists.freedesktop.org; Tue, 23 Jan 2024 07:01:35 +0000 (GMT)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
 by rly32b.srv.mailcontrol.com (MailControl) id 40N717mR314465
 for intel-xe@lists.freedesktop.org; Tue, 23 Jan 2024 07:01:07 GMT
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2051.outbound.protection.outlook.com [104.47.12.51])
 by rly32b-eth0.srv.mailcontrol.com (envelope-sender dliberman@habana.ai)
 (MIMEDefang) with ESMTP id 40N70vWP313010 (TLS bits=256 verify=OK)
 for intel-xe@lists.freedesktop.org; Tue, 23 Jan 2024 07:01:07 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BkvKsRNpPjK81kgIcgx3grSRhwb3ueKWoh6BK5aY3agpPGexg6T0iGJRo5jdJFK7/eFhABMiUwRtwJMEnUv04+qppTm7aGVhpqaWUszCzZUO6mKp2DB41LIbamfZecKD4vm4Fxi1ehSJK2F4/e1aedr1VFLvx5ijnBOJ1Q1VHSJdUQ33Pg109MZ04lw34DRX6teefTze9UCg5YK/zTY8VJP/lB29xGz2CqrbFRIZQj9wiuTnJ15G9k3b7DmBDax0tRd8N0Q/nhhBc302DCzRF991e3S/rJVZ5Js1Gk3AwfcCCkLVy8KlFXaWVqXFroio0zVam5TSKkXd4fzqb2QC/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e1QLuPirB4GGI3OzbsfYN038ZUwV6FtmsblqdpvYmdA=;
 b=XjdzHIvsCTqKXwPQyzh4UFCmIksFa5vfRIDMT7keeqNASbmSHNLHuKSFMipaMwp77DFgmykt3g7KKxzp/HzLfeHxnI2HfGMt+FC8GESCXJ0GvUq+fnyFg8mS9SWwxien3oSra6dXZlI/zrYyH6lPzpSkpbEmAnayzQeZzYWbMAmUTwt16lABGXZGoRKfYnFEuTGUqInPgqtd61hKMu+44NQz4rhnEyYwd4Ooa8IVhg6GiN+SIhwsM831Bd9vb2DxZVahH3EzyPLK3nytF0V8J8qeCFt26c4EJexWCrFTWANkVIII4lzHP1Mz4O39KwFLIXwKkzPXyCNqrx1hNELRzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=habana.ai; dmarc=pass action=none header.from=habana.ai;
 dkim=pass header.d=habana.ai; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=habana.ai; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e1QLuPirB4GGI3OzbsfYN038ZUwV6FtmsblqdpvYmdA=;
 b=V8NUU3lUcq/nTpw/LlGGhrkGt5QHKwSja/X4lS7hMJZ3cI2zLRbgaCZd31JwgyqLul49TTCcuoozBOSoP2duYKjqcuCRD0EURoHPu0iAhpP2pgHnvwth8+CB7GZHdEDyJPtOpnXJyYcjriX63asORw/okHQG90XEydmY8TrKTHqYrfnG0kP8zFO7SB2eLHZENZVsRjLnhnwTyfP9k9PaMLPH8NCenjSR6KpXrfsFKpQfRlLjvbw9dfNnrYFM0LW1sRN1B95Y7sBsnjOebhzEz1XFnnD97Q6zcrRjZlugxsu+5N81TxXnQP6yg5MNMN8K/fSB1DqpuHIOyr5c1wsJBg==
Received: from DB9PR02MB9946.eurprd02.prod.outlook.com (2603:10a6:10:461::11)
 by PRAPR02MB7858.eurprd02.prod.outlook.com (2603:10a6:102:27b::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.32; Tue, 23 Jan
 2024 07:00:52 +0000
Received: from DB9PR02MB9946.eurprd02.prod.outlook.com
 ([fe80::d9fc:5d73:317b:eac1]) by DB9PR02MB9946.eurprd02.prod.outlook.com
 ([fe80::d9fc:5d73:317b:eac1%6]) with mapi id 15.20.7202.035; Tue, 23 Jan 2024
 07:00:52 +0000
From: Dani Liberman <dliberman@habana.ai>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v2] drm/xe/irq: allocate all possible msix interrupts
Thread-Topic: [PATCH v2] drm/xe/irq: allocate all possible msix interrupts
Thread-Index: AQHaTEiV4tmJHXljTEmlQFZikJM1H7DlrUKAgAFN+YA=
Date: Tue, 23 Jan 2024 07:00:51 +0000
Message-ID: <735e26ac-b5ba-4d52-91ed-b47ba6d34af5@habana.ai>
References: <20240121090214.2072923-1-dliberman@habana.ai>
 <f20cbdaa-61d7-4174-92ed-c677ba792a73@intel.com>
In-Reply-To: <f20cbdaa-61d7-4174-92ed-c677ba792a73@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=habana.ai;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB9PR02MB9946:EE_|PRAPR02MB7858:EE_
x-ms-office365-filtering-correlation-id: 0a2b90c4-b487-4403-2c01-08dc1be1097e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: VcXe+5+h9UiPwikH3OFPaV5aWDQY3+BZtqN/XbIdVV39KlYYSxkctZ7p74n7uvOnJ3jJ67Rn/8amrlh/n+YFa1LxzjAogzk75+qW4nRVP7pNIFdvdv6b+nFIUWzdRw5coR/vpyUzREaRnxlBAxVoYEqBh0RVEp1ZKijeSejZHTOC0cXxqmvRb9fZgagAu7aS+NhTjRfGpSfsK6cFzrlUOS00KN8L0FHDGNP261XQfaHMZKhN1pLP5IRSdfEcNjcm3S0ifQcU+xSGwEdEtjwincCUWxtzXTtAgNEmGIAUzzZRfYeiH4uwWzibDv0W4TBDxBH/tJyVAzw4ncoWmM2coZuuga8cuNnqJrI84mJiimJlultiPnHO+V+zeooYrqhwk2OlX+jUTNIBkb3tF9FOADMF+RNFJ990xhc0FoG3g5sKk6xqLcmFGfFBNWp5f0T2AnPp399APKU5MPFpOWvgzhQxmhbBVEwJYdA3ZvHZmKQEruk9Qyin6cgCOnrLM9cmXASgSUi26kgYVADnOi3NVzAVM1iU4tnsSuAXQAd2FUIs276WRYPjUuAjYyzzw+eJx4aznVpCu+9Fi2wu6Ju8BO7kmohSEplgvul7CixeiMaGQehUrUg6U5KXKXxc5Affvpl8QAstVS+aLO73IgFLsw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB9PR02MB9946.eurprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(396003)(346002)(376002)(136003)(39850400004)(230922051799003)(1800799012)(186009)(451199024)(64100799003)(2616005)(2906002)(8676002)(8936002)(66446008)(76116006)(86362001)(91956017)(31696002)(6486002)(66476007)(64756008)(5660300002)(316002)(66946007)(66556008)(38070700009)(36756003)(478600001)(82960400001)(6512007)(6916009)(122000001)(38100700002)(53546011)(6506007)(83380400001)(71200400001)(41300700001)(26005)(31686004)(45980500001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VU9hdXp0M1RVbS8zRmVBMk5ZUURpQVZYSGVtMzVpcHlLOTV4YXRBeFBrcWdn?=
 =?utf-8?B?bGZQR29XeHFuRFBiR01tSWQ3cVdBTHByd2NsU3VmUkgzd1dnUEk4Q29LcnlR?=
 =?utf-8?B?MnpWdjM3bXo5YUdha0NBcS9XRGFIcmM0bGw4L2pId0pDVno5M3RhcHg3dFZC?=
 =?utf-8?B?VG40c0o3YnFYQzE0YjZhM0JiWkVhYkJ5SXFUK3VCaVF3ZWwzaGt6ZmM5UFJ6?=
 =?utf-8?B?RFNZSlJ6Tk9YZnJIZmV2aTczTENzNXpIVWIxMldGMjRFWldlc3FBSkFtSzhS?=
 =?utf-8?B?VFYyME1FS1FHUWIzNGhFYlpRanVPUXN2b1RUVmEyNW1IaG9xTW1yS0k2d3pj?=
 =?utf-8?B?cFNWc0tsK0ppdVo3Q3FzaDdoS29BSExLRUhvOEdjMitQYzVzSTMvZmxSSGk0?=
 =?utf-8?B?SUtzSWxWNWxpeXdTU0lVWjhKcE5IWDlMeFYrZXpHaWkyaUptOUt6c0c5V0ZQ?=
 =?utf-8?B?RmsyS2wxY2drVlVSOTlLTTl3Y2l1WjYvMlZwQ3U5dzJBNHJQR1o2ZlNXZVpJ?=
 =?utf-8?B?NFlDQXgwNTNWcjJodDJQam0ySXZhdG44V21WRHRSd3RVRHladG9iTlJvMWky?=
 =?utf-8?B?aEd3Uis5OE91MS9XMUNFUFc4Zk1FVkVWSzRuNWhtWDVMNWJkV01waGVESXJP?=
 =?utf-8?B?aXpJaVJBcGZIeGF5U1gzT1hyMTlKTWxmb3ByNjY3ejZHTWxKMmNIclNld3dk?=
 =?utf-8?B?VVBzSmNMLzNPeFlGUXBoUXNwU244TUlRUDVLbGV3c0hWTVppcSsxcFR4UXpx?=
 =?utf-8?B?dFRjdVVMWUpPMS8rQUFoUDZKaDg5KzAwKy93Y0hxK2NDbG5xcFRNVmdvaFpj?=
 =?utf-8?B?VTV1OURVSis5Q0hoZEZZbkp4eVBjRDFjWDRZOWlaQ0FMbzdGMkVmTkxxem1H?=
 =?utf-8?B?bEdoQmR5eWtQM1J3R1h6M0UxbmhuWUY5M3VFejBlMGJFTGF1OUt5U0tjK2Qw?=
 =?utf-8?B?YUdxaFBHZ3dXMU5GK2FIWGVXRXlvSXJmcXZPWFFURitjTDd1S01kcjV4bkdJ?=
 =?utf-8?B?bExrdkRMSGdsb2NQTURyWE5kaFNiSWFmc0JMWXc5NFhwMi9TRHM4TDRBZ2tJ?=
 =?utf-8?B?dEovWnRISkJQR3pqdnlQdzhORmxTSXo4QVAvY0VKU1pxMnV0YWY3M2pudlFm?=
 =?utf-8?B?eU5vRi8zUXJiTkY1QmJkZUdha3ZKUmovY0twUU9XcG95Nk1CckFzT2FDM0Ns?=
 =?utf-8?B?MVdVNWNDS1RmVU1WcWFybkRKUS81U1N1SkZpWFI3MXBaU21ZUUZjMTVVREVK?=
 =?utf-8?B?dGpDcTQxM2lpNEgvOHhyZ3BBdU55L1R6VS9YcFRSUlpDT21SejJheVptNnMw?=
 =?utf-8?B?T0d3ajc1QzgwRnVobm1Hczg4MW5NYUpqckU0KzBUY0lqNHNtRGtIM2JQd3lu?=
 =?utf-8?B?SVVqVFMvY3JqL1dxZm5ycVFFZDdMTlkvK0JVRGo3cWhlZm4xR3Nnb1F2YWVi?=
 =?utf-8?B?QUpkNFNYUmdaT3VtVUhTbTR5L0tYSkhSUzlDRitTVldzc1VZamozR3doVnIz?=
 =?utf-8?B?eE5IQTcwVnZrclVXb3VDSmJDak5ySmVvRTZTL1NKVDhXRE16WXp2elNaZUVv?=
 =?utf-8?B?Y1lHSHBvV1puN25CWDVmRVNINDZYVFRFYThIaDdIdlVJYmpCRG1pOHRwK3JC?=
 =?utf-8?B?ajNKWEw2MlR6UVRoU0JZaGp0Y29uQnc2RzV6R0R0bU1VMGwwY1BJRUFIV0tV?=
 =?utf-8?B?RUNuTDdrRWJwNHZCWXdmeUo0RlFhNzNrVVl0bDFWQTRUOHZVcjJVYWxyK3Bz?=
 =?utf-8?B?QTF0ZUZic3BYYkorOUJORld5Z1l1bXB5SVVJenh3YjkwRXUvSTZuSjI1d3ZP?=
 =?utf-8?B?eFUvTlUyZ01kY0hnSSt4WlAwaUM1M0ttZXpzOHJUaHZ3UG1rd3pPdXZGb2FD?=
 =?utf-8?B?SFZMYmtxU0E4aTZjRmN1T0l0OXJ4aFJienJ6alJ4YWZVUUMvR0dqWFVoVlpO?=
 =?utf-8?B?QWQxUG5mRVRiUmdCa0NKblRjMkRybGlJZ2RwUU95SS9BakpiTmZSdWJZMmRU?=
 =?utf-8?B?VUVhVW9jQ09qc0R3RGdnQjhYWHRveU9PblA5djd4bXFsZUJ6VEI2SjhudTJ3?=
 =?utf-8?B?K0s2MmJkWEx2bSt4bldPZDVMTUhiYnAxVGdYUXBHZjNqRlp3WnpPWUQrVTBP?=
 =?utf-8?Q?LC7p8QbW+aUvaF7QdJ8ZqShSS?=
Content-Type: multipart/alternative;
 boundary="_000_735e26acb5ba4d5291edb47ba6d34af5habanaai_"
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: DoHm1SwcdEMDpaN6GfrH7wMMgnWbMxFPkb3sFsFCn6qZszUz8QYp3J/ZTEaqdlNky6xvUxqCl4HqlCSTyiQG2bJMdeuOi3I01xMqCgjrJu/UGf/C7Pwo7GDo6UBCvK0VocxvW8QM1SLB70mIAGmfW3zyz6PDHdJKa8eOX9MvJVyOTvP2EwBhnRY5ehtKZE69YzJZEq6Eh4Ybj/JrRucz/72aZgt/xpfJ5i6oaBbXRImbJsTiMFusVvB6JrXtVqQJb15nkYVoznAqYAmFVt/ZhOP/IimsfWsIl5InTf4qApNLIxtXD/G4UEcoeFKPL4qya7c//hiEQZe1ffSQRhQR5k4WyCWEJNTOuqeWB8ZHV+7ihqoMXr32k3CchtjSSBbKlAmHBIv5I7g2Kbd+XBDSFwWFyPkTSPf5e6tDEn2G5esvuHBkOEkUA6EcAPkyWja6Gg4tBOWvcQcbApwSC6LF1eUkudEhzN7PlJXLDYhIKf5cIcP3KRj/hWbCa3oDIZy6rE5hDqfelLTdjFV+9cBS3jX3vr6sDj2xIz73c8YTm3XmRKHktFrihVJISIJIixysjDP3Bgp6r/66HeamH8RA8FwJ/9KX8WrzcUXSzFVV0fBxCe3cDddjIX55++IrUf/D
X-OriginatorOrg: habana.ai
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB9PR02MB9946.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a2b90c4-b487-4403-2c01-08dc1be1097e
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jan 2024 07:00:52.0298 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d4d4539-213c-4ed8-a251-dc9766ba127a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KOZF5QIFrh5spYLUaYpeDAxlf3Udm3A6PhPGnqzTN/DWM892WUw8sRlegafjEyMqRrkOsEu6UVR4wVDdmPl7jA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PRAPR02MB7858
X-MailControlDKIMCheck: cGFzcyBoYWJhbmEuYWkgW3Bhc3Nd
X-MailControl-OutInfo: MTcwNTk5MzI5NDpGUEtleTEucHJpdjp/UGjfGDUzbhHHH9rMF0Yx4z3WHRCNko2rhJX4pR+KMegdAGmORJKK/cQSLcxhg5CXNdqT20Eg/sw45VQq741uDZN+eKGAwpYDPCgN4E3MnmNIGIUXWJxBQKhirGtXmkTieaEg2uyEAVILPfqOMldxOE5aKRO0DYeOZunZXTbdS2ZqK5g2IU25HkaCK6AiJnvmmpJeyDv4S5+T+Bj54kDv0e0iInyCBdpVnbpMp8lkOV1yq9HHRuHl8/9O/Kl4sVCmOI9N2+sCQsL7qt+KVj3KbwNFCIId7eKmlCUHR3vB/Qe9ApWiHSHbtvDTzpYAmgNUOxQx1cTNof155oqzqaip
X-Scanned-By: MailControl 44278.2143 (www.mailcontrol.com) on 104.47.12.51
X-Mailcontrol-Refers-To: 40N71Y2L323082
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=habana.ai;
 h=from:to:subject:date:message-id:references:in-reply-to:content-type:mime-version;
 s=fpkey81949-2; bh=e1QLuPirB4GGI3OzbsfYN038ZUwV6FtmsblqdpvYmdA=;
 b=stnNr4PI0d2HNTpi5/S0J00rDl0WUY3n0NaQCMKcIKEN9UtqLoN/RsK5NUb0M9wnoDfc32xmGabMPjKfX9S1HJrwAFDOAt799AfXXamvqaaaLk8JPChho91uVekAxKqcBUBFsk7YNGtbknd7Ep9kw36wc9T4joGlZN/PZvtoithvGT9jV0CB2mN6TvgHa6x5cQeZs2D8CV/SYKCzRIiHO+ShA5xlzsT+bcfpcpPROtun1WECQ9qLG8uVYfpWQB4zA9E/jakySzdezbj188NEwwSgOGbELAJgotJxhqx0eB1M7D0VAO4Qsqc+cXeJipO/NlPxlxJTrpg8Q0scA8V+Zw==
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

--_000_735e26acb5ba4d5291edb47ba6d34af5habanaai_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

T24gMjIvMDEvMjAyNCAxMzowNSwgR2hpbWlyYXksIEhpbWFsIFByYXNhZCB3cm90ZToNCg0KDQpP
biAyMS0wMS0yMDI0IDE0OjMyLCBEYW5pIExpYmVybWFuIHdyb3RlOg0KDQpJZiBwbGF0Zm9ybSBz
dXBwb3J0cyBNU0lYLCBkcml2ZXIgbmVlZHMgdG8gYWxsb2NhdGUgYWxsIHBvc3NpYmxlDQppbnRl
cnJ1cHRzLg0KDQp2MjoNCiAgLSBkcm9wIG1zaXhfY2FwIGFuZCB1c2UgdGhlIGFwaSByZXR1cm4g
Y29kZSBpbnN0ZWFkLg0KICAtIGZpeCBjb21taXQgbWVzc2FnZS4NCg0KQ2M6IE9oYWQgU2hhcmFi
aSA8b3NoYXJhYmlAaGFiYW5hLmFpPjxtYWlsdG86b3NoYXJhYmlAaGFiYW5hLmFpPg0KQ2M6IEx1
Y2FzIERlIE1hcmNoaSA8bHVjYXMuZGVtYXJjaGlAaW50ZWwuY29tPjxtYWlsdG86bHVjYXMuZGVt
YXJjaGlAaW50ZWwuY29tPg0KU2lnbmVkLW9mZi1ieTogRGFuaSBMaWJlcm1hbiA8ZGxpYmVybWFu
QGhhYmFuYS5haT48bWFpbHRvOmRsaWJlcm1hbkBoYWJhbmEuYWk+DQotLS0NCiBkcml2ZXJzL2dw
dS9kcm0veGUveGVfaXJxLmMgfCAxNSArKysrKysrKysrKysrLS0NCiAxIGZpbGUgY2hhbmdlZCwg
MTMgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkNCg0KZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS94ZS94ZV9pcnEuYyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9pcnEuYw0KaW5kZXgg
OTA3YzhmZjBmYTIxLi43YTIzZDI1YzEwNjIgMTAwNjQ0DQotLS0gYS9kcml2ZXJzL2dwdS9kcm0v
eGUveGVfaXJxLmMNCisrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9pcnEuYw0KQEAgLTY2Miw3
ICs2NjIsNyBAQCBpbnQgeGVfaXJxX2luc3RhbGwoc3RydWN0IHhlX2RldmljZSAqeGUpDQogew0K
ICAgICAgICBzdHJ1Y3QgcGNpX2RldiAqcGRldiA9IHRvX3BjaV9kZXYoeGUtPmRybS5kZXYpOw0K
ICAgICAgICBpcnFfaGFuZGxlcl90IGlycV9oYW5kbGVyOw0KLSAgICAgICBpbnQgZXJyLCBpcnE7
DQorICAgICAgIGludCBlcnIsIGlycSwgbnZlYzsNCg0KICAgICAgICBpcnFfaGFuZGxlciA9IHhl
X2lycV9oYW5kbGVyKHhlKTsNCiAgICAgICAgaWYgKCFpcnFfaGFuZGxlcikgew0KQEAgLTY3Miw3
ICs2NzIsMTggQEAgaW50IHhlX2lycV9pbnN0YWxsKHN0cnVjdCB4ZV9kZXZpY2UgKnhlKQ0KDQog
ICAgICAgIHhlX2lycV9yZXNldCh4ZSk7DQoNCi0gICAgICAgZXJyID0gcGNpX2FsbG9jX2lycV92
ZWN0b3JzKHBkZXYsIDEsIDEsIFBDSV9JUlFfTVNJIHwgUENJX0lSUV9NU0lYKTsNCisgICAgICAg
bnZlYyA9IHBjaV9tc2l4X3ZlY19jb3VudChwZGV2KTsNCisgICAgICAgaWYgKG52ZWMgPD0gMCkg
ew0KKyAgICAgICAgICAgICAgIGlmIChudmVjID09IC1FSU5WQUwpIHsNCisgICAgICAgICAgICAg
ICAgICAgICAgIC8qIE1TSVggY2FwYWJpbGl0eSBpcyBub3Qgc3VwcG9ydGVkIGluIHRoZSBkZXZp
Y2UsIHVzaW5nIE1TSSAqLw0KKyAgICAgICAgICAgICAgICAgICAgICAgbnZlYyA9IDE7DQorICAg
ICAgICAgICAgICAgfSBlbHNlIHsNCisgICAgICAgICAgICAgICAgICAgICAgIGRybV9lcnIoJnhl
LT5kcm0sICJNU0lYOiBGYWlsZWQgZ2V0dGluZyBjb3VudFxuIik7DQorICAgICAgICAgICAgICAg
ICAgICAgICByZXR1cm4gbnZlYzsNCisgICAgICAgICAgICAgICB9DQorICAgICAgIH0NCisNCisg
ICAgICAgZXJyID0gcGNpX2FsbG9jX2lycV92ZWN0b3JzKHBkZXYsIG52ZWMsIG52ZWMsIFBDSV9J
UlFfTVNJIHwgUENJX0lSUV9NU0lYKTsNCg0KU2hvdWxkbid0IHRoZSBwYXJhbWV0ZXIgYmUgb25s
eSBQQ0lfSVJRX01TSSBpbiBjYXNlIG52ZWMgPT0gRUlOVkFMICA/DQpUaGUgYXBpIHdpbGwgdHJ5
IG1zaXggd2l0aCBtc2kgZmFsbGJhY2ssIHNvIGl0IHdpbGwgd29yay4NCkJ1dCBzaW5jZSBJIGRp
c3Rpbmd1aXNoIGFscmVhZHkgYmV0d2VlbiBtc2l4IGFuZCBtc2kgdG8gZ2V0IG52ZWMsIEkgd2ls
bCBkbyB0aGUgc2FtZSBmb3IgaXJxIGZsYWdzLg0KDQogICAgICAgIGlmIChlcnIgPCAwKSB7DQog
ICAgICAgICAgICAgICAgZHJtX2VycigmeGUtPmRybSwgIk1TSS9NU0lYOiBGYWlsZWQgdG8gZW5h
YmxlIHN1cHBvcnQgJWRcbiIsIGVycik7DQogICAgICAgICAgICAgICAgcmV0dXJuIGVycjsNCg0K
DQo=

--_000_735e26acb5ba4d5291edb47ba6d34af5habanaai_
Content-Type: text/html; charset="utf-8"
Content-ID: <C57F92BE255DE34791EE42BE7E8D6D6A@eurprd02.prod.outlook.com>
Content-Transfer-Encoding: base64

PCFET0NUWVBFIGh0bWw+DQo8aHRtbD4NCjxoZWFkPg0KPG1ldGEgaHR0cC1lcXVpdj0iQ29udGVu
dC1UeXBlIiBjb250ZW50PSJ0ZXh0L2h0bWw7IGNoYXJzZXQ9dXRmLTgiPg0KPC9oZWFkPg0KPGJv
ZHk+DQo8ZGl2IGNsYXNzPSJtb3otY2l0ZS1wcmVmaXgiPk9uIDIyLzAxLzIwMjQgMTM6MDUsIEdo
aW1pcmF5LCBIaW1hbCBQcmFzYWQgd3JvdGU6PGJyPg0KPC9kaXY+DQo8YmxvY2txdW90ZSB0eXBl
PSJjaXRlIiBjaXRlPSJtaWQ6ZjIwY2JkYWEtNjFkNy00MTc0LTkyZWQtYzY3N2JhNzkyYTczQGlu
dGVsLmNvbSI+DQo8cD48YnI+DQo8L3A+DQo8ZGl2IGNsYXNzPSJtb3otY2l0ZS1wcmVmaXgiPk9u
IDIxLTAxLTIwMjQgMTQ6MzIsIERhbmkgTGliZXJtYW4gd3JvdGU6PGJyPg0KPC9kaXY+DQo8Ymxv
Y2txdW90ZSB0eXBlPSJjaXRlIiBjaXRlPSJtaWQ6MjAyNDAxMjEwOTAyMTQuMjA3MjkyMy0xLWRs
aWJlcm1hbkBoYWJhbmEuYWkiPg0KPHByZSBjbGFzcz0ibW96LXF1b3RlLXByZSIgd3JhcD0iIj5J
ZiBwbGF0Zm9ybSBzdXBwb3J0cyBNU0lYLCBkcml2ZXIgbmVlZHMgdG8gYWxsb2NhdGUgYWxsIHBv
c3NpYmxlDQppbnRlcnJ1cHRzLg0KDQp2MjoNCiAgLSBkcm9wIG1zaXhfY2FwIGFuZCB1c2UgdGhl
IGFwaSByZXR1cm4gY29kZSBpbnN0ZWFkLg0KICAtIGZpeCBjb21taXQgbWVzc2FnZS4NCg0KQ2M6
IE9oYWQgU2hhcmFiaSA8YSBjbGFzcz0ibW96LXR4dC1saW5rLXJmYzIzOTZFIiBocmVmPSJtYWls
dG86b3NoYXJhYmlAaGFiYW5hLmFpIiBtb3otZG8tbm90LXNlbmQ9InRydWUiPiZsdDtvc2hhcmFi
aUBoYWJhbmEuYWkmZ3Q7PC9hPg0KQ2M6IEx1Y2FzIERlIE1hcmNoaSA8YSBjbGFzcz0ibW96LXR4
dC1saW5rLXJmYzIzOTZFIiBocmVmPSJtYWlsdG86bHVjYXMuZGVtYXJjaGlAaW50ZWwuY29tIiBt
b3otZG8tbm90LXNlbmQ9InRydWUiPiZsdDtsdWNhcy5kZW1hcmNoaUBpbnRlbC5jb20mZ3Q7PC9h
Pg0KU2lnbmVkLW9mZi1ieTogRGFuaSBMaWJlcm1hbiA8YSBjbGFzcz0ibW96LXR4dC1saW5rLXJm
YzIzOTZFIiBocmVmPSJtYWlsdG86ZGxpYmVybWFuQGhhYmFuYS5haSIgbW96LWRvLW5vdC1zZW5k
PSJ0cnVlIj4mbHQ7ZGxpYmVybWFuQGhhYmFuYS5haSZndDs8L2E+DQotLS0NCiBkcml2ZXJzL2dw
dS9kcm0veGUveGVfaXJxLmMgfCAxNSArKysrKysrKysrKysrLS0NCiAxIGZpbGUgY2hhbmdlZCwg
MTMgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkNCg0KZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS94ZS94ZV9pcnEuYyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9pcnEuYw0KaW5kZXgg
OTA3YzhmZjBmYTIxLi43YTIzZDI1YzEwNjIgMTAwNjQ0DQotLS0gYS9kcml2ZXJzL2dwdS9kcm0v
eGUveGVfaXJxLmMNCisrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9pcnEuYw0KQEAgLTY2Miw3
ICs2NjIsNyBAQCBpbnQgeGVfaXJxX2luc3RhbGwoc3RydWN0IHhlX2RldmljZSAqeGUpDQogew0K
IAlzdHJ1Y3QgcGNpX2RldiAqcGRldiA9IHRvX3BjaV9kZXYoeGUtJmd0O2RybS5kZXYpOw0KIAlp
cnFfaGFuZGxlcl90IGlycV9oYW5kbGVyOw0KLQlpbnQgZXJyLCBpcnE7DQorCWludCBlcnIsIGly
cSwgbnZlYzsNCiANCiAJaXJxX2hhbmRsZXIgPSB4ZV9pcnFfaGFuZGxlcih4ZSk7DQogCWlmICgh
aXJxX2hhbmRsZXIpIHsNCkBAIC02NzIsNyArNjcyLDE4IEBAIGludCB4ZV9pcnFfaW5zdGFsbChz
dHJ1Y3QgeGVfZGV2aWNlICp4ZSkNCiANCiAJeGVfaXJxX3Jlc2V0KHhlKTsNCiANCi0JZXJyID0g
cGNpX2FsbG9jX2lycV92ZWN0b3JzKHBkZXYsIDEsIDEsIFBDSV9JUlFfTVNJIHwgUENJX0lSUV9N
U0lYKTsNCisJbnZlYyA9IHBjaV9tc2l4X3ZlY19jb3VudChwZGV2KTsNCisJaWYgKG52ZWMgJmx0
Oz0gMCkgew0KKwkJaWYgKG52ZWMgPT0gLUVJTlZBTCkgew0KKwkJCS8qIE1TSVggY2FwYWJpbGl0
eSBpcyBub3Qgc3VwcG9ydGVkIGluIHRoZSBkZXZpY2UsIHVzaW5nIE1TSSAqLw0KKwkJCW52ZWMg
PSAxOw0KKwkJfSBlbHNlIHsNCisJCQlkcm1fZXJyKCZhbXA7eGUtJmd0O2RybSwgJnF1b3Q7TVNJ
WDogRmFpbGVkIGdldHRpbmcgY291bnRcbiZxdW90Oyk7DQorCQkJcmV0dXJuIG52ZWM7DQorCQl9
DQorCX0NCisNCisJZXJyID0gcGNpX2FsbG9jX2lycV92ZWN0b3JzKHBkZXYsIG52ZWMsIG52ZWMs
IFBDSV9JUlFfTVNJIHwgUENJX0lSUV9NU0lYKTs8L3ByZT4NCjwvYmxvY2txdW90ZT4NCjxicj4N
ClNob3VsZG4ndCB0aGUgcGFyYW1ldGVyIGJlIG9ubHkgPHNwYW4gc3R5bGU9IndoaXRlLXNwYWNl
OiBwcmUtd3JhcCI+UENJX0lSUV9NU0kgPC9zcGFuPg0KaW4gY2FzZSBudmVjID09IDxzcGFuIHN0
eWxlPSJ3aGl0ZS1zcGFjZTogcHJlLXdyYXAiPkVJTlZBTDwvc3Bhbj4mbmJzcDsgPyA8YnI+DQo8
L2Jsb2NrcXVvdGU+DQpUaGUgYXBpIHdpbGwgdHJ5IG1zaXggd2l0aCBtc2kgZmFsbGJhY2ssIHNv
IGl0IHdpbGwgd29yay48YnI+DQpCdXQgc2luY2UgSSBkaXN0aW5ndWlzaCBhbHJlYWR5IGJldHdl
ZW4gbXNpeCBhbmQgbXNpIHRvIGdldCBudmVjLCBJIHdpbGwgZG8gdGhlIHNhbWUgZm9yIGlycSBm
bGFncy4NCjxicj4NCjxibG9ja3F1b3RlIHR5cGU9ImNpdGUiIGNpdGU9Im1pZDpmMjBjYmRhYS02
MWQ3LTQxNzQtOTJlZC1jNjc3YmE3OTJhNzNAaW50ZWwuY29tIj4NCjxibG9ja3F1b3RlIHR5cGU9
ImNpdGUiIGNpdGU9Im1pZDoyMDI0MDEyMTA5MDIxNC4yMDcyOTIzLTEtZGxpYmVybWFuQGhhYmFu
YS5haSI+DQo8cHJlIGNsYXNzPSJtb3otcXVvdGUtcHJlIiB3cmFwPSIiPiAJaWYgKGVyciAmbHQ7
IDApIHsNCiAJCWRybV9lcnIoJmFtcDt4ZS0mZ3Q7ZHJtLCAmcXVvdDtNU0kvTVNJWDogRmFpbGVk
IHRvIGVuYWJsZSBzdXBwb3J0ICVkXG4mcXVvdDssIGVycik7DQogCQlyZXR1cm4gZXJyOw0KPC9w
cmU+DQo8L2Jsb2NrcXVvdGU+DQo8L2Jsb2NrcXVvdGU+DQo8cD48YnI+DQo8L3A+DQo8L2JvZHk+
DQo8L2h0bWw+DQo=

--_000_735e26acb5ba4d5291edb47ba6d34af5habanaai_--
