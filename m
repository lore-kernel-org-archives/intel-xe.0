Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9BFEC54FB3
	for <intel-xe@archiver.kernel.org>; Thu, 29 May 2025 13:12:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83DCC10E103;
	Thu, 29 May 2025 13:12:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="U6PuYhXk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0C5310E103
 for <intel-xe@lists.freedesktop.org>; Thu, 29 May 2025 13:12:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748524360; x=1780060360;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=BZR14MXYvzxB6C2Zz0E7+9sP776prJyYdbl8zrwsljU=;
 b=U6PuYhXkGBRdizlpG7TYYD1VF/YxmXA7iP298mtrdJZEFMNXHFJ3JSaa
 cJ3T+chUcf6sn1R3JEBm2LTvtlsgqKNzHnDOJb+ueVsaMP7c+tYxLQnlC
 QT+aQ5eAMu4Hp6EMcSCIyXa60sF9Jgf19a8lG5B68TDht96LR+hdwL/Vf
 1FTorZUtajlqd3CQp8Zk0nsL3KgMUorudBMxyMglUxl/SEQHXpWEl7Uhq
 zFNEQDTRtsafS/kCNkU6ldspIt1+AjJfYid5eWUlz+FHbDj7bH+t4U7Kg
 t6A3/5HFBnDWV3CkhYFMPXXruT9nkcHVTrONMoH/o0rhpNajCfStlBcBM Q==;
X-CSE-ConnectionGUID: uHLjBDnGT8OEgEJyKIIijw==
X-CSE-MsgGUID: Bl1SLr9lS0iZetr8UZn5Tw==
X-IronPort-AV: E=McAfee;i="6700,10204,11448"; a="60845407"
X-IronPort-AV: E=Sophos;i="6.16,193,1744095600"; d="scan'208";a="60845407"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2025 06:12:35 -0700
X-CSE-ConnectionGUID: Hmzn7RgDQrK6bZjVdfLEnA==
X-CSE-MsgGUID: e+pktIuQRKybHmxF7suBcw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,193,1744095600"; d="scan'208";a="144544337"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2025 06:12:34 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 29 May 2025 06:12:32 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 29 May 2025 06:12:32 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (40.107.244.46)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Thu, 29 May 2025 06:12:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KlrAeRxVQ/OORxIt8/h8y6DbyfYQS4VSTMaXp36voMzwj3vej5s9qLsNLDxg5DSmJHisKX+AgTgEdzjwsp3OTw1sX59fBKwW6qTf8vNL7Dp5DW39+ODKDocWJ+6RCGFn5ieg/8OGMrgBJhHWrRyOBcGKyknoPWbZQxtneu8HFRhTJwUnqJXfbXAFk7ZjCtT9L8omI48E+k2BH7GvsLuPt1DeZw3sV2n/wKxY5mJv8DyvrJHVG3pzd7XTcqS5fk+4VKnKH1zn6BLCZMluOf45QC0Vou7JWBrGd8eM/JahvBS4xltZeujaZ090bdelEq2GgNb1IimPrTVhSTHepWSL7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kNss1sT8WiiE7gHKxRMAFr7ErXXgKFfi/StH9J+AD6I=;
 b=Qu7hwIfrT4EbUGR57o8YCP7JGMCN856PSnlU7GR5YdZcS68YBUCt3Eb3GHgt3Fe6/CO53/8F684dPzPPipa1qdZwS2jVWYCjjRq1HTH9WKWbf8htYwymnsH9Qvy5wYaGTEGqqG2w1wvS2ZLJbtoffQnTRVMWC2PdHDC+xgW7lFp/HPQg2gAmiOPFt/fJdLg7SkeALf30ct21y71gwxp/hxWw0PEXC8McEONmhEQix4iDZOSaim9gtCRPYFEJRHzFWaW7ItnKwnm9e1yk5qJBLF0pu6raWhIak5Wda6Y9zxESFbRmDQOZ/wSntnWLRL7Eh8T2/1vDwPErQw75hgKJLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com (2603:10b6:a03:459::19)
 by IA1PR11MB8801.namprd11.prod.outlook.com (2603:10b6:208:599::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.26; Thu, 29 May
 2025 13:12:15 +0000
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::fd8d:bca9:3486:7762]) by SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::fd8d:bca9:3486:7762%5]) with mapi id 15.20.8769.025; Thu, 29 May 2025
 13:12:13 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "Bhadane, Dnyaneshwar" <dnyaneshwar.bhadane@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Chauhan, Shekhar" <shekhar.chauhan@intel.com>, "Ausmus, James"
 <james.ausmus@intel.com>, "Bhadane, Dnyaneshwar"
 <dnyaneshwar.bhadane@intel.com>
