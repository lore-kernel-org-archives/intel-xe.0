Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04B9FCDE006
	for <intel-xe@archiver.kernel.org>; Fri, 14 Nov 2025 07:00:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABB4310E229;
	Fri, 14 Nov 2025 07:00:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="b0J5NJno";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC5A110E229
 for <intel-xe@lists.freedesktop.org>; Fri, 14 Nov 2025 07:00:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763103602; x=1794639602;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=fwtY4iERTgBmlEeEoOX7LwAdlHYw03kDEuk+XcurFGg=;
 b=b0J5NJnoX6PH91waPyqADpsyCI7EjS5FyLDYgfAjPEUn5qBZVtpMcOIy
 tLthWkGV1fwO1Ur2AoJLhj/QLg70EXw8zGK6u8yHtuzCP+pbumnE+IDKA
 zGS5qETCyZzMTQZgU7hLgam39cY5/hLqri3KdkxENpkbzL6qaVbolScy5
 b9/ZwT2h6a3WeWtWiYig45fWNKS++GSKRK2nZqffFV7EVvS/ZG4TCs6GO
 N8vFNTCkYAK1kx3hY78i88cnz2pIVvxQz2DNE2N8mPljHLXvaJfKTA48z
 6y19zA32yniCBAPu/SogE4Ypcs1Yzz1xu0nDyyuyqz9YVpz6dq8u/pTrn w==;
