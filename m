Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1032AD2F33D
	for <intel-xe@archiver.kernel.org>; Tue, 13 Jan 2026 16:11:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0C2E10E50F;
	Tue, 13 Jan 2026 16:11:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gAkdPxVu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3C4F10E50F
 for <intel-xe@lists.freedesktop.org>; Tue, 13 Jan 2026 16:11:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768320709; x=1799856709;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Uvg9KlXpvSAitZRgcVSQ5BufZ9EJQfAt60opDdE37yA=;
 b=gAkdPxVunVHNWVo+U0t3a4Rul91zO4uE1DMhALPOi0cbPkjsXV+u2Dps
 tabgEhiMPXEODMA2X6z9+LN9ug9yRANqgrNNfXzqmrIE9kPNFeP2EwA02
 92pdOjcx//7PXM9i34pj/+NGYhXIv9wZgjhpGLfrp25tB8SK59t/RSW7X
 fopNgEL2tbEz/xrg7RAEFPDRhNRiZkzAjP96iIOIWfsVKQKM6OqITUxWH
 jRLRVaB1JAkNYfCD9UokTbvrtFd+1BHR3pSL4q+8NV8SRY3t3gnL9+LHx
 CJ80uVtka8HgwCk78rniM/lgqaWCl5cSZFWP7ROIYHZgrU+wo8BjJHt/A A==;
X-CSE-ConnectionGUID: vo/Q6cweTmm6RWS5Qf5EAQ==
X-CSE-MsgGUID: i/EOt/PhQse3BjfNjvi+Gw==
X-IronPort-AV: E=McAfee;i="6800,10657,11670"; a="69591939"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; d="scan'208";a="69591939"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2026 08:11:47 -0800
X-CSE-ConnectionGUID: g5OKz0VjTsqbqFfvKMoMsQ==
X-CSE-MsgGUID: N05s3Sf0Sgy3Dqglasi1sA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; d="scan'208";a="204496292"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2026 08:11:47 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 13 Jan 2026 08:11:46 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 13 Jan 2026 08:11:46 -0800
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.61) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 13 Jan 2026 08:11:46 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pXtvNq2yXiB5MAtvh/nz7fviABx/74TH1vds5idnoRMzcDu755p+fwD864+UHr8ZghJQzwiSLJIpyh3P4uYwONbVNTZmVgyljl16rh5V/gRNbxAjjChJn6qJOLM//bVkE5bZX4G8Z0WFe44EDtm5SKGtZnUiNgMAPmNe0TNRvEfAcJehGHx+tPcWDV1/byiZql943QaSf+14eHlAWFZYL4YcqKM/lZ1PK7M8V1UPm7WrV5XehjKFbwzpxxApetZwlQEUnXK2ocTmRMOhApqisP580dY9Ja83ktMdvkr1WQoPrqv1rrt6BzMgypJgQYwmzTQh3Fw1c4uF9SPIx2hgkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IX8+ReejKVSYcFTVMkUL+DKduDrDGapZpMnL+vgnYug=;
 b=qmkRj1wAmB2emdParyup78zDVDaRIaEC8j4xKX7V9FMzqF/wnVGlxYfzs92gq8JLaFaZtip+pVZBThENN88kXIn8TCnFbvkfdCtRLBcokF8LDkSIac4THJ6gPBkA5nSQtTXBvpZq4DIUGsbE4mX0fUYPxrypKaCsAIb2z5EDH1DoWE24Kbfvb5vGyWLdndFWvzlA1CN+zCooI6SsrZ+v7KbfkdPPaDl2ahWzZVwp/YKIdPes9EKWTwurO//y7JFL8OB2QTerhmXSjfALOLE+mDHxZButpWDq13nJ4Qg8qqHNj/LzhUKb8AKqvVnUMl7WhgC8n6Ak0BVt7yXwNAlEgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB5456.namprd11.prod.outlook.com (2603:10b6:5:39c::14)
 by SN7PR11MB7510.namprd11.prod.outlook.com (2603:10b6:806:349::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Tue, 13 Jan
 2026 16:11:44 +0000
Received: from DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::b23b:735f:b015:26ad]) by DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::b23b:735f:b015:26ad%5]) with mapi id 15.20.9499.005; Tue, 13 Jan 2026
 16:11:43 +0000
