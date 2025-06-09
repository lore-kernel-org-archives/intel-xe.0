Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2439AC61CE8
	for <intel-xe@archiver.kernel.org>; Mon,  9 Jun 2025 14:20:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE22210E0DD;
	Mon,  9 Jun 2025 14:20:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RHdnlCVt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA63410E0DD
 for <intel-xe@lists.freedesktop.org>; Mon,  9 Jun 2025 14:20:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749478827; x=1781014827;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=nnKBitqyaq8uLMtHBa9zW99oU5G9yhfgJYoixiChIP0=;
 b=RHdnlCVtQsISORwXwmbAw7G6P6UMNqv9APg2NKVEMVq71iPrQjXt4FW3
 KP8YYQglg18TUDkr6vmhh9GRwLobMN4mgkD/pMU2+Ql7J2/by7FvQJGaq
 omEgbchaWkgiM0V2QCC2CSWLRUnSZPmwz6J5ZCGbgNQWLPkh+3lN/4mTF
 VcNNDaa/fRQpLoTx2+a5ztDL/E6zzYsU8Lg+7NdSpntEzvjP9U/2FJaB8
 lboRkJGo1oocCTqqW2sFHkPEb1DYynsb3rexjbzY4KpSF4yBk70VShUAY
 QwK+sph0htH6uS0kV2hUlIxw/48jjspUFsLcQCJrSV51zlK0vifoHk8Pl g==;
X-CSE-ConnectionGUID: gUk8BRG6TfWxJV2zaouLkw==
X-CSE-MsgGUID: RtWJaunXSs+n1ah7B3rvZg==
X-IronPort-AV: E=McAfee;i="6800,10657,11459"; a="74090827"
X-IronPort-AV: E=Sophos;i="6.16,222,1744095600"; d="scan'208";a="74090827"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2025 07:20:27 -0700
X-CSE-ConnectionGUID: BLpsJJYLRFih6tp+bxSwmQ==
X-CSE-MsgGUID: kxbY52adRVWsz7DZebk+Qg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,222,1744095600"; d="scan'208";a="146456311"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2025 07:20:27 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 9 Jun 2025 07:20:26 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 9 Jun 2025 07:20:26 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (40.107.244.85)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Mon, 9 Jun 2025 07:20:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DXW9oNWIwlL7F84taU9BxJDRNEAtngU+KhttaRSUk8qe8KVQXoAhhqk83zNNPwcMFSRoY20IU+BsiMPJzQcLU7oi5qguZlu6oqGWeG4hzElgeZGe0ZmKntOaEEnwFanzEVReSrUTnjf+T92ZdtfhSZbMp4YiwIvH871WWNHfFNs14o1m+9ejKJn2pXOJDgi+emCWLyPxu3wJpvr1AVUQeGAEQl1VB/WGTVLFDVDUruAIEHa/Qmph7X1+QPjlY072Oz2/qTNQJ7A2qb//lmBJ9XckMqWImHskjBtgGn3ocsz31Pz60psofQCVBy8ubgbZAXWkuR3uubEdmxUVG++SAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aDWNxGalbievSj0s1vz2ryAoM9i2oBszYEA0imhwYC8=;
 b=V0F1Q0H2zF4kujQgdcDmpfHFcAcvcMyLdAK+l8bfb/Lp2cW19CxHQwPKqLySZZYji1HgR3I+I1ckkhVhMvL6b6U9f9HTjoNU/LtfSQ4cTcOqrvO9Z0BiMRfDJRjqjB6Z+F4kaerU7S8vTVuHLdeygCy7xpQ2CElcdjW0Lo0HxbH/Mq1yx8NliLZxaZduoG/505A6lJhxZ5s73zKYqbI49MYY2l3f3EXS9xCWfjtgxzaHCYq3ofJ92ACDOxvWKsW3uVMpeKfAeKO6CmkFecMzhr8AFo0otW8i6Ql0Y9ujNcMqTJAi66Pua/tBCRb5N2Zq2/CE5puPSvG9Vxg4Z6/yCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com (2603:10b6:a03:459::19)
 by SJ5PPFF6F855567.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::861) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.37; Mon, 9 Jun
 2025 14:20:10 +0000
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::fd8d:bca9:3486:7762]) by SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::fd8d:bca9:3486:7762%5]) with mapi id 15.20.8813.024; Mon, 9 Jun 2025
 14:20:10 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "Levi, Ilia" <ilia.levi@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