X-CSE-ConnectionGUID: NnLrWk4OSZWWPeRQBUhIUg==
X-CSE-MsgGUID: eAKKj+QPQuSt6GYQjRZ87Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11612"; a="90674072"
X-IronPort-AV: E=Sophos;i="6.19,304,1754982000"; d="scan'208";a="90674072"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2025 23:00:02 -0800
X-CSE-ConnectionGUID: NDuqvzIPQ5Wr9PilaC0bKg==
X-CSE-MsgGUID: sRd/jF03SnKxq2sTIDkUtQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,304,1754982000"; d="scan'208";a="189719705"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2025 23:00:02 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 13 Nov 2025 23:00:01 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 13 Nov 2025 23:00:01 -0800
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.42) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 13 Nov 2025 23:00:01 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OVlSXi179Eqmrs4/9VWOQOYxmu5H7MNThyRtC8k+1u4ZA7rDUkCqiyDmHkwbSKDr5yXAuaHlkSL1JVwW9Dimo2VqY6DL+HAfYzklBZVBtp9yE8yUAlFKLsskRjZS49V5i0zwKo3UbtjdfnyMAWQ5DJE2p1fypqDPpssxL7HSj5+IQlzpMyygaoMQQyw0azrbz1aRKr3ILNLNPWF1QKLt8DNUlrCzrgkuBHkqRWuy/gMTlDia8GEXiuqOppWrfhw0sKAfjocvpE7TSBfDLO1HJra1f38i03G3/TkmeLhfjo6YgHVmBOqcOq/hIL4MbW76ZMnN0BLzJFzhUIHhP3RxtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c4FNsRrL2dpJLzhOLjjcXX3a+djWxmRzNnYQ/Uidtv8=;
 b=gaU8HFvG176xZyW2Lpj2ZQqaf++nWiEMpPbVj+V+qzVa4f5rnbNbw8bkV0NLfTKFzCKPhZgsmXDwZ9PrwQoXiHlLF/7jINrHDnPYR3FQxngL5IITCoNaUDjZrViQY13hLYSzFx7eiKDOkJFVlF6fRe1me2GuS59bGZDKu/ayoMiygXFxorRjlwUAGZ61ur5Zdmn6PSfdV6puVSckVSjZjeXVbabTHz9+cULCaFz/AQ5frsVTG0x3UyV7ApF8teXl4tdONhM8/W0bvNc8dHyAB74v3Kj++vhjjEtRJ96ra4WtCXosLrM1UJRcPbSw4TCUUA2BBgaWhMPJHevPuymnBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SA3PR11MB8046.namprd11.prod.outlook.com (2603:10b6:806:2fb::22)
 by SA1PR11MB8593.namprd11.prod.outlook.com (2603:10b6:806:3ab::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Fri, 14 Nov
 2025 06:59:54 +0000
Received: from SA3PR11MB8046.namprd11.prod.outlook.com
 ([fe80::f04:d46a:1742:5c3c]) by SA3PR11MB8046.namprd11.prod.outlook.com
 ([fe80::f04:d46a:1742:5c3c%4]) with mapi id 15.20.9320.013; Fri, 14 Nov 2025
 06:59:54 +0000
From: "Wang, X" <x.wang@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Lin, Shuicheng" <shuicheng.lin@intel.com>, "Zuo, Alex"
 <alex.zuo@intel.com>, "Roper, Matthew D" <matthew.d.roper@intel.com>
Subject: RE: [PATCH] drm/xe: expose PAT software table via debugfs
Thread-Topic: [PATCH] drm/xe: expose PAT software table via debugfs
Thread-Index: AQHcVTOFbU/vTReMYU6+GeATlFYmWLTxvbYg
Date: Fri, 14 Nov 2025 06:59:54 +0000
Message-ID: <SA3PR11MB804680A5B5BEF6E60AF58AE786CAA@SA3PR11MB8046.namprd11.prod.outlook.com>
References: <20251114065409.132230-1-x.wang@intel.com>
In-Reply-To: <20251114065409.132230-1-x.wang@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA3PR11MB8046:EE_|SA1PR11MB8593:EE_
x-ms-office365-filtering-correlation-id: 3447fbf9-35e0-48c8-b886-08de234b6a0d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|42112799006|1800799024|7053199007|38070700021; 
x-microsoft-antispam-message-info: =?us-ascii?Q?73Pmwob1s2S/O9WxtLAToW30LD7Pddtn8JWinsE+U9eqi9weZQZySvJV4IE6?=
 =?us-ascii?Q?iYzAdZz7h8bx7RjmmeqbPX+2YppMVzPkcSMTAxmVjPORQ4VqpTMA+sdfRP+f?=
 =?us-ascii?Q?HY87XN9TgWsISVtSF+3YAvq4dgP7fiZfi92cEuRmgzdUEbiKTZOntcAmgiOW?=
 =?us-ascii?Q?j0sVdbFLTRAKf3pAMvQ5JOsqE7E0jEw5v48Kp3dkRW3SCRdHxEtCWH9spnC7?=
 =?us-ascii?Q?V0sqCzjDODOUja99jOejxGXMJv/KhRMH3tRQgkBCuTAxDK4oDJM6DYlwiLKF?=
 =?us-ascii?Q?3S+fdaBBqjjey/G/DrvnV5hrzCRhLTuvRVpMCJftj4IgoRIJ4iGzfPtgwn0C?=
 =?us-ascii?Q?MPo5Xx5py5bjzsKs1Nljg9SkYrZUSMsRdloCXAKpGpBC9T8yGBOgrgaPq4JO?=
 =?us-ascii?Q?or1pnbyG/myl/u2usd+Z8kVy6ARyphT/KmtcAsezsPPKpIZz9WCvL9ywWFro?=
 =?us-ascii?Q?S0ECVgAW89OJMx1g04BwbQm76RMASE+qANIn9Y5K3NR1N4pfPySr4pjEBrsA?=
 =?us-ascii?Q?v3YpCdM5jjFYy7/Z41NQY9/9ZNbGth1kCgA8/qlwcH0x+occ8t/XuV4RGgy4?=
 =?us-ascii?Q?HeT+ahUot9Zh7i6zgUgf1mApH4ZdJ6s712UI1nWnrd8XgwBrQsLlPhkKAOf5?=
 =?us-ascii?Q?ltQ3Itb0pS/sVbxZ2CqVSvvqauWjo8ehaTf2KRQhB7CQTlqeKszkkMkMHT1U?=
 =?us-ascii?Q?jVO0OYd5LGU2OybG8ioJAW3jGI+UEELbLuaMdq8FYHXw71B6/ZObvw2S+rh/?=
 =?us-ascii?Q?IM3SLjH/ZjBT1G6MVMz3NvgKe0edXAjwSq6W2PCXZPsoTEYwGpGG2rQFIF4i?=
 =?us-ascii?Q?XQULFflt37wywEewInLNQxJnGwntD77B1bfcrkbZaipv6TLogTF+ZDmsxtDD?=
 =?us-ascii?Q?6+WMJJSvWT5fQVlnhctKoNHJJS1CLJZpbLXTz8sIa6x9dQumatvIVqdds5UP?=
 =?us-ascii?Q?gb39FtXo8hvm9hzMIuZHUI60+s60f/Nopvuq5rfstxfJVdOTbWmlTcE3lvPm?=
 =?us-ascii?Q?gOsIGF4sBX5I9RxYuNgIeWgdTB+FXHROh4uVni7+64ZHtttmJN+A9U6kQRpJ?=
 =?us-ascii?Q?dd2z9qFpj8MkSm46PvrZcrp6FlZCPxEKiMVglonYsbrGAy5lT+zq/U7jOYpc?=
 =?us-ascii?Q?Xxq7/9cl5IwFj9vBgiELGtuaBqEO7Pij2lTad2ijqeag1bN9/6Wh/DxWe/Ho?=
 =?us-ascii?Q?xw4qMdjqMXJNba9jM/r3alTp+Dg/TJQDSd/TlrvDCfMsBwG639L2P3UBb9Gr?=
 =?us-ascii?Q?TszzWLsOKzIfto9kJus8AOv+8GR3rUOYuGn3/+m944Gbhe/TRVUZrWrGjr7+?=
 =?us-ascii?Q?ahOnhS+MdQeoKb46004uej+JA+DR/3rd9PvNK/yXc2gLwv5X4smufMhmzM7/?=
 =?us-ascii?Q?rIoa+YL2KT+Vy8TeH8Z8b5P7G6kAmOTbTdWn6EAuwJrAmSVJs7xHqxk0Sz33?=
 =?us-ascii?Q?XmVi8v/hok2/gFI8moamc77NwFrUBK4VQ66BNj5YHKu8JLEKh6qelMY7kFvt?=
 =?us-ascii?Q?m+F/YLeuheormCx5wEM40bZhttAUvE+M4pco?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA3PR11MB8046.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(42112799006)(1800799024)(7053199007)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?EUy+eqd33E56OG9luPkKeDbvLqjrWdjn5kjGlizb/pHPL1iW+KNSU8N4WK4x?=
 =?us-ascii?Q?n1EzERDCjSA8P5k1UglmLSpo2jU+OmM6XTIDBeYG61LXAlwPrHNWqXhVn521?=
 =?us-ascii?Q?2NZ6pjr/UOSWEHWu0Yg45Vj5XM6sNdIITbLGtPdOIi9jHXD4bB2hY6XGM7nQ?=
 =?us-ascii?Q?Qi1rmdYai+/w97p1/jXUUZDVxMG1KdiiDN6Ad5sSMR4hxOFgpCtEINm0cIFN?=
 =?us-ascii?Q?YUOSjXGeGxIujreFiuYkCZKmhmzyJtdyOWwJNGOqmE6j8HQ8KDZCJfVCGV13?=
 =?us-ascii?Q?lDa1TECY+AloLq27LHtY53BOJY1p/aWADYLe+pf7vwV3VbSbRPT3BpuLD1T1?=
 =?us-ascii?Q?Mnai1HbfyDIsyloNo0U4Ocu3mVaYJMXNTae6NHhQuremuRx5oqQW4wy28cD1?=
 =?us-ascii?Q?imgFwwaKmZCCVfu7STV9faUGRhfI+GP6dx8GRKnx1noLUz0d0e5KfWQo4eQu?=
 =?us-ascii?Q?dsJC7gCYY52imhbrkdmDWPiWxJwwOqmcobXfS0wp3EhakXZLmauE+UQ9zmwl?=
 =?us-ascii?Q?dNAT1eTMPR33vcQIWvARR7PVZ/4oaa9cgjN8OlEHcJ2T9p/upkKgy4IAUr+b?=
 =?us-ascii?Q?PRgVKIK2vtf+OxZbnSmIG/PztE6qJpkNdnm3VM+dFTLOlR/MnD1afrQhrjdf?=
 =?us-ascii?Q?bHu37tDL+HdoeNNijdWgoHApQmTV/P0rf7FAW+z4KUGaNlcV9VjYbYuw+76X?=
 =?us-ascii?Q?Pk+zFSwiEPxT3ZWkuSici+tGMW9rLa4+QpgcK8CJKdp8tV2BZN2OPloSt9R9?=
 =?us-ascii?Q?nx/Cj27Kst6IUrurbfXOL/aoCunmSeyT09t9eN7i9nFFUzaSKmUwRELiI/ZR?=
 =?us-ascii?Q?nlHjXnh4Km7QNvtStsMqwiqbuMjCVkjF+v1+ybCUfaG/FPQhKM9OkQ3fnN/K?=
 =?us-ascii?Q?shj2oSCH9qmkHj15NbZzRvNGd2UbtDH5gOn3pqP3ZgtlAEgAwGq0RaDLGc8q?=
 =?us-ascii?Q?buDvW3rAy32KvhHXcMh/3o2U0z15jL0BRiwB2gEmvjRG5utnGSiL8ST3Tcg5?=
 =?us-ascii?Q?2HHghPXQVr+4x7P+uVYYEvMShbSFpz3wM0hGAkdZy7/P3+1u6MUN9+lm70Gq?=
 =?us-ascii?Q?a7A9RTQiZmuW9AerkHxOp0U0bgN1WGsgC+wz2Q2rmnf0mVQ/wy0DkCZcyX/U?=
 =?us-ascii?Q?r1F0jYT+Jn0sJWu9PyWURl9MgKoYPOfoeQFeT9y4nKDUxpnC3pUGsfqwXoRn?=
 =?us-ascii?Q?XufULnJgJOhCHfZ6pwZoqLw5RYMfrjnVLJZv1r1exR5WN2p9E0btjm+Y/MWT?=
 =?us-ascii?Q?7azdPWFwlQ0d7e59NnR86MYqvokKt5aacBvGusnA+P6ShSfYZVDyEgfwJpVZ?=
 =?us-ascii?Q?WlsE8m14Ywrcp5KlbU+Vd8yodx9L2nfwf1IJjJDu2uEUvddDxnQ4Ks/o01E4?=
 =?us-ascii?Q?EeuKCfmizVIQP/p4pasgSFn1QkDkTyqBEkW0V0X4CdFLM+tRAKXXEz33OyE9?=
 =?us-ascii?Q?dhS18B7inzYTdrbtCiYZr6czl8fM4bJYrid8GQDs+hY6Y5pO6FXFPvNBh9T+?=
 =?us-ascii?Q?XOHntiAc/KQ9h7oVIukOt69+wX8k6ycq8k/dGfhBg+zBB83lPKk/8A/M6oIB?=
 =?us-ascii?Q?ce4VwTXCOA9yjt277vE=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA3PR11MB8046.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3447fbf9-35e0-48c8-b886-08de234b6a0d
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Nov 2025 06:59:54.1608 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 36h0oyrTVQP33cPGIasbiNc/GrHuXAQwi6l/RYsvveOj/j2/0s1yMzxjvcJSZsvB/QhmwE+hUxjV6H7S1PwO9A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8593
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

Here is the dump data from BMG

/sys/kernel/debug/dri/0/gt0# cat pat_sw_config=20
PAT table: (* =3D reserved entry)
PAT[ 0] =3D [ 0, 0, 0, 0, 3, 0 ]  (     0xc)
PAT[ 1] =3D [ 0, 0, 0, 0, 3, 2 ]  (     0xe)
PAT[ 2] =3D [ 0, 0, 0, 0, 3, 3 ]  (     0xf)
PAT[ 3] =3D [ 0, 0, 0, 3, 3, 0 ]  (    0x3c)
PAT[ 4] =3D [ 0, 0, 0, 3, 0, 2 ]  (    0x32)
PAT[ 5] =3D [ 0, 0, 0, 3, 3, 2 ]  (    0x3e)
PAT[ 6] =3D [ 1, 0, 0, 1, 3, 0 ]  (   0x41c)
PAT[ 7] =3D [ 0, 0, 0, 3, 0, 3 ]  (    0x33)
PAT[ 8] =3D [ 0, 0, 0, 3, 0, 0 ]  (    0x30)
PAT[ 9] =3D [ 0, 1, 0, 0, 3, 0 ]  (   0x20c)
PAT[10] =3D [ 0, 1, 0, 3, 0, 0 ]  (   0x230)
PAT[11] =3D [ 1, 1, 0, 1, 3, 0 ]  (   0x61c)
PAT[12] =3D [ 0, 1, 0, 3, 3, 0 ]  (   0x23c)
PAT[13] =3D [ 0, 0, 0, 0, 0, 0 ]  (     0x0)
PAT[14] =3D [ 0, 1, 0, 0, 0, 0 ]  (   0x200)
PAT[15] =3D [ 1, 1, 0, 1, 1, 0 ]  (   0x614)
PAT[16] =3D [ 0, 0, 0, 0, 0, 0 ]  (     0x0) *
PAT[17] =3D [ 0, 0, 0, 0, 0, 0 ]  (     0x0) *
PAT[18] =3D [ 0, 0, 0, 0, 0, 0 ]  (     0x0) *
PAT[19] =3D [ 0, 0, 0, 0, 0, 0 ]  (     0x0) *
PAT[20] =3D [ 0, 0, 1, 0, 3, 0 ]  (    0x4c)
PAT[21] =3D [ 0, 1, 1, 0, 3, 0 ]  (   0x24c)
PAT[22] =3D [ 0, 0, 1, 0, 3, 2 ]  (    0x4e)
PAT[23] =3D [ 0, 0, 1, 0, 3, 3 ]  (    0x4f)
PAT[24] =3D [ 0, 0, 2, 0, 3, 0 ]  (    0x8c)
PAT[25] =3D [ 0, 1, 2, 0, 3, 0 ]  (   0x28c)
PAT[26] =3D [ 0, 0, 2, 0, 3, 2 ]  (    0x8e)
PAT[27] =3D [ 0, 0, 2, 0, 3, 3 ]  (    0x8f)
PAT[28] =3D [ 0, 0, 3, 0, 3, 0 ]  (    0xcc)
PAT[29] =3D [ 0, 1, 3, 0, 3, 0 ]  (   0x2cc)
PAT[30] =3D [ 0, 0, 3, 0, 3, 2 ]  (    0xce)
PAT[31] =3D [ 0, 0, 3, 0, 3, 3 ]  (    0xcf)
Page Table Access:
PTA_MODE=3D [ 0, 0, 0, 0, 3, 0 ]  (     0xc)
PCIe ATS response:
ATS_MODE=3D [ 0, 0, 0, 0, 3, 3 ]  (     0xf)
Cache Level:
IDX[XE_CACHE_NONE] =3D 3
IDX[XE_CACHE_WT] =3D 15
IDX[XE_CACHE_WB] =3D 2
IDX[XE_CACHE_NONE_COMPRESSION] =3D 12


> -----Original Message-----
> From: Wang, X <x.wang@intel.com>
> Sent: Thursday, November 13, 2025 22:54
> To: intel-xe@lists.freedesktop.org
> Cc: Lin, Shuicheng <shuicheng.lin@intel.com>; Zuo, Alex
> <alex.zuo@intel.com>; Wang, X <x.wang@intel.com>; Roper, Matthew D
> <matthew.d.roper@intel.com>
> Subject: [PATCH] drm/xe: expose PAT software table via debugfs
>=20
> The existing "pat" debugfs node dumps the live PAT registers. Under SR-IO=
V
> the VF cannot touch those registers, so the file vanishes and users lose =
all PAT
> visibility. Add a VF-safe "pat_sw_config" entry to the VF-safe debugfs li=
st. It
> prints the cached PAT table the driver programmed, rather than poking HW,
> so PF and VF instances present the same view.
>=20
> This lets IGT and other tools query the PAT configuration without carryin=
g
> platform-specific tables or mirroring kernel logic.
>=20
> Suggested-by: Matt Roper <matthew.d.roper@intel.com>
> Signed-off-by: Xin Wang <x.wang@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt_debugfs.c |  1 +
>  drivers/gpu/drm/xe/xe_pat.c        | 90 ++++++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_pat.h        |  1 +
>  3 files changed, 92 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_gt_debugfs.c
> b/drivers/gpu/drm/xe/xe_gt_debugfs.c
> index e4fd632f43cf..ec279f005b10 100644
> --- a/drivers/gpu/drm/xe/xe_gt_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_gt_debugfs.c
> @@ -220,6 +220,7 @@ static const struct drm_info_list vf_safe_debugfs_lis=
t[]
> =3D {
>  	{ "default_lrc_vcs", .show =3D xe_gt_debugfs_show_with_rpm, .data =3D
> vcs_default_lrc },
>  	{ "default_lrc_vecs", .show =3D xe_gt_debugfs_show_with_rpm, .data =3D
> vecs_default_lrc },
>  	{ "hwconfig", .show =3D xe_gt_debugfs_show_with_rpm, .data =3D
> hwconfig },
> +	{ "pat_sw_config", .show =3D xe_gt_debugfs_simple_show, .data =3D
> +xe_pat_dump_sw_config },
>  };
>=20
>  /* everything else should be added here */ diff --git
> a/drivers/gpu/drm/xe/xe_pat.c b/drivers/gpu/drm/xe/xe_pat.c index
> 68171cceea18..599fd8e0feea 100644
> --- a/drivers/gpu/drm/xe/xe_pat.c
> +++ b/drivers/gpu/drm/xe/xe_pat.c
> @@ -578,3 +578,93 @@ int xe_pat_dump(struct xe_gt *gt, struct drm_printer
> *p)
>=20
>  	return xe->pat.ops->dump(gt, p);
>  }
> +
> +/**
> + * xe_pat_dump_sw_config() - Dump the software-configured GT PAT table
> into a drm printer.
> + * @gt: the &xe_gt
> + * @p: the &drm_printer
> + *
> + * Return: 0 on success or a negative error code on failure.
> + */
> +int xe_pat_dump_sw_config(struct xe_gt *gt, struct drm_printer *p) {
> +	struct xe_device *xe =3D gt_to_xe(gt);
> +
> +	if (!xe->pat.table || !xe->pat.n_entries)
> +		return -EOPNOTSUPP;
> +
> +	drm_printf(p, "PAT table: (* =3D reserved entry)\n");
> +	for (u32 i =3D 0; i < xe->pat.n_entries; i++) {
> +		u32 pat =3D xe->pat.table[i].value;
> +
> +		if (GRAPHICS_VER(xe) >=3D 20) {
> +			drm_printf(p, "PAT[%2d] =3D [ %u, %u, %u, %u, %u, %u ]
> (%#8x)%s\n", i,
> +				   !!(pat & XE2_NO_PROMOTE),
> +				   !!(pat & XE2_COMP_EN),
> +				   REG_FIELD_GET(XE2_L3_CLOS, pat),
> +				   REG_FIELD_GET(XE2_L3_POLICY, pat),
> +				   REG_FIELD_GET(XE2_L4_POLICY, pat),
> +				   REG_FIELD_GET(XE2_COH_MODE, pat),
> +				   pat, xe->pat.table[i].valid ? "" : " *");
> +		} else if (xe->info.platform =3D=3D XE_METEORLAKE) {
> +			drm_printf(p, "PAT[%2d] =3D [ %u, %u ] (%#8x)\n", i,
> +				   REG_FIELD_GET(XELPG_L4_POLICY_MASK,
> pat),
> +
> REG_FIELD_GET(XELPG_INDEX_COH_MODE_MASK, pat), pat);
> +		} else if (xe->info.platform =3D=3D XE_PVC) {
> +			drm_printf(p, "PAT[%2d] =3D [ %u, %u ] (%#8x)\n", i,
> +				   REG_FIELD_GET(XELP_MEM_TYPE_MASK,
> pat),
> +				   REG_FIELD_GET(XEHPC_CLOS_LEVEL_MASK,
> pat), pat);
> +		} else if (xe->info.platform =3D=3D XE_DG2) {
> +			u8 mem_type =3D
> REG_FIELD_GET(XELP_MEM_TYPE_MASK, pat);
> +
> +			drm_printf(p, "PAT[%2d] =3D %s (%#8x)\n", i,
> +				   XELP_MEM_TYPE_STR_MAP[mem_type],
> pat);
> +		} else if (GRAPHICS_VERx100(xe) <=3D 1210) {
> +			u8 mem_type =3D
> REG_FIELD_GET(XELP_MEM_TYPE_MASK, pat);
> +
> +			drm_printf(p, "PAT[%2d] =3D %s (%#8x)\n", i,
> +				   XELP_MEM_TYPE_STR_MAP[mem_type],
> pat);
> +		} else {
> +			return -EOPNOTSUPP;
> +		}
> +	}
> +
> +	if (xe->pat.pat_pta) {
> +		u32 pat =3D xe->pat.pat_pta->value;
> +
> +		drm_printf(p, "Page Table Access:\n");
> +		drm_printf(p, "PTA_MODE=3D [ %u, %u, %u, %u, %u, %u ]
> (%#8x)\n",
> +			   !!(pat & XE2_NO_PROMOTE),
> +			   !!(pat & XE2_COMP_EN),
> +			   REG_FIELD_GET(XE2_L3_CLOS, pat),
> +			   REG_FIELD_GET(XE2_L3_POLICY, pat),
> +			   REG_FIELD_GET(XE2_L4_POLICY, pat),
> +			   REG_FIELD_GET(XE2_COH_MODE, pat),
> +			   pat);
> +	}
> +
> +	if (xe->pat.pat_ats) {
> +		u32 pat =3D xe->pat.pat_ats->value;
> +
> +		drm_printf(p, "PCIe ATS response:\n");
> +		drm_printf(p, "ATS_MODE=3D [ %u, %u, %u, %u, %u, %u ]
> (%#8x)\n",
> +			   !!(pat & XE2_NO_PROMOTE),
> +			   !!(pat & XE2_COMP_EN),
> +			   REG_FIELD_GET(XE2_L3_CLOS, pat),
> +			   REG_FIELD_GET(XE2_L3_POLICY, pat),
> +			   REG_FIELD_GET(XE2_L4_POLICY, pat),
> +			   REG_FIELD_GET(XE2_COH_MODE, pat),
> +			   pat);
> +	}
> +
> +	drm_printf(p, "Cache Level:\n");
> +	drm_printf(p, "IDX[XE_CACHE_NONE] =3D %d\n", xe-
> >pat.idx[XE_CACHE_NONE]);
> +	drm_printf(p, "IDX[XE_CACHE_WT] =3D %d\n", xe-
> >pat.idx[XE_CACHE_WT]);
> +	drm_printf(p, "IDX[XE_CACHE_WB] =3D %d\n", xe-
> >pat.idx[XE_CACHE_WB]);
> +	if (GRAPHICS_VER(xe) =3D=3D 30 || GRAPHICS_VER(xe) =3D=3D 20) {
> +		drm_printf(p, "IDX[XE_CACHE_NONE_COMPRESSION]
> =3D %d\n",
> +			   xe->pat.idx[XE_CACHE_NONE_COMPRESSION]);
> +	}
> +
> +	return 0;
> +}
> diff --git a/drivers/gpu/drm/xe/xe_pat.h b/drivers/gpu/drm/xe/xe_pat.h in=
dex
> 05dae03a5f54..4a3045f74bfe 100644
> --- a/drivers/gpu/drm/xe/xe_pat.h
> +++ b/drivers/gpu/drm/xe/xe_pat.h
> @@ -49,6 +49,7 @@ void xe_pat_init_early(struct xe_device *xe);  void
> xe_pat_init(struct xe_gt *gt);
>=20
>  int xe_pat_dump(struct xe_gt *gt, struct drm_printer *p);
> +int xe_pat_dump_sw_config(struct xe_gt *gt, struct drm_printer *p);
>=20
>  /**
>   * xe_pat_index_get_coh_mode - Extract the coherency mode for the given
> --
> 2.43.0