From: "Lin, Shuicheng" <shuicheng.lin@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Usyskin, Alexander" <alexander.usyskin@intel.com>, "Vivi, Rodrigo"
 <rodrigo.vivi@intel.com>, "Tauro, Riana" <riana.tauro@intel.com>
Subject: RE: [PATCH] drm/xe: Manage nvm aux cleanup with devres
Thread-Topic: [PATCH] drm/xe: Manage nvm aux cleanup with devres
Thread-Index: AQHcgbPHTLVVqytVb0SAHgSRwWyEKLVQSu0g
Date: Tue, 13 Jan 2026 16:11:43 +0000
Message-ID: <DM4PR11MB5456CFA01EEC9CB9B6B03A21EA8EA@DM4PR11MB5456.namprd11.prod.outlook.com>
References: <20260109220026.2468067-2-shuicheng.lin@intel.com>
In-Reply-To: <20260109220026.2468067-2-shuicheng.lin@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB5456:EE_|SN7PR11MB7510:EE_
x-ms-office365-filtering-correlation-id: ce67b03f-0c08-4c40-b77a-08de52be71ac
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info: =?us-ascii?Q?ig9VD8dzFW8FrZhFiaOoh/1aY5V+Yh8T55X3ATpyrCJuPC2FH6pajxU15Yy3?=
 =?us-ascii?Q?b9XX0e6f1rs2IFIFP4eKEf4rsf/vy3eb9ywQ/DnLJiJ6Bg6aC+/bGkzY3N/s?=
 =?us-ascii?Q?JEVv2KEtd7E75C61Lld3yF0rGJ+0CfRxck6NehrycoUmVReO71XkcWWDITeE?=
 =?us-ascii?Q?W51jNP/r8MXrPUD7FMGes56HTL7F0sCWVouJKZhMcjlEbS9Eby4JyMxpChO0?=
 =?us-ascii?Q?hKAwQU7b/RGmBSztwmeOIELSBUAxwYK1ycO1fm3jo1/xVWaIsS0ZSV7JByCq?=
 =?us-ascii?Q?Nneqd1ooZBOqTjQZPZK4EOOFPr9f1bNgsqPUXnmA1EIB1zuPg5tQCqNKPOeB?=
 =?us-ascii?Q?fNXeRWsDO1jPcfrJEOEMKaAUSTq66idzgmEIgaK2DCdvrmlkvZJq/IdZziir?=
 =?us-ascii?Q?mD8uJkv2urAnpC8UrTMpx3dxYVZTb9fOo5X6MwtmEktA5Y7lNHrNPdU37zMo?=
 =?us-ascii?Q?eJGJDFT9y+lxsB1cK0Z5t8arOc6BEgHC2HDCJFGNNe3VCdaFKv5fXXbR3Bs1?=
 =?us-ascii?Q?eJ5DQsQVUAGShJpS/KVy9etKe/Y8VaRQYgGJIsBdUOBXYBxpV516BDx9lf9u?=
 =?us-ascii?Q?JweT2DwVtBFAeCSC4+lHE/2esLSZpQ8XxqIUnkCA3tlHVYlWem1OSueD5NMv?=
 =?us-ascii?Q?pJF+CQ3AtoymR+KjT3zGaktlvigPXEtmHZiF22+LOCD2zZg8pRdlzmOMijn+?=
 =?us-ascii?Q?eASo3sNKupRLeIlFemHcVB0VDql7ejUL/5/YN4RNUfwVeuPowG0ldjHirdY1?=
 =?us-ascii?Q?CkaTQZIDeg11YB66ExnFDCPJb5dtVqrNT6QV9NASbhWpJyhlDHFyEBir4KqX?=
 =?us-ascii?Q?5fvr5ZkOXyMqkzgbWoIQc/qOPf38xveMaER93q7vdb62WjuAUn5kyb2vEeHP?=
 =?us-ascii?Q?BfEMlOInpf7Oz7yxLwXkW5iYM0+7tgQgPLfwo2rKOmYNu+Fvz4X8WY7ABfz0?=
 =?us-ascii?Q?vZmEOz27o2pKm58uGau31r9n0yRKSQ0S+FqZz1kxNO3t+tjZQz8MIBEZK//3?=
 =?us-ascii?Q?5WXyuaDizqjLTnWUJJjlP5yz9Pb14cp50C4V/gosp8dhA6Rru6fXkmW/Hm8u?=
 =?us-ascii?Q?SpSoZvslXGKI4fRreZzR4oIEaZOmC7vjAvF8swOP3HJZvTCvWTW12dV+QkAf?=
 =?us-ascii?Q?Haqk39fvjNu0wwYLl2Ak3/YLH721kN7Qdt1+Mo5ihg1Pp3GcWg3hAp0vboUO?=
 =?us-ascii?Q?7Zs1jTFT3jhnLXLlwwhgYICBvS0QsVa6pErpcrrjgS1/UKA8zTDZs8inKaPS?=
 =?us-ascii?Q?adGkaSfboPnstV1XysmPmk7fGqi/1q4yRcBJRxCTmGFkNAB8z/adQ3iUjHoP?=
 =?us-ascii?Q?jQFk26y8N4ebRE1EomYNHWJW22ljh7z6OT00sefSyMFcWr67gT7xdAJ2ZucR?=
 =?us-ascii?Q?1YhtlYyr8DZBTQpCIy8rhvyY+fybsQ57FIS7vhXvpkyzLuCVTav0x5HhsDWB?=
 =?us-ascii?Q?1EZ12dnzTuKlUMWD2HmWWBnVMrLxle8JmXUMAHRgsAWirvEZDbe9k1iG/6dO?=
 =?us-ascii?Q?mRTiDPh3tK+e+XuOdYIwpbeKMnlaVSNp+uSU?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5456.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?L78XPm5Qhylga5UoC07bTtFSKjoqRZHv+cqoX5JtTnod4AKmDLntPWI7LIXg?=
 =?us-ascii?Q?ZocuiKdFCB3MxE/uhqPAq+mKx9WB3QpWbELFmFH4akjI7ol2f7PicMAakvpx?=
 =?us-ascii?Q?ajnwR9WFFokzG3IxzT9QV2dGMNWdi68nuwT34VIzlVtjiEN3DkWT/NDMVVzv?=
 =?us-ascii?Q?YwWLUrv3Zdlpldsl3FQb4Bn8i6cyA2k0lY4kd/fPyyaxAlQlO7sZJ02tr4ma?=
 =?us-ascii?Q?J7vMLztbuz5dyc5KLm4NMUKnOUMVY9vLj02Tt/sQGVml98NEB/PKo4Ol9bPw?=
 =?us-ascii?Q?I+bqJ9LFae0hUKHJKvUJrKumRvCel8BHJSk451jCp5S7zcbjHk6anHY0qBya?=
 =?us-ascii?Q?HRBsy0RRiEhX7mV0nkDN2Q+kUQgDXJUjOpticSaNghAm13aAjebVxQTbwQK+?=
 =?us-ascii?Q?8k6k1MyThKl2AaSsvFji0M1tTeZX+yQ1BleOMvaj4fUs2ASEOfG/5Ozl7kBL?=
 =?us-ascii?Q?/Qzf5iUCt9n2HTGwuqZigiUB1m7HZ/XqSBJBdkCxqngAuN+/yML7+o5G30a9?=
 =?us-ascii?Q?56LciS8zQi3Wv2JULcQ5RO8oSH090HZ+xlTnvhtwB7ExRUwz2P7AKT5zfohR?=
 =?us-ascii?Q?ueW8XtIfmWZnwG0v+UoupdvisqYyQHvQsCH3J/gsLFmLso8HDYh5HRZS4mna?=
 =?us-ascii?Q?bjW024K8UJSWN5ABXJJgCJMZeIOUryyi/ZcK9b5rSSj2Sd2VWYzQnGydQZKK?=
 =?us-ascii?Q?BhQBjx1dERFlndFoth5I/uATbncAEf2Nxf3Dlc/2y1kODtpxsd97W94RdIJL?=
 =?us-ascii?Q?r6C52dVDGQEENex7bTCbdL3dqCPGfKfxhilduAxgB4m0eoc2AWXOaOB1TcH8?=
 =?us-ascii?Q?+8jttulpPqsRTxBmCQ1KsnnKN169mLcnja2K0yUUeUIZLfiSSVBqU745h3Tw?=
 =?us-ascii?Q?AzjvwpBKzieLVfVtplkhI8rgvMVOo+4RXtm80MRP2gA+fKfyBxj7Dpdi2WcT?=
 =?us-ascii?Q?/K25H0EFeIyS8VyfyFd6e/691taJn/bP/jZa2zAqZ9uzlj/rRUoxr1QEsWNw?=
 =?us-ascii?Q?FLbNkWqer8224VfWReCdXUnsJuUIx9NaXXRVFFimeemxfhj8f1SwzBLUA0nr?=
 =?us-ascii?Q?4kliIwGxX3ElRt1GGG+KT5cQ5IGwGPu8ipfP3MhO6bKLXQlECg/9h/Evy0SQ?=
 =?us-ascii?Q?eViqvYaF2rq+ZvgiAebBZHyvjRWfUkjj1Moz+xwtJWfF7e72nQJUF+v8TSJR?=
 =?us-ascii?Q?yIEbTJSWneFQX4gKU6thVEZ12DIuOJlrrsd/DGI1ysdJvvwagaprwfQpxf4K?=
 =?us-ascii?Q?7JjVYIbJ3i4Sa51sHiBFEN+Y4qIW4gF1jKvRUIn+JzEog9WM3HL484zb3DAE?=
 =?us-ascii?Q?iycT9D1o/YqxOa8Mjr9az3TTkaU5eMxbvk4QVLmdjLADnXXEWzaABLpAtvZx?=
 =?us-ascii?Q?bC8J3Judla07yJSBQ+WNf2liDAR1rn7PvE9WenpAKmuMzwU1Z5CwXQrj1MMq?=
 =?us-ascii?Q?7YlFEwUcjbn8WNoAhqiwu381JBqXQp123RYQDuSTe1Up4Sp5NrBsLsY/vwLD?=
 =?us-ascii?Q?tl2pCgNNRfHyQrYqx2kglML9U4Ze0ofEDkZ7T27y0cIMTA7Ntb7Q4YcpdWT9?=
 =?us-ascii?Q?EUPNNTpnw150QIUI+T7E4rLm3bHALrEokq6Dz7bJ/tgWBnUTO75PnphgQ+Jq?=
 =?us-ascii?Q?40Ki3UQyoZKkixf5qmAaioKf/afcfC2YCclbtJuu6ETTW+dNLa+fOkIlAGKO?=
 =?us-ascii?Q?tQJxWumNPTBhVUChmA0HK81BqACtk3O8n36UCisUAltK0IfPHP5KM8OtpjG+?=
 =?us-ascii?Q?026BScP8tw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5456.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ce67b03f-0c08-4c40-b77a-08de52be71ac
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jan 2026 16:11:43.7037 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RTQ/jUDzcW95Ha1v1C8ttiA6+CmDCTCRCYODf3+m7o2rjC0TJqRkOu1PwcySLHjX+jZW74l3jKgdbsaCSR/uGg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7510
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