Subject: RE: [PATCH 3/3] drm/xe/xe2_hpg: Define additional Xe2_HPG GMD_ID
Thread-Topic: [PATCH 3/3] drm/xe/xe2_hpg: Define additional Xe2_HPG GMD_ID
Thread-Index: AQHb0JIcV8q8XBkOpUCzA1z0GFJhO7PplOwA
Date: Thu, 29 May 2025 13:12:13 +0000
Message-ID: <SJ1PR11MB6204499BF0A2E75917D16E078166A@SJ1PR11MB6204.namprd11.prod.outlook.com>
References: <20250529120534.531237-1-dnyaneshwar.bhadane@intel.com>
 <20250529120534.531237-4-dnyaneshwar.bhadane@intel.com>
In-Reply-To: <20250529120534.531237-4-dnyaneshwar.bhadane@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6204:EE_|IA1PR11MB8801:EE_
x-ms-office365-filtering-correlation-id: 5efe7bda-4f79-41e9-d0de-08dd9eb26dbc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?FFODYsjpgjcj9EVJdiVEHBZ7eskQNz5whrjT9nfv3Y7k/MSTIs3sPWWK9kk6?=
 =?us-ascii?Q?CgSLdyH6B3IVTI/veYgI9/GWxAQg3RIutRbbms54a5AZ0gEwQEqmPtQfzU3K?=
 =?us-ascii?Q?xHb+bnSNcMwAZ2QnFqMhIXYHcj2Ch95dAcRcJCxaTmJ/kEOqJ61ee7sizFrO?=
 =?us-ascii?Q?qwFzBHd1IlcN205D/9vtni3AzZnhJu+wEgELkmHL9FxF9xG+MgUr44CKkgs2?=
 =?us-ascii?Q?YN1UpezP0fQWoRiD1ZmPMCHgyMJtZud9kKjbo/3YqAXNnsILFUVHY1oFBK3A?=
 =?us-ascii?Q?WREv977usLT5ucD66NoOwYYjO4rlOvsKUuoOGt5cAKC+8lrf/Xo5T2roI65I?=
 =?us-ascii?Q?Kxoi1YVGsSknwM0C2HblIhpwK4O0pqlj6Rd2O+cNfNcjfG/lK/G9yBkP+S0M?=
 =?us-ascii?Q?FsiZqirCh/+4YgQuALuV6smWxx2FRnGc9dF+K4WLnTgN/S7LsycgU+rhgHiW?=
 =?us-ascii?Q?cDoP0WSvPhERTZ4q/1i613U4zCpwBgjnYCfA81TYYZAH+yMtkMqdwfhy5N0L?=
 =?us-ascii?Q?rP3fkxqtNjk12CJaoiZZYeI8LqFsTm84cIykwZzfpOMyH/io3hktd0CMhZt3?=
 =?us-ascii?Q?AaI17tQKIWxEJI7gviAHydVytuN4tAhGNxKZ/laz1Hwf7QOfkwnklGKFmHSz?=
 =?us-ascii?Q?h2xKgeZC9GUGUpQ7sUTi9BBQzqSFRWrzkl53swWB4UrjRK8O3tS9NL+xbXs2?=
 =?us-ascii?Q?QPF3MjCBxnimIdNGSN0gvrpf4dJD4191HNjRjCVgXtHn8WFFwAVOv3ZOxE/U?=
 =?us-ascii?Q?yt5frjUXyc7iCELZRFIWmbEMMaUkThi99L0ulvTe40uO1I3sKu0caNFJrixW?=
 =?us-ascii?Q?AEJIhPW4lgKFSp0SxW/vj8LwRDYWkzOQ9xDuAiGFwZxnX2ttNgnHbmp50SwU?=
 =?us-ascii?Q?0+iBX0juQWZXPmzFwqiUDQp+sTZBQXPA1Plh6fwgSsVjEquzWD9bwJr4CXBm?=
 =?us-ascii?Q?sKWm0/j6a0C5HKgZW2L//9Cv0KQOKNQ7/B8O4hLrJ8S56rKRj1U8RBVXcy6x?=
 =?us-ascii?Q?ssyaOpkiig0Gn3InKWRLhTwQ9+9WoWR7ScPylDgsrppsSg8L9SuKVuKbeHbb?=
 =?us-ascii?Q?lkOPycmOChcMx5dRIAjoUz36+m0bb94lcZAgEAFNo7jJCF9RezrKZOU0ofpg?=
 =?us-ascii?Q?HIO9IaeJWWzEpVDFtk94vT4iteWOwGEZdOVanQvsZ66hrDSPTCt/UlLIpXAc?=
 =?us-ascii?Q?Rv9zhHXxxSxpyLpVycud9gZTh3jHe5UIwqAxPUm3Luz8OiZRx0JktwkE1E6v?=
 =?us-ascii?Q?fyhDSnMo18ChDVjv0T54wg3N+AremhVoJUrFGE/i4H3wdLP+a+29HRG1Z5o+?=
 =?us-ascii?Q?xn7h/B/hfDplsyeYsfMYeaLzL/O4yTjNYoVp7fN+LTcILeF2fIO4wQfyungX?=
 =?us-ascii?Q?8JKqm8DIFOQt2zJXJSPi0HDJdjcwSuF4vP6qRDBwVooqIjG8wNG5zfN8wOQX?=
 =?us-ascii?Q?DOZchFqXyVDCoQ+cLyPzaRKGkn+Mq6T/72UKLe0nOnQtCDctUkEfdX/8H2pd?=
 =?us-ascii?Q?OmX0Q8cCtaamd+g=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6204.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?gQsEMUSFny03Xh3DqiG9SNjFv7HjTboPEA2ZBzhh2p59QszXXz0mY+55mmVY?=
 =?us-ascii?Q?FDTpNfvbEMEbJ+pSx9LSSdJnQrn8/CEqK3cbM6xkhQUkeA9ZSsF6A2GBoBTD?=
 =?us-ascii?Q?qXBztxlLTLVoKPmb/yCkdYRjPqT4/PCKHmZLf7cCuPOPOXW3kmWqsysLe1sw?=
 =?us-ascii?Q?F9gUWsGHooEBnOYdzUBTF1ZX/mlPyPoncuMORPcorIbRMZbCtyT6HcgTeIcU?=
 =?us-ascii?Q?c6rlbVGgzXtsRqNhyq2U7Qbxx4To+/nZHSf/FHigQFFyjw4IubiPYfjLi6t5?=
 =?us-ascii?Q?7SL4xMIpsdlv9zFLjOQ26w5lyjJ8C2dloHykON/WsMsr+zZxhgk6gEpQo++7?=
 =?us-ascii?Q?/yOVVo4JtWe51YN8Y57s1A1KxFqyCHNNTEf8ue19fuDfFOhT/qhrtuQ25JNT?=
 =?us-ascii?Q?CNPPZT6CBoZOyE9dcul7kx6VJdcNt1EuDcmVtH9ZeICuivkLkgaVS6sfVP2W?=
 =?us-ascii?Q?cJbp0qmfZDQLN47buv/gNnwIZemsk7F5ibctwBl5l4xlngjA7yxbOQf0GBP4?=
 =?us-ascii?Q?syukV3bFEXk9w9SJSnHir4GzW3MDBQwy2mGaMpK9Oeo657b4fiAW+BrwuJei?=
 =?us-ascii?Q?kyTt4CM2MzdpAEZ38lXqY76mT6lKy0XW9gWtGRwJzGItK4Tof1jftVCBO0u3?=
 =?us-ascii?Q?QIxkTr0fM8I8/gDot0Uz0Coby60HbmY3XemfLSKtnk7z310YyojOllCdyt3Z?=
 =?us-ascii?Q?+ihurX/mnaZ9zZ4BP+uJLTonxGv5yLNKnb+4EXTEYXarCCwMaoIq6v9J9v7i?=
 =?us-ascii?Q?U2Y2QLWKsWKkKToXXeQEeS2+tR6bzaKKsn5yTKI4F6iyBbp47hVsPiYodQL0?=
 =?us-ascii?Q?u1sS1SfzLwKB/4clOBzPsBn2WxmLBH06Yi8SRPReVZ0LOcA8J4SkUHNfxlAi?=
 =?us-ascii?Q?b3gckXbtg5TSOfwso9wp7XYyHGXm0v50MENxzYSI1rxg352VWDXuXsYD7zmR?=
 =?us-ascii?Q?jAxOZGKe6IWbwC5KWzSJQqkBmVjGv07nEtdSNro9W3wehCNn14hr03XO97fs?=
 =?us-ascii?Q?W1pO8y5Jo/jdXK4kTV3UWuOKnAMu5Qf3Th3SAawrLJPtYpnLOb3XQ2Hj6jx+?=
 =?us-ascii?Q?iIHScwm6r8qE3KBzn+3Ik7xblX3kYU+Nig33kQASwZWXfPapfwCLUDxk4/Wz?=
 =?us-ascii?Q?CMSz45cXGSG771Nv6qi1N9h5JPzcuykmTrRGvdqNiBj37IX3HAmrCaXARis0?=
 =?us-ascii?Q?b1d0EZpRGUmqQ9pK2aloc0hKHFbBesExdRhOP8lsvKFdRZCnfs/UbzcptDRS?=
 =?us-ascii?Q?eIepC7GTd/zBAYVf5JYMxyyGx6rkzMOfTqNWmXgM/kgogGvj74fzXjHL2j8n?=
 =?us-ascii?Q?WM5NCp4Y7CGs4JiD5b+ef9lpOnc7cRQJOqEQJTH4vTCzCtKMDcgUMv6h9gLe?=
 =?us-ascii?Q?s5cm4gKHdm1mihYP9bUZSBjrJMLYZyPXYccJ9HEJWMI1m+erBzEU8ihhZzf9?=
 =?us-ascii?Q?bDCENPoY7TszxSQ+K1zVs2Q8JRXT2bL23fdnY1ozLGvX6zpopv7pINlgRymi?=
 =?us-ascii?Q?hLElqrubTZtVxPIBleo1uYGhAW0zyf2cwigsZx9SDfvThv4Y5FAMmPDAfYiT?=
 =?us-ascii?Q?5psbXOEczeyje3D3C0RyXRU1nFMdwF3sHBQvzXTA?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6204.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5efe7bda-4f79-41e9-d0de-08dd9eb26dbc
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 May 2025 13:12:13.8892 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8ShVkvi9mC2q7yRoNTP3QcpNPy047xwFi2jDyq3RvQJiHgBzIrw2T2Xi3TZxfdC8GwMCmVkyc1KY+SPoy4WcllqYza6l7ZngnNCc2dkuy7s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB8801
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



