Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 397F4D2F33D
	for <intel-xe@archiver.kernel.org>; Tue, 13 Jan 2026 16:10:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E35AC10E50F;
	Tue, 13 Jan 2026 16:10:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kuXFO1RF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BC8310E50F
 for <intel-xe@lists.freedesktop.org>; Tue, 13 Jan 2026 16:10:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768320646; x=1799856646;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=hHN286W9makroGh2ndH34spydSSwbA6Q+9eh3L7hHOU=;
 b=kuXFO1RFpGqg0O9HZPS6MYbAT4ep8ZsQ7LrmhfjzXA92Xy3bPN9lOBUq
 LLENoyzaKftwy47+viRA1DQre4mtbjdIAdEjDmbFkdGtjvH7AQmv+90pB
 /IEZ5ne3E5cPW8jzaAvFflue3kVRvXbjIrT5AP+QtgM73fWKjFTiBOs+K
 Hp0LphQ9hlF3b7ANvbk61e2VdIt8logR61WLdA8jttQ1pdh5sOvoH45E5
 85eL14pv6T2gNX8kM+ekxv4KSn52SH3bJnI+hG/SZcHqaXdBmSaiQF9Uy
 yT+uVGEUJfdRnzTIywzHmBoQru5mOCtmOIPcFXw5RyD/s82T1NzC34sL+ g==;
X-CSE-ConnectionGUID: vekzKeyATnyEMt0nAKsjcA==
X-CSE-MsgGUID: iwa8VxYPQfilO4ozzLoafQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11670"; a="80327085"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; d="scan'208";a="80327085"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2026 08:10:45 -0800
X-CSE-ConnectionGUID: 349PwRO1QWiJCbZ9K15hvg==
X-CSE-MsgGUID: w1iozJ18RjauO8F1+YTrBw==
X-ExtLoop1: 1
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2026 08:10:45 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 13 Jan 2026 08:10:44 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 13 Jan 2026 08:10:44 -0800
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.18) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 13 Jan 2026 08:10:44 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RIS8PBJ1FrEgVUv3YAZ11xGFX27wUHKc05ZMaTL2kvGG/bauCYw157O30KZJdWJjwTcavqvZSZskjqkmfdoAI7YPVb96gnG3VdHpFYxDaBohGq5rTZAYGpSsVWr5q2j4quIBAkSa0Fy112Ud4zP7Wy7I2fRRAAl7RtL8chGQfiNH3qhdKPerxA5KmxM1xoik8UMRcQb7ctI6kN3PDV4lji92r43GaCrRYLm6qQmlPDVB6f2iAALyuJJQPnLoK01a310QgyJhPQFb5GGw4+nH/c48aKPd23pbEiV/rgxTNKiWywXGEsW6nHRhjC2ubdBFanBynZf1ArvT0GMtpNgJpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7E0+HQGrYZIqFWmRloskKoygyBahqjSU3yuJ/vipuLM=;
 b=RKYRzSzL78n1O/9fUTcq03JH2b2PelG4Ige7OE4TWKvsaaXI0Ajn+E7cxjhJEqSp0a16b0apf1tdJfJa5IfuMgCCp1kXWeJLGv44eNv5tPdpZsuJgS6aR5a5aXs3qPaVl5mot/i4YweBJSAQRscCOa2vVPg9Tsg+Jh0CRxLQto6NDrwRnYl44Ph0flgpE3FWOZRvreS534lv++UywDaeMKtqX10NggBqBUntnHynAMLHSNK4RKkF72xaExh0e6svwMiRPAj5IXPW1eIx94ahIEJljBrxLFIX7QH/7Du20BF3lq2at1EGHPWM7kv9mPkxhjYBS5LpD9v+9z8Q83Kkgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB5456.namprd11.prod.outlook.com (2603:10b6:5:39c::14)
 by SN7PR11MB7510.namprd11.prod.outlook.com (2603:10b6:806:349::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Tue, 13 Jan
 2026 16:10:41 +0000
Received: from DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::b23b:735f:b015:26ad]) by DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::b23b:735f:b015:26ad%5]) with mapi id 15.20.9499.005; Tue, 13 Jan 2026
 16:10:39 +0000