Hi all,
Could you please help me review it and share me your thoughts?
Thanks.

Best Regards
Shuicheng

On Fri, Jan 9, 2026 2:00 PM Shuicheng Lin wrote:
> Move nvm teardown to a devm-managed action registered from
> xe_nvm_init().
> This ensures the auxiliary NVM device is deleted on probe failure and dev=
ice
> detach without requiring explicit calls from remove paths.
>=20
> As part of this, drop xe_nvm_fini() from xe_device_remove() and from the
> survivability sysfs teardown, and remove the public xe_nvm_fini() API fro=
m
> the header.
>=20
> This is to fix below warn message when there is probe failure after
> xe_nvm_init(), then xe_device_probe() is called again:
> "
> [  207.318152] sysfs: cannot create duplicate filename
> '/devices/pci0000:00/0000:00:01.0/0000:01:00.0/0000:02:01.0/0000:03:0
> 0.0/xe.nvm.768'
> [  207.318157] CPU: 5 UID: 0 PID: 10261 Comm: modprobe Tainted: G    B   =
W
> 6.19.0-rc2-lgci-xe-kernel+ #223 PREEMPT(voluntary)
> [  207.318160] Tainted: [B]=3DBAD_PAGE, [W]=3DWARN [  207.318161] Hardwar=
e
> name: ASUS System Product Name/PRIME Z790-P WIFI, BIOS 0812
> 02/24/2023 [  207.318163] Call Trace:
> [  207.318163]  <TASK>
> [  207.318165]  dump_stack_lvl+0xa0/0xc0 [  207.318170]
> dump_stack+0x10/0x20 [  207.318171]  sysfs_warn_dup+0xd5/0x110
> [  207.318175]  sysfs_create_dir_ns+0x1f6/0x280 [  207.318177]  ?
> __pfx_sysfs_create_dir_ns+0x10/0x10
> [  207.318179]  ? lock_acquire+0x1a4/0x2e0 [  207.318182]  ?
> __kasan_check_read+0x11/0x20 [  207.318185]  ?
> do_raw_spin_unlock+0x5c/0x240 [  207.318187]
> kobject_add_internal+0x28d/0x8e0 [  207.318189]
> kobject_add+0x11f/0x1f0 [  207.318191]  ? __pfx_kobject_add+0x10/0x10
> [  207.318193]  ? lockdep_init_map_type+0x4b/0x230 [  207.318195]  ?
> get_device_parent.isra.0+0x43/0x4c0
> [  207.318197]  ? kobject_get+0x55/0xf0
> [  207.318199]  device_add+0x2d7/0x1500
> [  207.318201]  ? __pfx_device_add+0x10/0x10 [  207.318203]  ?
> lockdep_init_map_type+0x4b/0x230 [  207.318205]
> __auxiliary_device_add+0x99/0x140 [  207.318208]
> xe_nvm_init+0x7a2/0xef0 [xe] [  207.318333]  ?
> xe_devcoredump_init+0x80/0x110 [xe] [  207.318452]  ?
> __devm_add_action+0x82/0xc0 [  207.318454]  ?
> fs_reclaim_release+0xc0/0x110 [  207.318457]
> xe_device_probe+0x17dd/0x2c40 [xe] [  207.318574]  ?
> __pfx___drm_dev_dbg+0x10/0x10 [  207.318576]  ? add_dr+0x180/0x220
> [  207.318579]  ? __pfx___drmm_mutex_release+0x10/0x10
> [  207.318582]  ? __pfx_xe_device_probe+0x10/0x10 [xe] [  207.318697]  ?
> xe_pm_init_early+0x33a/0x410 [xe] [  207.318850]
> xe_pci_probe+0x936/0x1250 [xe] [  207.318999]  ?
> lock_acquire+0x1a4/0x2e0 [  207.319003]  ? __pfx_xe_pci_probe+0x10/0x10
> [xe] [  207.319151]  local_pci_probe+0xe6/0x1a0 [  207.319154]
> pci_device_probe+0x523/0x840 [  207.319157]  ?
> __pfx_pci_device_probe+0x10/0x10 [  207.319159]  ?
> sysfs_do_create_link_sd.isra.0+0x8c/0x110
> [  207.319162]  ? sysfs_create_link+0x48/0xc0 ...
> "
>=20
> Fixes: c28bfb107dac ("drm/xe/nvm: add on-die non-volatile memory device")
> Cc: Alexander Usyskin <alexander.usyskin@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Riana Tauro <riana.tauro@intel.com>
> Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_device.c             |  2 -
>  drivers/gpu/drm/xe/xe_nvm.c                | 43 +++++++++++-----------
>  drivers/gpu/drm/xe/xe_nvm.h                |  2 -
>  drivers/gpu/drm/xe/xe_survivability_mode.c |  4 --
>  4 files changed, 22 insertions(+), 29 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_devic=
e.c
> index 329d17fd6100..e08d95554f2a 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -1068,8 +1068,6 @@ void xe_device_remove(struct xe_device *xe)  {
>  	xe_display_unregister(xe);
>=20
> -	xe_nvm_fini(xe);
> -
>  	drm_dev_unplug(&xe->drm);
>=20
>  	xe_bo_pci_dev_remove_all(xe);
> diff --git a/drivers/gpu/drm/xe/xe_nvm.c b/drivers/gpu/drm/xe/xe_nvm.c
> index 01510061d4d4..1202a7abc46f 100644
> --- a/drivers/gpu/drm/xe/xe_nvm.c
> +++ b/drivers/gpu/drm/xe/xe_nvm.c
> @@ -95,6 +95,27 @@ static bool xe_nvm_writable_override(struct xe_device
> *xe)
>  	return writable_override;
>  }
>=20
> +static void xe_nvm_fini(void *arg)
> +{
> +	struct xe_device *xe =3D arg;
> +	struct intel_dg_nvm_dev *nvm =3D xe->nvm;
> +
> +	if (!xe->info.has_gsc_nvm)
> +		return;
> +
> +	/* No access to internal NVM from VFs */
> +	if (IS_SRIOV_VF(xe))
> +		return;
> +
> +	/* Nvm pointer should not be NULL here */
> +	if (WARN_ON(!nvm))
> +		return;
> +
> +	auxiliary_device_delete(&nvm->aux_dev);
> +	auxiliary_device_uninit(&nvm->aux_dev);
> +	xe->nvm =3D NULL;
> +}
> +
>  int xe_nvm_init(struct xe_device *xe)
>  {
>  	struct pci_dev *pdev =3D to_pci_dev(xe->drm.dev); @@ -153,30
> +174,10 @@ int xe_nvm_init(struct xe_device *xe)
>  		auxiliary_device_uninit(aux_dev);
>  		goto err;
>  	}
> -	return 0;
> +	return devm_add_action_or_reset(xe->drm.dev, xe_nvm_fini, xe);
>=20
>  err:
>  	kfree(nvm);
>  	xe->nvm =3D NULL;
>  	return ret;
>  }
> -
> -void xe_nvm_fini(struct xe_device *xe)
> -{
> -	struct intel_dg_nvm_dev *nvm =3D xe->nvm;
> -
> -	if (!xe->info.has_gsc_nvm)
> -		return;
> -
> -	/* No access to internal NVM from VFs */
> -	if (IS_SRIOV_VF(xe))
> -		return;
> -
> -	/* Nvm pointer should not be NULL here */
> -	if (WARN_ON(!nvm))
> -		return;
> -
> -	auxiliary_device_delete(&nvm->aux_dev);
> -	auxiliary_device_uninit(&nvm->aux_dev);
> -	xe->nvm =3D NULL;
> -}
> diff --git a/drivers/gpu/drm/xe/xe_nvm.h b/drivers/gpu/drm/xe/xe_nvm.h
> index 7f3d5f57bed0..fd3467ad35a4 100644
> --- a/drivers/gpu/drm/xe/xe_nvm.h
> +++ b/drivers/gpu/drm/xe/xe_nvm.h
> @@ -10,6 +10,4 @@ struct xe_device;
>=20
>  int xe_nvm_init(struct xe_device *xe);
>=20
> -void xe_nvm_fini(struct xe_device *xe);
> -
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_survivability_mode.c
> b/drivers/gpu/drm/xe/xe_survivability_mode.c
> index 31456f432fc8..ff406e9a82cb 100644
> --- a/drivers/gpu/drm/xe/xe_survivability_mode.c
> +++ b/drivers/gpu/drm/xe/xe_survivability_mode.c
> @@ -234,13 +234,9 @@ static SURVIVABILITY_ATTR_RO(fdo_mode,
> FDO_INFO);  static void xe_survivability_mode_fini(void *arg)  {
>  	struct xe_device *xe =3D arg;
> -	struct xe_survivability *survivability =3D &xe->survivability;
>  	struct pci_dev *pdev =3D to_pci_dev(xe->drm.dev);
>  	struct device *dev =3D &pdev->dev;
>=20
> -	if (survivability->fdo_mode)
> -		xe_nvm_fini(xe);
> -
>  	device_remove_file(dev, &dev_attr_survivability_mode);  }
>=20
> --
> 2.50.1

