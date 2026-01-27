Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BC1ACA6C9D
	for <intel-xe@archiver.kernel.org>; Tue, 27 Jan 2026 08:45:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B899E10E478;
	Tue, 27 Jan 2026 08:45:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fjMZSSiI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D52210E478
 for <intel-xe@lists.freedesktop.org>; Tue, 27 Jan 2026 08:45:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769503539; x=1801039539;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=chE3ggwdwLaIGcew7+SYBnxCD9f1n/K/5XMj826FkR4=;
 b=fjMZSSiIIiyPAz5WWJbiJMQNu21veW2LGpBi8K19UUHlxV+TKaaSZkEC
 rjzuMbhD6oF7UmLc905Isjia6bXI1Fv63YsOt03H0MleJz4xmhp2k5fzH
 cN8iN4dz/UiOTAZJIhFM9Tgddlx5K6aCG5cJoo4D7i6LUdII/MJZ5jgS+
 drCoOjcoYaQ180DvZfdM3NpgBz0FgGw7twBS2eCGs76e5cixUY1bGcaCP
 CiYh8yxxPhUvFqcTrgdakzuLjDnYT8co6GLzSyHuQ9RST2YyqAAc2Gacy
 DTxVl5803FbpfBv6L5WTRFwaTJtJ7Q69/5TtscS2QuN0O/ArUANUpwGd1 A==;