From: "Lin, Shuicheng" <shuicheng.lin@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Brost, Matthew" <matthew.brost@intel.com>, "Roper, Matthew D"
 <matthew.d.roper@intel.com>
Subject: RE: [PATCH] drm/xe: Unregister drm device on probe error
Thread-Topic: [PATCH] drm/xe: Unregister drm device on probe error
Thread-Index: AQHcgazWOAmGUTQFNECuVqKFvu/ZKrVQSoSA
Date: Tue, 13 Jan 2026 16:10:39 +0000
Message-ID: <DM4PR11MB54562D20A8F3FDFC23440E61EA8EA@DM4PR11MB5456.namprd11.prod.outlook.com>
References: <20260109211041.2446012-2-shuicheng.lin@intel.com>
In-Reply-To: <20260109211041.2446012-2-shuicheng.lin@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB5456:EE_|SN7PR11MB7510:EE_
x-ms-office365-filtering-correlation-id: b6db460c-3d44-4c21-eb24-08de52be4b54
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info: =?us-ascii?Q?d/tL5VQKmUBRyAffU8BGkglS/qMokHfzeVO71NMaASChXKSHK4HYQNQDoEPt?=
 =?us-ascii?Q?L/KuXD3CeVO2W+jSEazW/NuO7eP/lC6TtP5a81HvpJoQcSQJMFrb1KR7pqPn?=
 =?us-ascii?Q?+wy1meEIML2780g7OA1ZOagSz8UkLqYcrDO1Kza71/0Rb8fuAo1M6WMy5+5X?=
 =?us-ascii?Q?fDAIMti6Qizbrb5C2QY4fg/hNHYuRzZjNtHtsPhmXTIgXBpHMF2M2+FIl0Gj?=
 =?us-ascii?Q?hMpaKW3ir8WoRMH5Gtx64srehTt/7dE7BqBqSYWev59O3HYwm62H6YRe1kfq?=
 =?us-ascii?Q?0CjXQHzaKIg8oNe0VbbFX350O8PhoXrzF5KtIwfqEUVWEz9UNcRpkhbpPVwz?=
 =?us-ascii?Q?Mk8Q10+yIKHtx+vqIkdQX07HVJbWqnUczSV4puF7o6ktdpsuWUMuuJQb/cxT?=
 =?us-ascii?Q?wXP4ROhy3B0R0pl4Ju7120wNh88R5KpJBSgjwbi+aeOS+oiH0GiNQkVxZ5Km?=
 =?us-ascii?Q?vvR7gP/b0+YDvfwfuJlMwilO30p6xEehoyg79AEokYjomVoNJza4nE8FNYO0?=
 =?us-ascii?Q?yQA5mBZl+kq/TjPNl8J4CQzdy0TyWDzC8vFcDeCPvyH/bzKGnKl+x9y2v2EK?=
 =?us-ascii?Q?hDd6YrpGX/ehSndBiFBXdiytQPpeFIU2ghIExdnn9Njvgkd3jE544mRLgLZ2?=
 =?us-ascii?Q?ir9Fp/Bjh9xLQ3utn1WoRmrDUHNZZxh9Gsn6Ri5jAXrFO0zU2jBiwJT+6QVj?=
 =?us-ascii?Q?tgPOkMsjCt7GsiUe8qJ4ptbGwVAN48P28fEZHa6a8fE3Za+Y8XRVjWVf4u42?=
 =?us-ascii?Q?g76vyGX/guXBgcdanwNj/x/vLAxz1/RKMekRtwxsuk+rAbNZAERL9T8laAuc?=
 =?us-ascii?Q?Pzti5plMZ9NJctyiWN1woqrwu318Y1h2TO/Up62LB1AaNgUa1rzxaTdR6NUy?=
 =?us-ascii?Q?dX5/RIODZ0ur9j9OnAsrticYHNFBtjUtd+T1AVqSuPspXHi5ZNgB0Yf0SBWW?=
 =?us-ascii?Q?A3MIkQT/fGUrXpLUGANr9jLpMtQrvqgEYmqm4L1JFl0/UhG8QOTwml5zjIkn?=
 =?us-ascii?Q?06uVVG0Hro415Cyzz3LmRXiajoXM0qI8Ifjc++fUO/4gSI4Yt7JpsdjLDA82?=
 =?us-ascii?Q?wxkdHQ3nQNnfT8GPry2UdTOPpfsuZlMu4CERHLqqA5rabwv3mVeFIJ9+VmpX?=
 =?us-ascii?Q?X5hTH6Cd0EMkr7jjaN5VD+X5VWFUMlmnW8KtDTBAAd67RJVTC6Pift4I4EnD?=
 =?us-ascii?Q?MMkv+Hwoo5JwHdtzKS7ORlRDNPzNnHLVPYEOUkmrpa041VkATNEBlJvwGWgM?=
 =?us-ascii?Q?eSyvHQ569H5RTRbcbkXBCIMHWasLhd9RM7tljxfqOFuoCWv0qydOU6Jm+xQg?=
 =?us-ascii?Q?YqMglUmhmjuHDbQnjBjstlCO82LmpTjVTI1YMoha7HU8SW2Y8P/WIM75K0Lv?=
 =?us-ascii?Q?dgGcCEx7hf34siCKXzAAo6nC+7B7AezX3Ge6XgmL1UrU/sXyynyfKwo8n9+h?=
 =?us-ascii?Q?hBckDHWEfG5BMQGMOv62+Gi+dM+j9E0Fnxlc79LsfX+Nw3RMR+DaV8/K9Q0w?=
 =?us-ascii?Q?tJmpyJNYuCaJ0jOhwaCeXK8TslqJfnqqv5Wp?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5456.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?6pq7Ksy6mLExldrQcKKFJoq9NjiUVX4tVNbC1t/odgdWIA6SE3xLd/FIC/5E?=
 =?us-ascii?Q?fKSPnRjlP41v53DevQ9OUOh0TPT7JHyR+LIwG9jeEOwYw7jv0hr90Lu+bjqY?=
 =?us-ascii?Q?ZBpRWAO6EUZCkdPbV1g2J4Yeq+RDyOK9f/Z2HB2VLmi7Xk69QgK3voBpTjZq?=
 =?us-ascii?Q?wlF8UZSV9ySE4izPaL/dY1vkz0qtK5d06vBDIDfD9ocrbpm+nEl/Zyuut+nT?=
 =?us-ascii?Q?qKtfTKrvjZSG3DKRzAWrAHEWql0tPURRBUCfwrF8fLtRKgsh4eIQI5jq/C8B?=
 =?us-ascii?Q?x0B0PPcTNb6pvKK5ZcyIpTaKfEXyvOHbq7MqjhnOUTzXZnpXiv1gClWWFxhm?=
 =?us-ascii?Q?enW8ckG7jcUiRk8R5KmJwPIsUPmYzEdR12uHcnIMDd+zdWvU+9PUSqm5xmU6?=
 =?us-ascii?Q?+yWSlRYnTZT/FK0e/3TCXwZ7Gj5w5qqaQfBWThMraM2G06NFuIAXl/JvQNI1?=
 =?us-ascii?Q?HU7HjaeImkHSTm6iiqbhS+mbYyxVgbaUOxGM1XWX4oPcvnGnJI34JpFcfLSE?=
 =?us-ascii?Q?KPSZMB5TzHBM9ZemNnNcyHxjbelKCtlLv13BhszTzPuzYMzzWObtmbrLhkD2?=
 =?us-ascii?Q?OCVKvVKG6Emway9/wL2q9lYhwDFXSEKa7ZhtJD6lltFSz3JDVQAteyguqj8c?=
 =?us-ascii?Q?7+pQ9YnuMOEzdbSXdTg/pW3xgVQUoUlDLI+D0OR1L/5VxEZ0U/n6Xfl5qEQD?=
 =?us-ascii?Q?vDbhbV8Nn121G+krP365oTIpEI3rjqsEmsWqjV5d88IRmFv3TVe3izIFIWml?=
 =?us-ascii?Q?MVQxEKRs0yRxAJJAMuJg9gV8qKypP3sSEf1EceF9JR2VT2DOI+0KHePbjFpk?=
 =?us-ascii?Q?twkVhnvEMSKiJCxWxlDGTfNuOO0w7dg7Qc6Vtd+KD/McXLTp+MHPuX5AyOH1?=
 =?us-ascii?Q?/14Ey6fY6qAx7ABpPfkeytODN+uc/27TiAi9q9ueOdhfuaESrmoKoZZYr86f?=
 =?us-ascii?Q?Dkio/NOjRLdJLAp3ai072SCnK8z0847Z4KzGHzusYQ2PxPY8QL6JtpHFsMew?=
 =?us-ascii?Q?YuODvyyXGgsex/Pmx/+oV4/vwLreAEVM5nqLS3xHCn/01M1pl4yob/n+WZjl?=
 =?us-ascii?Q?leeNSmDeIqUVBFgBFJoJeAJvuG0SdTD2wB0uLl+w7bykWX87ZpxLjJdLd4Pq?=
 =?us-ascii?Q?7NrXj0hbj87fSYNZnq81XCFfOimIl9eFaA42qTb6wcoTx1VX5yplWKdrHqiP?=
 =?us-ascii?Q?/1b8x7wCKStlBNRZDS5RdUWvxn0ZXSefTDlNbpICp6r0NeTlSFHgMMauzCVr?=
 =?us-ascii?Q?nQ8ZhT6PPZkedGR6/Uzy9Phl2PVTltxXxi7USPOfu4/5riczDwnHjRawXpCg?=
 =?us-ascii?Q?c9vsXFxUM9im5ZYNT83+FWGT4whpUHlfgmsB2X64ne/kgVKygFQ+MRwBh3q9?=
 =?us-ascii?Q?l4mUleKj8TkPOlpMf8d1Ni3wnLRgDtClrIHY5RmsxnKtGgeam9Pwz2H5qRrF?=
 =?us-ascii?Q?j3eqC45rKSuENHWXpYKVK1ZuaUSlhIxPnEoOReLkPmBs1yc7ihx6S4d+joD8?=
 =?us-ascii?Q?KD0Wmm/Yd6zZC/m41bVuHXFGMh9b7eXNZa+lDEuZD1M37WzVaLysepkB4qE/?=
 =?us-ascii?Q?KK2W+/Kri+LCQAD2sTtu+FHqVY95oxdIbEoNPF4XTibd7NSAewMs21RkO3Bc?=
 =?us-ascii?Q?ZJkbKybw6QxzG1TL0KF5U3jiqa04QrqHeGh7MAg1IwuDiEnWbiCm0/teLDZB?=
 =?us-ascii?Q?afiqAsGXp9dhpsIjJw3M5OfmjWIpWK2wcnnpVnKQQDAA84r6mrX6OEl2Mjdy?=
 =?us-ascii?Q?ebPC7VGptg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5456.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b6db460c-3d44-4c21-eb24-08de52be4b54
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jan 2026 16:10:39.3770 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Q4I7rglY75qJeY/54tH3AsIAP4VRQ3LHm2q1eEN0V3pvz49uqERFFRdUuk082nVD6U/aNxE4rdp1FGEDm9hchA==
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