CC: "Levi, Ilia" <ilia.levi@intel.com>, "Elbaz, Koby" <koby.elbaz@intel.com>, 
 "Sinyuk, Konstantin" <konstantin.sinyuk@intel.com>, "Avizrat, Yaron"
 <yaron.avizrat@intel.com>, "Haimovski, Moti" <moti.haimovski@intel.com>,
 "Freiman, Didi" <didi.freiman@intel.com>
Subject: RE: [PATCH v2] drm/xe: Support for mmap-ing mmio regions
Thread-Topic: [PATCH v2] drm/xe: Support for mmap-ing mmio regions
Thread-Index: AQHb2SVLujqcDk+u/E+Zym8zlU5c4LP630Aw
Date: Mon, 9 Jun 2025 14:20:10 +0000
Message-ID: <SJ1PR11MB6204EF8ECD2EAE0F8F5AB93C816BA@SJ1PR11MB6204.namprd11.prod.outlook.com>
References: <20250609095938.16782-1-ilia.levi@intel.com>
In-Reply-To: <20250609095938.16782-1-ilia.levi@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6204:EE_|SJ5PPFF6F855567:EE_
x-ms-office365-filtering-correlation-id: a7fa36d7-3e8f-461f-6b30-08dda760be30
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|10070799003|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?0IUvohLJIU5mAbfJrnr4B682RhHbNNOWeexbOW81L/01Dgh05cS8GxDOywkD?=
 =?us-ascii?Q?ZlyRmIaZ5USaNd9fumJkaTSL9m0uEjexR8s3SfdUGoo/iWP6qh1KRL8NCypI?=
 =?us-ascii?Q?WlYQppw12UCXLnbzA/xpG+bwkL6l0aLoW0hjAG7hWi7zsZlgRs/FSQiNwLBk?=
 =?us-ascii?Q?9aHLJvXFnW8o2EQQ5QxKFAzqIKiCMEMN01/ISlB2uFDt200mRgjyul/RZnEP?=
 =?us-ascii?Q?K/HfT6ChL0cPxaR0fLBE6M4z1lR/QLJHCYR+/1Gts7jdYQZhUHDUyBOz1gTg?=
 =?us-ascii?Q?RTcbgQ9D1JH0Cd1x6k4aJ1E6JwoJjHc2tIgOpsrR2fyPDaSeRjoQGcgiWZP1?=
 =?us-ascii?Q?3J9nCkNEH3F7kEDR1A/0bX55wLjxOpkaorgJGUExPpj+wJmJs8OuJOlZt0pZ?=
 =?us-ascii?Q?++7y9wUkp3B7TZk3hfsC1koHPPXEiq5b99Qu5yTJyV3tvwlBA8us6Uw+bwds?=
 =?us-ascii?Q?rQZDTsMEOVlymT7nR22miNieUkJsPnvkX7IxlhkQ2sHAvgpSqj/GrTc+JNwZ?=
 =?us-ascii?Q?P6tvrBI/wxslmDbxp+ks7kWvpwJd/MMQg6zO3z0dkmie5+LA2sw8lQ107pE0?=
 =?us-ascii?Q?kMFn354JI4hTfuO+aFTyDW+NCHmDMIb1H8fXS0cankdRISJGt3EHE2S+D488?=
 =?us-ascii?Q?29xPzJrTRWK8AKMbfTSoFMJr9bYzjn2ljOXydgSg2H6vDoJqZa3dy8sg71K1?=
 =?us-ascii?Q?eanFJ8FaILdi+3kyUfrj3yR6rNwoPIMc7AdT1/ERVsf6CotfwMjifj67gp/+?=
 =?us-ascii?Q?e/1JOjJhhsYVWjYixPFr+/QUMHqnoaTanDJMEZxiymUUDMcOC+vMx+sEZWLM?=
 =?us-ascii?Q?Um6jtYBHGX4P6b/zsvQusddT9CWgZhX5PAiQSrzwglrWCQJ9JzH8nXx84Jji?=
 =?us-ascii?Q?tHZygAFRpH1PEKAEtf5qf6/UgtEgDUbBBbi1FnSXzg6WivRwXg86teBllMp2?=
 =?us-ascii?Q?hpY7G/WQmo0bZmJmPixKtLC+0uNCELGYitgIYcTxNVzKqBAwlN6vMz9ZKSRC?=
 =?us-ascii?Q?A46hJJQKDz7F12m4M388uHNrf5hgRP5nFAYsJ1Bk7lcd8lmHk5yJQ/wRm4sK?=
 =?us-ascii?Q?i9V9PDFS0B7ix6z9zm/qOX3NejUmul5OgEnalf4CQKsUWDjCBEyah6COL9d4?=
 =?us-ascii?Q?E8cvJayr09tUQTZrDyGKOwjhez052FG3Vtvsdiny+sSk3tt6Q/PusqJacnNh?=
 =?us-ascii?Q?d4lM8Sj3FsRbQ33XSrdMl67CteHoKCdXI8mHremFRQTcpeBoYsH9Irw2okzM?=
 =?us-ascii?Q?ssiqU3Hc5QSYaGQ1Ke06JpB/20HPfx0IkXWHa/htAq4/i+lEhrMG2a/HANbI?=
 =?us-ascii?Q?+mgWoE8rxk1AghGuIYosDXxnlYa+SjWfYEOfhCgDi4OEGDyGS4qS5Az3eWSL?=
 =?us-ascii?Q?FJqT/PAc1Ay90pLVQSupiaby4klhCKmBQ8QqpojaFcSpRQCcLOw6z7rl8Xeh?=
 =?us-ascii?Q?Jlxba6glNdNuQgYGt+Qs5F0jIt/n9D4ic2wYeVYBNg80sNqomCpRz59FIdGb?=
 =?us-ascii?Q?pOgXIj21MbvRYaw=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6204.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(10070799003)(7053199007)(38070700018);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?uGv7CQNpwkcE+lAbwijr3TQr1MTpRjiRNPrRBR1LwZhgjo9mUTCatED6ndD1?=
 =?us-ascii?Q?ifk5fV/HRaDqlMjZ45t+Mov9H5JBfHNSGHO5kT6r1IQMGWjnqiyG5pPxtuAu?=
 =?us-ascii?Q?27qdOMqn4HiIsUyG85htM6KKT6bKkC+Lu1GJxZMOocuP+1BV0dSttF6qdBlw?=
 =?us-ascii?Q?/SxZhBz6ifdC0GNMBDqtNyUq5TMwtvBPWKgVuUVYLX7KOMGrNXQZ/866rI4b?=
 =?us-ascii?Q?CfScXR3OcVE5s5vWZyMy5BfPGgDmjSIRi0tZj2t6tshvFpJUxR8Xc82OFst2?=
 =?us-ascii?Q?73TcDkU7Sj5/p+a0hBap9ialaugh9Kzu4nZ924NxJ5/DErC3YUfMtfZb3nJo?=
 =?us-ascii?Q?0RlJUv5M2I5QLrz4CBFGLQlBgLaJbYt70Le+XyP1lG0wlQ+yTgWtQqJ639Uz?=
 =?us-ascii?Q?F0mTWO4hGI7jBRGTrPuc92frT8qH0ZzUZ8xA93eyo1uXWVgqf5ag4nKmhZmv?=
 =?us-ascii?Q?SBpkPIhCnilj7OdY0Ct1/ktrAI6sNHkUFyAX6F+ZMm8Ss4armPvrHJK/hz6H?=
 =?us-ascii?Q?MLXFddbVHjlbNwNQvtgjobMk/+u/RWXxfGoM6cKECZx0P6cnNEg56EphckYc?=
 =?us-ascii?Q?Kvtl4/F2XCjo3o96YxKuuk95bRJVsd9GgACEVZvxnDFENyo3LfQ2+Z7fEnB9?=
 =?us-ascii?Q?uF+LY8dgkfy9dl75T7xOIeH7XRseJnUABuatG7ySTMAi+qOV/Lj2Dja+9IJc?=
 =?us-ascii?Q?rmySlus+JQUNfqNCbkk8oUqg9zx5PuG4vrGO/zT2CCw+oVFhRQZGU26QeULB?=
 =?us-ascii?Q?wKzG/m1dLGOfxEQ1Z0z8lZvZs9qKNucZcLrMQhwTRbT+sd0UXATFUtrj+0g3?=
 =?us-ascii?Q?l9ubUi99Kx3w6GPo1uqT9FgN3n+NOz/9w4LUFQgbgo3ed/NPP+Vqhh2NHbpb?=
 =?us-ascii?Q?fCIILG3vxv/Qa4PpApirRXKTinPxN7MSRY9K4UbI35oOG27HO3+OZdBC3vds?=
 =?us-ascii?Q?2KQva46YxAB+Y4JLv1mwOAFL23aWiWtv9vyPY/3yY4KHkyuuyQlUF+5Q/PSD?=
 =?us-ascii?Q?AjPn0WVm8e/BNcYxKiiGokTf4bBRIXgb0IjKoj6hbucJfPRT0nOQF/C2sQDB?=
 =?us-ascii?Q?O9hxD0Cn7tGEVRJNLy7+vKyFIDAe6tPWOsWasL7iZauWqyXQV6IKLDHAd7Jb?=
 =?us-ascii?Q?ZpYiDi5XeUGnr4NPhtlPIy2oZn7cKjmFz7HUNaB3YvP55+YcnImxkZ8zg/2h?=
 =?us-ascii?Q?W4MmAOmOEa3nh3DlP8/LV3usKoAvpBZgIgrDxvnrOPZVtwP4+VPsePmoCOkz?=
 =?us-ascii?Q?+ce11qkU7kcym87IHy7WCmsstduOApyt1bNqXRZUiIneFzjwZTRxP1vgp8RB?=
 =?us-ascii?Q?bHSTQA7J1WfXzpbVNZEUeIFh/NI4/7CrYo3cJB8hAlkWU37T3V7DBF98Alv5?=
 =?us-ascii?Q?uvhC2G9kUW3SQZTX+FxmepYpecifrF4oXjxOCQect2dZ/ty/aw4YSQqspHEM?=
 =?us-ascii?Q?EEVEaZLvjqcU+olWgy8zoCPj+UTpeh7Mfj4OoOUGL1hmaAKqsA+zfPEJbtXa?=
 =?us-ascii?Q?fpToWCITc94+C8bMVCTlMKQtocZlJlGkHlfhRaLAVKUDZ7lAFanpsY36j93N?=
 =?us-ascii?Q?ECuuxk0WdHhauETz2HRF6d9cDymrSN+temzOCsp079CG+UkbbiehCK0BGkH1?=
 =?us-ascii?Q?I7w/Eev1u+zoHmyggmEAcFFpHdh5swIDzHOtdpD5lH/C?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6204.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a7fa36d7-3e8f-461f-6b30-08dda760be30
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jun 2025 14:20:10.5822 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oKZ4sjERt74DZOZu0Pdt7CdVSS/QVZTFkmWBnzfzIg4MHx8orf836EdMXOgTUOl3pfg1YVleoaKe3hz50w+mHXoe0nZURMg7+dGFSDUuock=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPFF6F855567
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
> From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Ilia=
 Levi