X-CSE-ConnectionGUID: q51BcaueThyetsOJqvSrLQ==
X-CSE-MsgGUID: idGVbqS3QXCWLZT2OKPpeA==
X-IronPort-AV: E=McAfee;i="6800,10657,11683"; a="81326410"
X-IronPort-AV: E=Sophos;i="6.21,256,1763452800"; d="scan'208";a="81326410"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2026 00:45:39 -0800
X-CSE-ConnectionGUID: stifYKGrTP+e+bdAaFt+Yw==
X-CSE-MsgGUID: kOnmwm63QgudPuMv0/h5SA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,256,1763452800"; d="scan'208";a="207042105"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2026 00:45:39 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 27 Jan 2026 00:45:37 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Tue, 27 Jan 2026 00:45:37 -0800
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.24)
 by edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 27 Jan 2026 00:45:35 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y141pb9BD3TMfpTnB4JfsM7FYe0Yt2YYCggVNNAoG6ARnWiQMJ/tRX7f3xzY9wcAkW/N8QpnudI3cHyyDW/iei2w+JFQrFlgj7dxr2fU8peoVefdTS0apu+b0Cil+l5XKuuRDuOVv3jUqCMFs7U8Rv6qPTh1UskcgIfO4/LpUYsEx83+SFAftWc04wqbrDxtICs3PIkwWaH+nFoIeDb6bX1ILOQrr6AX0CXNl2k3LWMrlpY5wwgzCeYD77HbIBV07dnWMuN0SURcqUdqphrstBZohowljMehb/J0qNava29MfrxM6J/IPr8vsP5tvGnvULoL5Uf/qbuy01CbicHrfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IUsYI+Bay8f0fhzn1Eyvkm0N65t0qy4weE2u+Z6VVXc=;
 b=fBmr4I3pFylrPkxZRabVO71wn4tlFCJwb0M7cYywwpvGRV7js6KaM+VzIRM6rY5qXi2vmP4XLUOpThMHyMVsmxHr90eYfWS7azPV2xIdjvrsempgBW4ewu5oxq1USfVFr+dQPNLKh7+lCEsrNy5DqRLTcHowwJl8PxiJyet+LtxOPJvf+ZDhtb9Hd7+21lSL70hFKNtMrgUXWf8FVahVWxPIMMYIm9wzIMQ+v370ajJVMyVKlJWDns8zWvTKwHXo2al/9CsGiU4YsiWEmcgqvusNZNoRBNsfpnNiRYdgRyaz54C2ZBwb/0W+1nnTfEQhpSGBszZymZiURvmIL5LTHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6266.namprd11.prod.outlook.com (2603:10b6:208:3e6::12)
 by CO1PR11MB4914.namprd11.prod.outlook.com (2603:10b6:303:90::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.9; Tue, 27 Jan
 2026 08:45:31 +0000
Received: from IA1PR11MB6266.namprd11.prod.outlook.com
 ([fe80::eda2:e570:4314:8720]) by IA1PR11MB6266.namprd11.prod.outlook.com
 ([fe80::eda2:e570:4314:8720%5]) with mapi id 15.20.9542.010; Tue, 27 Jan 2026
 08:45:31 +0000
From: "Bhadane, Dnyaneshwar" <dnyaneshwar.bhadane@intel.com>
To: "Chegondi, Harish" <harish.chegondi@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Chegondi, Harish" <harish.chegondi@intel.com>, "Roper, Matthew D"
 <matthew.d.roper@intel.com>, "Sousa, Gustavo" <gustavo.sousa@intel.com>
Subject: RE: [PATCH 1/1] drm/xe/xe2lpg: Extend Wa_18041344222 to graphics IP
 20.04
Thread-Topic: [PATCH 1/1] drm/xe/xe2lpg: Extend Wa_18041344222 to graphics IP
 20.04
Thread-Index: AQHcj2GqsWiEQy31xU+RTF4sLe6RN7VlskwA
Date: Tue, 27 Jan 2026 08:45:30 +0000
Message-ID: <IA1PR11MB6266DCD497CA5B66FF27B721E290A@IA1PR11MB6266.namprd11.prod.outlook.com>
References: <ddcfcd0631ccc39a84d63e1760cce672dcc7f097.1769499842.git.harish.chegondi@intel.com>
In-Reply-To: <ddcfcd0631ccc39a84d63e1760cce672dcc7f097.1769499842.git.harish.chegondi@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6266:EE_|CO1PR11MB4914:EE_
x-ms-office365-filtering-correlation-id: 06f368fc-4a5c-47c2-41fb-08de5d806dad
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|38070700021|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?D/He2Z/JyWRIOQjjQwMV18se+Ga0YdXRisg+/cy1UMPXH89mJvyT2AaoW2FX?=
 =?us-ascii?Q?IP1ULz08YY4pZQZMG588axFU8nxHtkNwDhDaZmc+1zSibEWBsN0RWshVvjkV?=
 =?us-ascii?Q?cd0PobNsUdkr8JK9uCVjKH2V55f9nXJ2KyL9kbQ5mYhN5VwTunufnof2bb9c?=
 =?us-ascii?Q?OPgExbLy8EwtGIZTPNtPt5B9BnE1T7QroQIspcfCnnGWHw+c8JSb8sNFuMPG?=
 =?us-ascii?Q?YrAthGJyZF3fkwsV0a+TY2JWSR/L3klU3tJMZfoFbCj91zLiPGd4xjpn3cdC?=
 =?us-ascii?Q?LufVHfTaBmsKPCq/zE0S5vKjvpekElqvhEhCm0AEIcxSE79BER8rBM+nAkRf?=
 =?us-ascii?Q?3fcZdwE+chVlSqTaP1AT440xe1FaWeChhheJCLt9u+wNgs4iV0KMqIIXKciQ?=
 =?us-ascii?Q?dw5OQ3EJjr58Vqzld0M/0ODtcPxGUfLWnOMCuiXGetZ6CyUYyMf5nulnTLBw?=
 =?us-ascii?Q?H4qeP3WButtznXXPLRRkfLTqH/aVIIVK5MLKrM/oGKE2kxmnkSveaGj4HsVt?=
 =?us-ascii?Q?+Qmx0ECCfGSPxX3DjzHc3efJWZrbY3PYbKG9EDNjqdSOt7lYck3V9Gb/ZBKD?=
 =?us-ascii?Q?86c4+WAbJSUDOVYEY1isxim2zx79H9mZ8y9s2elgeHTGfbmHDyDs1rYWG2sM?=
 =?us-ascii?Q?dQEWihNWlE6/6Z7BY3nHvUjWmkk8jFqGGNXVObtcXsi9thKUkPFH4fM1i9Xh?=
 =?us-ascii?Q?JttaLTCsVG87RukbKdcrJ0hL3GVN6+cSvvajP0NEmdHVACsS1jGH4I+3QaC+?=
 =?us-ascii?Q?GBop6qjj2qP5F0sCb9FXxuMWvaHATBIBOF8ac2jZ7lPKB2Ktw/g+BdrJTu90?=
 =?us-ascii?Q?WoyrAGIxdP0AqbSXSNhc4JWvgtB8JCFM7t0nbFAlZ0RBSF0eqWUKsXufUFWK?=
 =?us-ascii?Q?w7nt/GSaZqJp4/y8b60XEcqGDcDIXRNA1Se6LHF/jKy8Z9Q4NllRl1TiwsXr?=
 =?us-ascii?Q?mijyGmybpECStnI+JG8hcFMld8r94vBtJ8ZD7+9bunbqibPJebb5rQRevM/k?=
 =?us-ascii?Q?NaPKE3BtXSn5pvcrpxH9flbhtij+wJXG7S3UxALoSmXA3K29xdj1en6aH0xp?=
 =?us-ascii?Q?jn9mOLJzQAsTdZsWooGJ8+HjDMVZaDFKCRyZUhIDxi0zRxbXzccBc0s44mXe?=
 =?us-ascii?Q?0DQACwCQLwKKzRAFLmq7xJa4kaMyO9ZC1dyEvvZcAZWj857Hk+5Mjtq2IZV9?=
 =?us-ascii?Q?UJ631wng8TkuEz0PxJNo3Mmxn1fiewBxlNBP7xnqma/1Zz7Q/yVfwnEoKc6F?=
 =?us-ascii?Q?GDA7A6zIakIRrx5p6VMi0auM2ElMX/tovaKa44g5oBzwkLX8u5p8K71rdME5?=
 =?us-ascii?Q?B07lmq9qWsN/XPZQix5UlQDR3UiDZHAq7XPgmuAM9R1RkIYk8BbNvD+jRu8R?=
 =?us-ascii?Q?HvhRhlKOWy3krYrymcX4lU4WTdgdwOQMheDK6tjCdyBMvheaVRKS6NimXtsR?=
 =?us-ascii?Q?9f+vAmaV6ys9zWtKFyIDYvKawmwHl5BBLMLoerAfHxtK9m3qZBDqdsICSiyp?=
 =?us-ascii?Q?bdICqQrLsQ9qsRK78DUZYhxh510Z8H1XYgR68hPZXzkzkXPr8n02wkDNEeNC?=
 =?us-ascii?Q?4ivGhYgS3nuLH9tuljCwEGfkU+jdsEn9ky/IzWvCcrHEZQK90Ceqv9jAlZ7E?=
 =?us-ascii?Q?NEi3efFRJ1YQ7kZK88z2RQM=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB6266.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700021)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?5OFxIAvJXP6UitpfhUHpOF4I2JhM5mFa/NSZm4kEzkPgTNjTH4EBiyFolKJp?=
 =?us-ascii?Q?UcfTTaBoeML7iv2NF7AKEI1NC6gi+1hosS3iSDCWLA4Br5Q7H5Zpk4XZCSR7?=
 =?us-ascii?Q?EHjRxpJycGLgYGfDjVfw2MPQVmmxwNVy3Sqt0N2U2YAG7CT+ePpmTlda7U8n?=
 =?us-ascii?Q?1oEqryTFXDmOECswGSI+p2wyREWxIPBszqOtlZekgJ5O8AFrInl/UlKgIwvr?=
 =?us-ascii?Q?dZ7vbquGbNtx3S3XiOxGhVa7AgFMc/SQD2IKnPTONPlWYJOyn9FrqGBcNSK2?=
 =?us-ascii?Q?2q+kwFzdn9Tt5hisE/Qx8bUuQmyq1jyKfWd/X+LfUqulDU2WRGnGN2iwIkDW?=
 =?us-ascii?Q?q8ApYbWDAV/IM8m7+SoRCAIaYfteDgpkxrT4EfnkpvkcMmMaeZUOylklRtXv?=
 =?us-ascii?Q?KCaDqJYWNUHuoqcF+NP2OpyfMUptVfyab3jAz0KZN98LySiV2HAIdMpw/DQb?=
 =?us-ascii?Q?MjxBKwXY/Vjhz25SqtifQUlAAXiIHl9JNIBcSGfycZ8v0KGHmMxfSt1dAxF7?=
 =?us-ascii?Q?LPWqTpJBK15/uWR7qrxkVMhXbUoA/AyeqBK4z3+BFWEV0c63OIWB4z3kUAny?=
 =?us-ascii?Q?K1D98hoJV5H/9kOnNmtvqN8v0ZB46tD42Ky4kj4BSGWewUAMIgiLd3Ckws7G?=
 =?us-ascii?Q?TMbKFMUC4fVqOx28B10hzhwUzmoloTbhLKxaDg/Bx9NqOeqJBeUIPK6hurQc?=
 =?us-ascii?Q?c7XHtVNEiYiKWglezTIcceXTi0mBRn/tfaMa88uhNIzbHDFpRwFvcWZjdRVR?=
 =?us-ascii?Q?5KXTQybHqW89bdAUqH9ZS6a3rO0xDpVLzbyWIzJE+a94+TJZmqhPCpQsO0/a?=
 =?us-ascii?Q?siKjbRkwzGNPhYDn+YM4m0kAsVDLU6/FAgvnBgDF4c511v5kSKPE6U1vvUW5?=
 =?us-ascii?Q?hmCjh/rjDPSLZ3kTdIe4MGBwKaiwH8PtEXo9Eh9u6cz0Lh74gbdXvMcNqLzz?=
 =?us-ascii?Q?nDWrERXrCWA7dFSh36TjrPvZ8NJzeRVoCiy9uP1yBRNANe44OFVMJkxkwo3O?=
 =?us-ascii?Q?ZPFs2e5TZerB9Lz/Shf41G1+wHh/dx95JohxBFHQN5zx90JAh8TYwNJM+vPW?=
 =?us-ascii?Q?McpWGaoRxIOVuuQnLtOfJ+LaxmuswsBDoyquJ1TPsdYAroNPTlmDFk1SG05n?=
 =?us-ascii?Q?f32mvZVfwO/Yp25W2tgVNRaOhcdTYuwMc52ahHpqMjHWlExF49+dhckrlLWK?=
 =?us-ascii?Q?x4t7h2DYoUCsb+Xh3+S+WMdx3OVmW260bPjum7882tRNKS52L0oEnfJN6xCU?=
 =?us-ascii?Q?f7A3jzEbcUhwC7j3QoS/IykE9QUzDY9+Jnba6WfUOJtJxcy2u/MT5pCCyXXe?=
 =?us-ascii?Q?5yQTyTZrp5hiL1ruyBZgdxxwIxiBiRTHgbrQTu2KrMk/tZfY97GyTmcRPdED?=
 =?us-ascii?Q?dXfyrCQE7ZIMa4Tu6M3kCylQJuWzrpqeAEstjIaeBjLDqvr+6NK5ZIqcSYSm?=
 =?us-ascii?Q?c/MacYHYM+GSxlgYq5mrueOMxihtnuQcT1t70kMO5PLRiP6XndZ/uKbA64UJ?=
 =?us-ascii?Q?IGHhBsgdLLKQ8gd44HFlKr18zWxxH77pReEGkNrjybLbr7Ip4Q6l7AzUJjHz?=
 =?us-ascii?Q?6VjUr9UfsHfh/Qk3BWTaDJwVlzKJYrwfz3lo9cYPekyXJtdSeu+mf/IpyoSB?=
 =?us-ascii?Q?OgTlzxphpNKXP9s2mFCTyWcNTPLkyL5hCkdnacvoRt0Fl1CET0qB7J4EiMwg?=
 =?us-ascii?Q?PRE/FLr9+d2Ls/0XVOW+Xjxf+NYOnvzG3JkCdCArVMAcR7XhvFYTkZbrL4Tv?=
 =?us-ascii?Q?3hrqkFm6tg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6266.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 06f368fc-4a5c-47c2-41fb-08de5d806dad
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jan 2026 08:45:30.9300 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: J7RIAr7yv5D2IKQFTomnSk363NHOogbUXrdrDSayWnqYMr2lS+e0LaFT4a/XEupuoz36T2Wxd/vRJ5zc+4AmQoV+LTXe2sbD/DxzCPOL3xs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4914
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
> From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Hari=
sh
> Chegondi
> Sent: Tuesday, January 27, 2026 1:20 PM
> To: intel-xe@lists.freedesktop.org
> Cc: Chegondi, Harish <harish.chegondi@intel.com>; Roper, Matthew D
> <matthew.d.roper@intel.com>; Sousa, Gustavo <gustavo.sousa@intel.com>
> Subject: [PATCH 1/1] drm/xe/xe2lpg: Extend Wa_18041344222 to graphics IP
> 20.04
>=20
> Apply WA 18041344222 to Xe2 LPG graphics IP version 20.04 too.
>=20
> Bspec: 56024
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Cc: Gustavo Sousa <gustavo.sousa@intel.com>
> Signed-off-by: Harish Chegondi <harish.chegondi@intel.com>

LGTM,
Reviewed-by: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_wa.c | 7 +++++++
>  1 file changed, 7 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c inde=
x
> a991ee2b8781..1153a7363cff 100644
> --- a/drivers/gpu/drm/xe/xe_wa.c
> +++ b/drivers/gpu/drm/xe/xe_wa.c
> @@ -535,6 +535,13 @@ static const struct xe_rtp_entry_sr engine_was[] =3D=
 {
>  		       FUNC(xe_rtp_match_first_render_or_compute)),
>  	  XE_RTP_ACTIONS(SET(TDL_TSL_CHICKEN, RES_CHK_SPR_DIS))
>  	},
> +	{ XE_RTP_NAME("18041344222"),
> +	  XE_RTP_RULES(GRAPHICS_VERSION(2004),
> +		       FUNC(xe_rtp_match_first_render_or_compute),
> +		       FUNC(xe_rtp_match_not_sriov_vf),
> +		       FUNC(xe_rtp_match_gt_has_discontiguous_dss_groups)),
> +	  XE_RTP_ACTIONS(SET(TDL_CHICKEN,
> EUSTALL_PERF_SAMPLING_DISABLE))
> +	},
>=20
>  	/* Xe2_HPG */
>=20
> --
> 2.43.0