On Fri, Jan 9, 2026 1:11 PM Shuicheng Lin wrote:
> Call drm_dev_unregister() when xe_device_probe() fails after successful
> drm_dev_register(). This ensures the DRM device is promptly unregistered
> before returning an error, avoiding leaving it registered on the failure =
path.
> Otherwise, there is warn message if xe_device_probe() is called again:
> "
> [  207.322365] [drm:drm_minor_register]
> [  207.322381] debugfs: '128' already exists in 'dri'
> [  207.322432] sysfs: cannot create duplicate filename
> '/devices/pci0000:00/0000:00:01.0/0000:01:00.0/0000:02:01.0/0000:03:0
> 0.0/drm/renderD128'
> [  207.322435] CPU: 5 UID: 0 PID: 10261 Comm: modprobe Tainted: G    B   =
W
> 6.19.0-rc2-lgci-xe-kernel+ #223 PREEMPT(voluntary)
> [  207.322439] Tainted: [B]=3DBAD_PAGE, [W]=3DWARN [  207.322440] Hardwar=
e
> name: ASUS System Product Name/PRIME Z790-P WIFI, BIOS 0812
> 02/24/2023 [  207.322441] Call Trace:
> [  207.322442]  <TASK>
> [  207.322443]  dump_stack_lvl+0xa0/0xc0 [  207.322446]
> dump_stack+0x10/0x20 [  207.322448]  sysfs_warn_dup+0xd5/0x110
> [  207.322451]  sysfs_create_dir_ns+0x1f6/0x280 [  207.322453]  ?
> __pfx_sysfs_create_dir_ns+0x10/0x10
> [  207.322455]  ? lock_acquire+0x1a4/0x2e0 [  207.322458]  ?
> __kasan_check_read+0x11/0x20 [  207.322461]
> kobject_add_internal+0x28d/0x8e0 [  207.322464]
> kobject_add+0x11f/0x1f0 [  207.322465]  ? lock_acquire+0x1a4/0x2e0
> [  207.322467]  ? __pfx_kobject_add+0x10/0x10 [  207.322469]  ?
> __kasan_check_write+0x14/0x20 [  207.322471]  ? kobject_put+0x62/0x4a0
> [  207.322473]  ? get_device_parent.isra.0+0x1bb/0x4c0
> [  207.322475]  ? kobject_put+0x62/0x4a0 [  207.322477]
> device_add+0x2d7/0x1500 [  207.322479]  ? __pfx_device_add+0x10/0x10
> [  207.322481]  ? drm_debugfs_add_file+0xfa/0x170 [  207.322483]  ?
> drm_debugfs_add_files+0x82/0xd0 [  207.322485]  ?
> drm_debugfs_add_files+0x82/0xd0 [  207.322487]
> drm_minor_register+0x10a/0x2d0 [  207.322489]
> drm_dev_register+0x143/0x860 [  207.322491]  ?
> xe_configfs_get_psmi_enabled+0x12/0x90 [xe] [  207.322667]
> xe_device_probe+0x185b/0x2c40 [xe] [  207.322812]  ?
> __pfx___drm_dev_dbg+0x10/0x10 [  207.322815]  ? add_dr+0x180/0x220
> [  207.322818]  ? __pfx___drmm_mutex_release+0x10/0x10
> [  207.322821]  ? __pfx_xe_device_probe+0x10/0x10 [xe] [  207.322966]  ?
> xe_pm_init_early+0x33a/0x410 [xe] [  207.323136]
> xe_pci_probe+0x936/0x1250 [xe] [  207.323298]  ?
> lock_acquire+0x1a4/0x2e0 [  207.323302]  ? __pfx_xe_pci_probe+0x10/0x10
> [xe] [  207.323464]  local_pci_probe+0xe6/0x1a0 [  207.323468]
> pci_device_probe+0x523/0x840 [  207.323470]  ?
> __pfx_pci_device_probe+0x10/0x10 [  207.323473]  ?
> sysfs_do_create_link_sd.isra.0+0x8c/0x110
> [  207.323476]  ? sysfs_create_link+0x48/0xc0 [  207.323479]
> really_probe+0x1fd/0x8a0 ...
> "
>=20
> Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
> Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_device.c | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_devic=
e.c
> index e400ad5c9f9e..329d17fd6100 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -1059,6 +1059,7 @@ int xe_device_probe(struct xe_device *xe)
>=20
>  err_unregister_display:
>  	xe_display_unregister(xe);
> +	drm_dev_unregister(&xe->drm);
>=20
>  	return err;
>  }
> --
> 2.50.1

