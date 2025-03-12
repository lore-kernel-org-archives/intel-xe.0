Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E53B8C35FF1
	for <intel-xe@archiver.kernel.org>; Fri, 14 Mar 2025 13:04:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A237D10E9E5;
	Fri, 14 Mar 2025 13:04:08 +0000 (UTC)
X-Greylist: delayed 942 seconds by postgrey-1.36 at gabe;
 Wed, 12 Mar 2025 01:43:37 UTC
Received: from baidu.com (mx24.baidu.com [111.206.215.185])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F3AC10E615;
 Wed, 12 Mar 2025 01:43:37 +0000 (UTC)
From: "Li,Rongqing" <lirongqing@baidu.com>
To: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>
CC: "linux-perf-users@vger.kernel.org" <linux-perf-users@vger.kernel.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Kurmi,
 Suresh Kumar" <suresh.kumar.kurmi@intel.com>, "Saarinen, Jani"
 <jani.saarinen@intel.com>, "Hunter, Adrian" <adrian.hunter@intel.com>,
 "kan.liang@linux.intel.com" <kan.liang@linux.intel.com>
Subject: =?gb2312?B?tPC4tDogWz8/Pz9dIFJlZ3Jlc3Npb24gb24gbGludXgtbmV4dCAobmV4dC0y?=
 =?gb2312?Q?0250304)?=
Thread-Topic: [????] Regression on linux-next (next-20250304)
Thread-Index: AduSrWlShT/u9jWuQGqLTs10S+pbfAAQDApw
Date: Wed, 12 Mar 2025 01:27:30 +0000
Message-ID: <079a4ed4cd724cf28d99f01e1ebd0605@baidu.com>
References: <SJ1PR11MB612942635D5D653CE475A5ABB9D12@SJ1PR11MB6129.namprd11.prod.outlook.com>
In-Reply-To: <SJ1PR11MB612942635D5D653CE475A5ABB9D12@SJ1PR11MB6129.namprd11.prod.outlook.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.22.193.31]
x-baidu-bdmsfe-datecheck: 1_BJHW-Mail-Ex16_2025-03-12 09:27:31:063
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Baidu-BdMsfe-DateCheck: 1_BJHW-Mail-Ex10_2025-03-12 09:27:31:217
X-FEAS-Client-IP: 10.127.64.33
X-FE-Last-Public-Client-IP: 100.100.100.38
X-FE-Policy-ID: 52:10:53:SYSTEM
X-Mailman-Approved-At: Fri, 14 Mar 2025 13:04:08 +0000
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

PiBIZWxsbyBMaSwNCj4gDQo+IEhvcGUgeW91IGFyZSBkb2luZyB3ZWxsLiBJIGFtIENoYWl0YW55
YSBmcm9tIHRoZSBsaW51eCBncmFwaGljcyB0ZWFtIGluIEludGVsLg0KPiANCj4NCg0KVGhpcyBo
YXMgYmVlbiBmaXhlZCBieQ0KDQpodHRwczovL3dlYi5naXQua2VybmVsLm9yZy9wdWIvc2NtL2xp
bnV4L2tlcm5lbC9naXQvdGlwL3RpcC5naXQvY29tbWl0Lz9pZD03YTMxMGM2NDRjZjU3MWZiZGIx
ZDQ0N2ExZGMzOWNmMDQ4NjM0NTg5DQoNClRoYW5rcw0KDQotTGkNCg0K