> -----Original Message-----
> From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of
> Dnyaneshwar Bhadane
> Sent: 29 May 2025 17:36
> To: intel-xe@lists.freedesktop.org
> Cc: Chauhan, Shekhar <shekhar.chauhan@intel.com>; Ausmus, James
> <james.ausmus@intel.com>; Bhadane, Dnyaneshwar
> <dnyaneshwar.bhadane@intel.com>
> Subject: [PATCH 3/3] drm/xe/xe2_hpg: Define additional Xe2_HPG GMD_ID
>=20
> From: Shekhar Chauhan <shekhar.chauhan@intel.com>
>=20
> Add another GMD_ID for Xe2_HPG
>=20
> Signed-off-by: Shekhar Chauhan <shekhar.chauhan@intel.com>
> Signed-off-by: James Ausmus <james.ausmus@intel.com>
> Signed-off-by: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_pci.c | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c in=
dex
> b68c90910d82..83f0a76a81a5 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -179,6 +179,7 @@ static const struct xe_ip graphics_ips[] =3D {
>  	{ 1271, "Xe_LPG", &graphics_xelpg },
>  	{ 1274, "Xe_LPG+", &graphics_xelpg },
>  	{ 2001, "Xe2_HPG", &graphics_xe2 },
> +	{ 2002, "Xe2_HPG", &graphics_xe2 },

Nit, should we call this Xe2_HPG+?=20
Nevertheless,=20
Reviewed-by: Tejas Upadhyay <tejas.upadhyay@intel.com>

>  	{ 2004, "Xe2_LPG", &graphics_xe2 },
>  	{ 3000, "Xe3_LPG", &graphics_xe2 },
>  	{ 3001, "Xe3_LPG", &graphics_xe2 },
> --
> 2.34.1