> Sent: 09 June 2025 15:30
> To: intel-xe@lists.freedesktop.org
> Cc: Levi, Ilia <ilia.levi@intel.com>; Elbaz, Koby <koby.elbaz@intel.com>;
> Sinyuk, Konstantin <konstantin.sinyuk@intel.com>; Avizrat, Yaron
> <yaron.avizrat@intel.com>; Haimovski, Moti <moti.haimovski@intel.com>;
> Freiman, Didi <didi.freiman@intel.com>
> Subject: [PATCH v2] drm/xe: Support for mmap-ing mmio regions
>=20
> Allow the driver to expose hardware register spaces to userspace through
> GEM objects with fake mmap offsets. This can be useful for userspace-
> firmware communication, debugging, etc.
>=20
> v2: Minor doc fix (CI)
>=20
> Signed-off-by: Ilia Levi <ilia.levi@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_device_types.h |  14 +++
>  drivers/gpu/drm/xe/xe_mmio.c         | 142 +++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_mmio.h         |   4 +
>  3 files changed, 160 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h
> b/drivers/gpu/drm/xe/xe_device_types.h
> index ac27389ccb8b..78542de0d48d 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -10,6 +10,7 @@
>=20
>  #include <drm/drm_device.h>
>  #include <drm/drm_file.h>
> +#include <drm/drm_gem.h>
>  #include <drm/drm_pagemap.h>
>  #include <drm/ttm/ttm_device.h>
>=20
> @@ -161,6 +162,19 @@ struct xe_mmio {
>  	u32 adj_offset;
>  };
>=20
> +/**
> + * struct xe_mmio_gem - GEM wrapper for xe_mmio
> + *
> + * A GEM object for exposing xe_mmio instance to userspace via mmap.
> + */
> +struct xe_mmio_gem {
> +	/** @base: GEM object base */
> +	struct drm_gem_object base;
> +
> +	/** @mmio: The MMIO region to expose */
> +	struct xe_mmio mmio;
> +};
> +
>  /**
>   * struct xe_tile - hardware tile structure
>   *
> diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
> index 7357458bc0d2..6bfa915a9602 100644
> --- a/drivers/gpu/drm/xe/xe_mmio.c
> +++ b/drivers/gpu/drm/xe/xe_mmio.c
> @@ -408,3 +408,145 @@ int xe_mmio_wait32_not(struct xe_mmio *mmio,
> struct xe_reg reg, u32 mask, u32 va  {
>  	return __xe_mmio_wait32(mmio, reg, mask, val, timeout_us, out_val,
> atomic, false);  }
> +
> +/**
> + * DOC: Exposing MMIO regions to userspace
> + *
> + * In certain cases, the driver may allow userspace to mmap a portion of=
 the
> hardware registers.
> + *
> + * This can be done as follows:
> + * 1. Define an xe_mmio instance that represents this portion.
> + * 2. Call xe_mmio_gem_create() to create a GEM object with an mmap-able
> fake offset.
> + * 3. Use drm_vma_node_offset_addr() on the created GEM object to
> retrieve the fake offset.
> + * 4. Provide the fake offset to userspace.
> + * 5. Userspace can call mmap with the fake offset. The length provided =
to
> mmap
> + *    must match the size of the xe_mmio instance.
> + * 6. When the region is no longer needed, call xe_mmio_gem_destroy() to
> release the GEM object.
> + *
> + * Limitations: The exposed xe_mmio must be page-aligned with regards to
> its BAR offset and size.
> + *
> + * WARNING: Exposing MMIO regions to userspace can have security and
> stability implications.
> + * Make sure not to expose any sensitive registers.
> + */
> +
> +static void xe_mmio_gem_free(struct drm_gem_object *); static int
> +xe_mmio_gem_mmap(struct drm_gem_object *, struct vm_area_struct *);
> +
> +static const struct vm_operations_struct vm_ops =3D {
> +	.open =3D drm_gem_vm_open,
> +	.close =3D drm_gem_vm_close,

Should you remap in fault handler, to make sure mapping is there always?

> +};
> +
> +static const struct drm_gem_object_funcs xe_mmio_gem_funcs =3D {
> +	.free =3D xe_mmio_gem_free,
> +	.mmap =3D xe_mmio_gem_mmap,
> +	.vm_ops =3D &vm_ops,
> +};
> +
> +static inline struct xe_mmio_gem *to_xe_mmio_gem(struct drm_gem_object
> +*obj) {
> +	return container_of(obj, struct xe_mmio_gem, base); }
> +
> +static inline phys_addr_t xe_mmio_phys_addr(struct xe_mmio *mmio) {
> +	struct xe_device *xe =3D tile_to_xe(mmio->tile);
> +
> +	/*
> +	 * All MMIO instances are currently on PCI BAR 0, so we can do the
> trick below.
> +	 * In the future we may want to store the physical address in struct
> xe_mmio.
> +	 */
> +	return pci_resource_start(to_pci_dev(xe->drm.dev),
> GTTMMADR_BAR) +
> +		(uintptr_t)(mmio->regs - xe->mmio.regs); }
> +
> +/**
> + * xe_mmio_gem_create - Expose an MMIO region to userspace
> + * @mmio: xe_mmio instance
> + * @file: DRM file descriptor
> + *
> + * This function creates a GEM object with an mmap-able fake offset
> +that wraps
> + * the provided xe_mmio instance.
> + *
> + * See: "Exposing MMIO regions to userspace"
> + */
> +struct xe_mmio_gem *
> +xe_mmio_gem_create(struct xe_mmio *mmio, struct drm_file *file) {
> +	struct xe_device *xe =3D tile_to_xe(mmio->tile);
> +	size_t size =3D mmio->regs_size;
> +	struct xe_mmio_gem *obj;
> +	struct drm_gem_object *base;
> +	int err;
> +
> +	if ((xe_mmio_phys_addr(mmio) % PAGE_SIZE !=3D 0) || (size %
> PAGE_SIZE !=3D 0))
> +		return ERR_PTR(-EINVAL);
> +
> +	obj =3D kzalloc(sizeof(*obj), GFP_KERNEL);
> +	if (!obj)
> +		return ERR_PTR(-ENOMEM);
> +
> +	base =3D &obj->base;
> +	base->funcs =3D &xe_mmio_gem_funcs;
> +	obj->mmio =3D *mmio;
> +
> +	drm_gem_private_object_init(&xe->drm, base, size);
> +
> +	err =3D drm_gem_create_mmap_offset(base);
> +	if (err)
> +		goto free_gem;
> +
> +	err =3D drm_vma_node_allow(&base->vma_node, file);
> +	if (err)
> +		goto free_gem;
> +
> +	return obj;
> +
> +free_gem:
> +	xe_mmio_gem_free(base);
> +	return ERR_PTR(err);
> +}
> +
> +static void xe_mmio_gem_free(struct drm_gem_object *base) {
> +	struct xe_mmio_gem *obj =3D to_xe_mmio_gem(base);
> +
> +	drm_gem_object_release(base);
> +	kfree(obj);
> +}
> +
> +/**
> + * xe_mmio_gem_destroy - Destroy the GEM object wrapping xe_mmio
> + * @gem: the GEM object to destroy
> + *
> + * This function releases resources associated with the GEM object
> +created by
> + * xe_mmio_gem_create().
> + *
> + * See: "Exposing MMIO regions to userspace"
> + */
> +void xe_mmio_gem_destroy(struct xe_mmio_gem *gem) {
> +	xe_mmio_gem_free(&gem->base);
> +}
> +
> +static int xe_mmio_gem_mmap(struct drm_gem_object *base, struct
> +vm_area_struct *vma) {
> +	struct xe_mmio_gem *obj =3D to_xe_mmio_gem(base);
> +	struct xe_mmio *mmio =3D &obj->mmio;
> +
> +	if (vma->vm_end - vma->vm_start !=3D base->size)
> +		return -EINVAL;
> +
> +	/*
> +	 * Set vm_pgoff (used as a fake buffer offset by DRM) to 0 and map
> the
> +	 * whole buffer from the start.
> +	 */
> +	vma->vm_pgoff =3D 0;

I am not sure, but is it confirmed this offset wont be used by anything els=
e?

> +	vma->vm_page_prot =3D pgprot_noncached(vma->vm_page_prot);
> +
> +	vm_flags_set(vma, VM_IO | VM_PFNMAP | VM_DONTEXPAND |
> VM_DONTDUMP |
> +		     VM_DONTCOPY | VM_NORESERVE);

Do you want to allow cow_mapping?

Tejas
> +
> +	return remap_pfn_range(vma, vma->vm_start,
> xe_mmio_phys_addr(mmio) >> PAGE_SHIFT,
> +			       base->size, vma->vm_page_prot); }
> diff --git a/drivers/gpu/drm/xe/xe_mmio.h b/drivers/gpu/drm/xe/xe_mmio.h
> index c151ba569003..2990bbcef24d 100644
> --- a/drivers/gpu/drm/xe/xe_mmio.h
> +++ b/drivers/gpu/drm/xe/xe_mmio.h
> @@ -8,6 +8,7 @@
>=20
>  #include "xe_gt_types.h"
>=20
> +struct drm_file;
>  struct xe_device;
>  struct xe_reg;
>=20
> @@ -42,4 +43,7 @@ static inline struct xe_mmio *xe_root_tile_mmio(struct
> xe_device *xe)
>  	return &xe->tiles[0].mmio;
>  }
>=20
> +struct xe_mmio_gem *xe_mmio_gem_create(struct xe_mmio *mmio, struct
> +drm_file *file); void xe_mmio_gem_destroy(struct xe_mmio_gem *gem);
> +
>  #endif
> --
> 2.43.0

