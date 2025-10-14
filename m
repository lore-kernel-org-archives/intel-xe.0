Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EB39CCD192
	for <intel-xe@archiver.kernel.org>; Tue, 14 Oct 2025 14:03:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B74810E617;
	Tue, 14 Oct 2025 14:03:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VZVlhODl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5B6B10E5EA;
 Tue, 14 Oct 2025 14:03:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760450627; x=1791986627;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=3SFGuaBsId2bNYOk67ji4Fv1/J1ZCW0Rw5BwjyjjUik=;
 b=VZVlhODlXHJPbtcx4RJ+t0CZrjYR3oowiNPxHcQEohgU+M/JlvFNR+8H
 wx4BCvhG01KeVKdfsdTsPK4qEDPl4ngqnQm7ee662Oe5FDD35pOZhYFue
 sU2R5Ypj4NLz2J8XkPTnZF1s/KaNH0dTo2HoIDXX7iVRDk/FVXmxYrCIT
 YOPtHXa+HsVBdAukYZrEbt6RT02PxOlig2XUsSaUydYmzIBV1SN6rclEA
 jhHOvJhOSHTTqsDtlBeaGioV938gsUNtaO+LgfRdXehJli+jT8zdLnasT
 90V+oxtP7r2HpSYE7EXBELdK6yPULaNyv06d5VRkptFDVomfozgRQO7ZS A==;
X-CSE-ConnectionGUID: D3d5dqXwR9mSVvce7xxPNA==
X-CSE-MsgGUID: m2gnF3CvTHmdIquCVstyjg==
X-IronPort-AV: E=McAfee;i="6800,10657,11582"; a="73711107"
X-IronPort-AV: E=Sophos;i="6.19,228,1754982000"; d="scan'208";a="73711107"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2025 07:03:47 -0700
X-CSE-ConnectionGUID: vc8YZR/iTDatXDC+MwjyTw==
X-CSE-MsgGUID: 7Q8dgfYBQWOkTHOjRjK+jg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,228,1754982000"; d="scan'208";a="186986963"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2025 07:03:48 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 14 Oct 2025 07:03:46 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 14 Oct 2025 07:03:46 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.53) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 14 Oct 2025 07:03:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mtA42xueHB+p3gxmsLLgYgotTaEAEhh7TaOlk42I6zjzc39+CXuf/CpS/ErYeElAXfS1md9VvqKoKXgrZQRjPxbR6Dpo1vPsqak3r2Q0l/3EZiw8bwazJ6rRii2AVoe7Pnfuck7Xq0n2iy9ZDAeScd1G2u/aY2iiLO/Tq+9sXefzVqifse16vP+FWPgNp6JvVADJ+D7cc9cuUWSLFIDVNwbk1hPu26KCLouzR3ANtPkdP1kGCHFskue8MgUkNpvL2+aWuKuK9qdBJwETQ0TUSCTKAOf5w5m3WM+U4pg+7WI8D4wd+i21HhDFSa1iexsNqRtT2FGJ4rrjcE9+6rJ4JA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KZkOetrEqzGXI1uY2Ltv4gIoEGbVvKfrZT3OPhczQRM=;
 b=boYCOazXF80ECNpf8UH4BsqWP8GrTqIu3SmeMYjj8ehV1opONJzkcLiua9rA/Cv5y0aHol4r93akkBvqas8eeMcMZu6jkfmOIRLvsiRAXVSPKB/CMquSZOkvrFbLxZtMeR3d6JA47C/WzM0OxF6Ajg7rdRd1TMis8vHP+EkyqbYW/akUQDaYMMPTEkx0eqZer6p77fsX8+Q6iqJSTJ1kwP+zZEo+9VownHFrN1QQsVyCnYBuroJZY63lUnBgCwCSyO54VCh9ah3d1Ww9kV1PtGE9oaewMSEA63o670XhC/pEBuVIVbxgu3QbEz9CScsbsUqDzTMnho7omloPM1V3gg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH3PR11MB8434.namprd11.prod.outlook.com (2603:10b6:610:176::19)
 by CO1PR11MB4818.namprd11.prod.outlook.com (2603:10b6:303:93::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.13; Tue, 14 Oct
 2025 14:03:39 +0000
Received: from CH3PR11MB8434.namprd11.prod.outlook.com
 ([fe80::1670:23da:3abe:c525]) by CH3PR11MB8434.namprd11.prod.outlook.com
 ([fe80::1670:23da:3abe:c525%4]) with mapi id 15.20.9228.005; Tue, 14 Oct 2025
 14:03:39 +0000
From: "Dandamudi, Priyanka" <priyanka.dandamudi@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Wajdeczko, Michal" <Michal.Wajdeczko@intel.com>, "Lis, Tomasz"
 <tomasz.lis@intel.com>, "Summers, Stuart" <stuart.summers@intel.com>
Subject: RE: [PATCH] tests/intel/xe_exec_compute_mode: Remove non-block section
Thread-Topic: [PATCH] tests/intel/xe_exec_compute_mode: Remove non-block
 section
Thread-Index: AQHcDZIUOsvG1ggVzUyz8/qLFFc3p7TCCtLAgAAAirCAAAAWQA==
Date: Tue, 14 Oct 2025 14:03:39 +0000
Message-ID: <CH3PR11MB8434B9B20EB4F656E1F8B15E8DEBA@CH3PR11MB8434.namprd11.prod.outlook.com>
References: <20250815030936.2387322-1-matthew.brost@intel.com>
 <CH3PR11MB84348297B0CE882D299660C68DEBA@CH3PR11MB8434.namprd11.prod.outlook.com>
 <CH3PR11MB8434CFBD44BD935E41889A958DEBA@CH3PR11MB8434.namprd11.prod.outlook.com>
In-Reply-To: <CH3PR11MB8434CFBD44BD935E41889A958DEBA@CH3PR11MB8434.namprd11.prod.outlook.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR11MB8434:EE_|CO1PR11MB4818:EE_
x-ms-office365-filtering-correlation-id: a6fdb0f4-160b-4fef-0bf6-08de0b2a79cc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|10070799003|7053199007|38070700021; 
x-microsoft-antispam-message-info: =?us-ascii?Q?VKsUeZAtnY38mUMtlIg/X4YMUwGDPncnEjpDbkAjrliA41XJX/hu6kCRlZOa?=
 =?us-ascii?Q?aQy29NDrUqaO9xbGrIg0dDrl7h8T7kuIQIO/X4YxEF372dzyTd7p+mEsdOnV?=
 =?us-ascii?Q?gJD+Dk/m3Te4ol62GyRIFGh048MN+TvvIOB6ijxpY8zbXtP1Exg62yCupSoG?=
 =?us-ascii?Q?U82BLUppEQEdB/yEaQm0jA7iRKPdqz6urnN0RDErs1A8Wlul59VT6FZslcLm?=
 =?us-ascii?Q?FoqhdBDjn3K0hnKsSNFzF2g0U75bkBFaNm9A5Drdi1aMNdT46qOJYJHr7M4t?=
 =?us-ascii?Q?zFEc+87u5uVepLCrBYnAiZM0FbFLQE52+5WiKGy4iMr6QdOqdNIajoabPZDs?=
 =?us-ascii?Q?B6tBa6WXNRrL0gcJiwKQO4SvV5rhccRoiyKfHbZfZtjUv76Xgg+0cvIlPxiH?=
 =?us-ascii?Q?svB4cB41iSwvf7WYrurL8L/ZZEPQ7+yGItnZcryXYKfEs1gE5pox9S/dKsii?=
 =?us-ascii?Q?C8lXe0VL2vIsGkAbyHULeW2j1zLQyLn1BYYyHjKO6STh9orJzQN35xcGH+LD?=
 =?us-ascii?Q?i+acgDs8l9PbGCoJG2p9+9zefwKz/lqJX0298Gt9sZHpGbSj5+QOgTATAqs8?=
 =?us-ascii?Q?JM+pwhJd3Z5i5zdkW3jYs8EMwdXGWGVTMcTtsgo/sB2OSTWEtbvmbtNNVFgY?=
 =?us-ascii?Q?hgYbTZVy4YL01GiF1OwQQ+AnKXiCwJbliceEkkWog7rEleWE/Onn2oOTsMGg?=
 =?us-ascii?Q?jeY19cPsut2c9yw2Gd7ghWT8srnJUv273xGQzh25fvNviXaW9cl+FGTZNDMs?=
 =?us-ascii?Q?j8tZmd4JvFzkB9zv9fpaTUNaGdrearsFgd/c2CMsOznKt0Tl9QpTypE5qRai?=
 =?us-ascii?Q?gciDQQh7gAIajPXDKv6yfGsK4iVdNue+fbaA8E7SbSDC8ot8eYvBF6o+gP7M?=
 =?us-ascii?Q?P5GxvOUAn6oIG5LrFwUW4AzicZrrxppUaCiV/Hse4k++TATE/85NmpnKxli/?=
 =?us-ascii?Q?uW6MYcnfajFYlt7vdA57TlVgb1LpLc031NFMkGefQlLC58aANDh5TlLLOK0h?=
 =?us-ascii?Q?1zXe+oaAGSFaqSMC7HCeZoGQLPlXhHoVAmKHhuyuKsUrg5+KPBebAAXsdVXl?=
 =?us-ascii?Q?6N458mJI7ab7xt6dPsFs6wNK/VPxkxUMp6fqdvAGVFwxTgUdvlsb9XBXWoPp?=
 =?us-ascii?Q?vBOfSXuA6UWS+RC4p2PL5ZAiDxNnTVT4TWP8ifXC2XZWxPLF/3Tun9NpFZ3X?=
 =?us-ascii?Q?5Pn2PEfKE7obywFsBsQZxHfahoby3pye5EJLEYGRCv9NW+7Z+UMBLxi7i1nA?=
 =?us-ascii?Q?R3zj3qGH9AZYF8fIuiSBwtpDlH/zL6cNkVqmEq0VBJO3Y8A/z1OGlV2WgSHD?=
 =?us-ascii?Q?gnbfBgaIwFFI2qAT6BxsgT9pe69MOAxy0w6I6NKXQ1J6+BVqCKwF6S9k3lUf?=
 =?us-ascii?Q?6sHrz/FUR8Ow3ULCogr2t4jzt/Vk9uyNXH6RRPFmGbSQqD1W3ogmVDEnqAn0?=
 =?us-ascii?Q?3dC1cOSLSwkodLpqjdk3nlCfqEa3ngJeyQlV2lUR+wZdJ0p7CvbE7lFjhjcg?=
 =?us-ascii?Q?Rb97cfidf26QHTxQ+U/ZbkYF3pbze1dvVHQ2?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8434.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(10070799003)(7053199007)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?xIXvnJRGLktBF6TqtDGBxhaSeURykETKD5Cy0oxU/MtuwJSuZU4KwegRRx8+?=
 =?us-ascii?Q?HAROm7g2ZB2q+9ODKWr72QIvtrlIa0RGrUZl9+AGqXsnVSW6CMrYWkPbnhL2?=
 =?us-ascii?Q?Sv+38wcCEE3ZPoO+0Vz3pRLPzxXaA/eK3exE1uJI3vziJmjZFjcpv0sJrfA0?=
 =?us-ascii?Q?JiEAocpeHs879S7nCg6af6KZo6W2cxi3VVE1PeI6h77JQAmr1EROBfxYlPly?=
 =?us-ascii?Q?WuCk3LqHpbRvpqE2QAFyqZDlrSq0spejfLlg0VUn+ECDdRuekNKYzNEIKHtf?=
 =?us-ascii?Q?v/EssYa7SHX9YDspyiFxPO64WTqUQUgjZaJCCGfQ+95tm53eYE2TS2dcC0v+?=
 =?us-ascii?Q?YbPsj4aB1YbQ/Nc+arfAv2F5dQ+TbkatWakG76Wwljf0qFR7N3AXO9sVmRil?=
 =?us-ascii?Q?NkTdChsFHIrKtRFNE4IJJotsZmGEzwEVMQCKpsCEg7rHDvUmksjz4CTXI7n7?=
 =?us-ascii?Q?XUZvrUfYCu3PgK6vv4pERsUP4kva2UkovbiEoSyhjqdiaSLbJmL4RmggVbL7?=
 =?us-ascii?Q?PDTkYUH9HyPeez92wkPt/pDkvmTBqRioO0WpIQedJ93qWHxP3ReGkqGrlQFf?=
 =?us-ascii?Q?hqY09/euz1lHk7wkvpFIdabpmEyW0K5Sgf9EDh1Y2GK87iSpyLP/xVhmBN6Q?=
 =?us-ascii?Q?1D0xkhD7CUT8Tgnwlc+8W008etxFb9DoYLWX9g1Q4xg12pFsQGXugOZjzFcD?=
 =?us-ascii?Q?erm4pMADulK2Mpt9ljmr0GZC9e3vHzFhwYk5KaFFGplZsTLTnvTBuygGSyju?=
 =?us-ascii?Q?ZIkIoPYIyCT0a0/iVIGf7Zf7xhS60C4lR1h81CdFldiPZvXTWWKvEIy1ugcH?=
 =?us-ascii?Q?KE7mOYglVCQDR4D94sSZEeErlRYL0vJbXk94Y0yMsOtklCKIStnheI070tdo?=
 =?us-ascii?Q?kAf1qOTbT3NeyX/zug69PCB8fkH/4ON+kOVDzcLK881aT79Hgw1RUqODvNg9?=
 =?us-ascii?Q?/JOH8oCVQQbsUSQFP9mhIk1BxjffvbrLrY0jvv6Q/sTgme5y1ik1E2PzoUBo?=
 =?us-ascii?Q?nbh6IVHntaJy6nhnlCJOQ0KtTybsnwQa3/Z+b1Z0ctcIsjA4kdyKLAPkDRs8?=
 =?us-ascii?Q?Cz8tZCXxSSXR6xZFWnu23wQlzCaLa483iEFXRFNIt3FfUOSpDXLNmh/XCF3X?=
 =?us-ascii?Q?xluS3LAPgVlf7WxqjyFeZPS4yK927rQTHlkhHNSWIZBThmL3IW0wxCqX4fqQ?=
 =?us-ascii?Q?W2DNxeUeZjAdw0XfVNJ3kN6Sgx95mR5S1E9RnzMMG1xxNzDtydq5YVaoaJAP?=
 =?us-ascii?Q?w4EMGn+V9oP0nJ42cN9Y42wQTPbyQJsQ1xtDWoSQjjt3kAunfAMZJ1QDZCzg?=
 =?us-ascii?Q?LzndHt9o94758KTMiIvuZ4gzmnW5vaNJJ21woZZbZ4C5RBRSa8fwrG3SbiVY?=
 =?us-ascii?Q?Vuh421O+rJI/0BcR+TJH9aXUnlZBcz+gwPdxRaGbt7ay1rVAt2WxPLfayZ3F?=
 =?us-ascii?Q?CtQ/X/6k2Om0P/KC3UkFv/x0kTVtdOxKU/Jq2/N7QzWuzou1LiwKrBcqxUFq?=
 =?us-ascii?Q?zMcqYuzWGEveQE5iCHQ9tgcganXrRz+h9SKf+disoIYFzUHvIrwIZvNlhHgR?=
 =?us-ascii?Q?Mh/vnqCOSviiSFgvsmwuQmVp1cIykAfmzrrzbUKk55Q0SYzdD6XDeFRv4hCj?=
 =?us-ascii?Q?uYSVNs7/4kSpmQxObBLTK1skNHSlGs+/KXCPf6RF47k8YGRxRZl5Hyt1nm7D?=
 =?us-ascii?Q?Y/Sjfw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8434.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a6fdb0f4-160b-4fef-0bf6-08de0b2a79cc
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Oct 2025 14:03:39.2963 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vG+0IFPEZoT2zbmMhd6kl6jnAdHFHmp4LUxOB3onag/FzOBeFDzgHFxHWptRlue0dLJG4pH42B2yVjMKyBlYIGlBMiRcIbsSDd+ieQ+jNEg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4818
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
> From: Dandamudi, Priyanka
> Sent: 14 October 2025 07:33 PM
> To: 'Matthew Brost' <matthew.brost@intel.com>; 'intel-
> xe@lists.freedesktop.org' <intel-xe@lists.freedesktop.org>; igt-
> dev@lists.freedesktop.org
> Cc: Wajdeczko, Michal <Michal.Wajdeczko@intel.com>; Lis, Tomasz
> <tomasz.lis@intel.com>; Summers, Stuart <stuart.summers@intel.com>
> Subject: RE: [PATCH] tests/intel/xe_exec_compute_mode: Remove non-block
> section
>=20
>=20
>=20
> > -----Original Message-----
> > From: Dandamudi, Priyanka
> > Sent: 14 October 2025 07:32 PM
> > To: 'Matthew Brost' <matthew.brost@intel.com>; intel-
> > xe@lists.freedesktop.org
> > Cc: Wajdeczko, Michal <Michal.Wajdeczko@intel.com>; Lis, Tomasz
> > <tomasz.lis@intel.com>; Summers, Stuart <stuart.summers@intel.com>
> > Subject: RE: [PATCH] tests/intel/xe_exec_compute_mode: Remove
> > non-block section
> >
> >
> >
> > > -----Original Message-----
> > > From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of
> > > Matthew Brost
> > > Sent: 15 August 2025 08:40 AM
> > > To: intel-xe@lists.freedesktop.org
> > > Cc: Wajdeczko, Michal <Michal.Wajdeczko@intel.com>; Lis, Tomasz
> > > <tomasz.lis@intel.com>; Summers, Stuart <stuart.summers@intel.com>
> > > Subject: [PATCH] tests/intel/xe_exec_compute_mode: Remove non-block
> > > section
> > >
> > > The non-block will become invalid and hang until the test exhausts
> > > all memory when LR jobs are tracked in the DRM scheduler.
> > >
> > > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > > ---
> > >  tests/intel/xe_exec_compute_mode.c | 113
> > > -----------------------------
> > >  1 file changed, 113 deletions(-)
> > >
> > > diff --git a/tests/intel/xe_exec_compute_mode.c
> > > b/tests/intel/xe_exec_compute_mode.c
> > > index b904dc76b4..316f7322c1 100644
> > > --- a/tests/intel/xe_exec_compute_mode.c
> > > +++ b/tests/intel/xe_exec_compute_mode.c
> > > @@ -320,116 +320,6 @@ test_exec(int fd, struct
> > > drm_xe_engine_class_instance *eci,
> > >  		close(map_fd);
> > >  }
> > >
> > > -/**
> > > - * SUBTEST: non-blocking
> > > - * Description: Fill the ring and check we get expected errors.
> > > - * Test category: functionality test
> > > - */
> > > -#define VM_DATA		0
> > > -#define SPIN_DATA	1
> > > -#define EXEC_DATA	2
> > > -#define DATA_COUNT	3
> > > -static void non_block(int fd, int expect) -{
> > > -	uint64_t addr =3D 0x1a0000;
> > > -	struct drm_xe_sync sync[1] =3D {
> > > -		{ .type =3D DRM_XE_SYNC_TYPE_USER_FENCE,
> > > -		  .flags =3D DRM_XE_SYNC_FLAG_SIGNAL,
> > > -		  .timeline_value =3D USER_FENCE_VALUE},
> > > -	};
> > > -	struct drm_xe_exec exec =3D {
> > > -		.num_batch_buffer =3D 1,
> > > -		.num_syncs =3D 1,
> > > -		.syncs =3D to_user_pointer(&sync),
> > > -	};
> > > -	struct {
> > > -		struct xe_spin spin;
> > > -		uint32_t batch[16];
> > > -		uint64_t vm_sync;
> > > -		uint32_t data;
> > > -		uint64_t exec_sync;
> > > -	} *data =3D NULL;
> > > -	struct xe_spin_opts spin_opts =3D { .preempt =3D false };
> > > -	struct drm_xe_engine *engine;
> > > -	uint64_t batch_offset =3D (char *)&data[EXEC_DATA].batch - (char
> > > *)data;
> > > -	uint64_t batch_addr =3D addr + batch_offset;
> > > -	uint64_t sdi_offset =3D (char *)&data[EXEC_DATA].data - (char *)dat=
a;
> > > -	uint64_t sdi_addr =3D addr + sdi_offset;
> > > -	size_t bo_size;
> > > -	uint32_t vm;
> > > -	uint32_t exec_queue;
> > > -	int value =3D 0x123456;
> > > -	uint32_t bo =3D 0;
> > > -	int b, err;
> > > -
> > > -	vm =3D xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_LR_MODE, 0);
> > > -	bo_size =3D sizeof(*data) * DATA_COUNT;
> > > -	bo_size =3D xe_bb_size(fd, bo_size);
> > > -
> > > -	engine =3D xe_engine(fd, 1);
> > > -	bo =3D xe_bo_create(fd, vm, bo_size, vram_if_possible(fd, engine-
> > > >instance.gt_id),
> > > -
> > > DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
> > > -
> > > -	data =3D xe_bo_map(fd, bo, bo_size);
> > > -	memset(data, 0, bo_size);
> > > -	exec_queue =3D xe_exec_queue_create(fd, vm, &engine->instance, 0);
> > > -
> > > -	sync[0].addr =3D to_user_pointer(&data[VM_DATA].vm_sync);
> > > -	xe_vm_bind_async(fd, vm, engine->instance.gt_id, bo, 0,
> > > -			       addr, bo_size, sync, 1);
> > > -	xe_wait_ufence(fd, &data[VM_DATA].vm_sync, USER_FENCE_VALUE,
> > > 0, NSEC_PER_SEC);
> > > -	data[VM_DATA].vm_sync =3D 0;
> > > -
> > > -	spin_opts.addr =3D addr + (char *)&data[SPIN_DATA].spin - (char
> > > *)data;
> > > -	xe_spin_init(&data[SPIN_DATA].spin, &spin_opts);
> > > -	sync[0].addr =3D addr + (char *)&data[SPIN_DATA].exec_sync - (char
> > > *)data;
> > > -	exec.exec_queue_id =3D exec_queue;
> > > -	exec.address =3D spin_opts.addr;
> > > -	xe_exec(fd, &exec);
> > > -	xe_spin_wait_started(&data[SPIN_DATA].spin);
> > > -
> > > -	b =3D 0;
> > > -	data[EXEC_DATA].batch[b++] =3D MI_STORE_DWORD_IMM_GEN4;
> > > -	data[EXEC_DATA].batch[b++] =3D sdi_addr;
> > > -	data[EXEC_DATA].batch[b++] =3D sdi_addr >> 32;
> > > -	data[EXEC_DATA].batch[b++] =3D value;
> > > -	data[EXEC_DATA].batch[b++] =3D MI_BATCH_BUFFER_END;
> > > -	igt_assert(b <=3D ARRAY_SIZE(data[EXEC_DATA].batch));
> > > -
> > > -	sync[0].addr =3D addr + (char *)&data[EXEC_DATA].exec_sync - (char
> > > *)data;
> > > -	exec.num_syncs =3D 0;
> > > -	exec.exec_queue_id =3D exec_queue;
> > > -	exec.address =3D batch_addr;
> > > -
> > > -	while (1) {
> > > -
> > > -		err =3D ioctl(fd, DRM_IOCTL_XE_EXEC, &exec);
> > > -
> > > -		if (err =3D=3D -1 && errno =3D=3D EWOULDBLOCK)
> > > -			break;
> > > -
> > > -		igt_assert_eq(err, 0);
> > > -	}
> > > -	igt_assert_eq(errno, expect);
> > > -
> > > -	xe_spin_end(&data[SPIN_DATA].spin);
> > > -	xe_wait_ufence(fd, &data[SPIN_DATA].exec_sync,
> > > USER_FENCE_VALUE, 0, NSEC_PER_SEC);
> > > -	usleep(50000);
> > > -
> > > -	exec.num_syncs =3D 1;
> > > -	xe_exec(fd, &exec);
> > > -	xe_wait_ufence(fd, &data[EXEC_DATA].exec_sync,
> > > USER_FENCE_VALUE, 0, NSEC_PER_SEC);
> > > -
> > > -	sync[0].addr =3D to_user_pointer(&data[VM_DATA].vm_sync);
> > > -	xe_vm_unbind_async(fd, vm, 0, 0, addr, bo_size, sync, 1);
> > > -	xe_wait_ufence(fd, &data[VM_DATA].vm_sync, USER_FENCE_VALUE,
> > > 0, NSEC_PER_SEC);
> > > -	munmap(data, bo_size);
> > > -	gem_close(fd, bo);
> > > -
> > > -	xe_exec_queue_destroy(fd, exec_queue);
> > > -	xe_vm_destroy(fd, vm);
> > > -}
> > > -
> > >  #define LR_SPINNER_TIME 30
> > >  /**
> > >   * SUBTEST: lr-mode-workload
> > > @@ -570,9 +460,6 @@ igt_main
> > >  					  s->flags);
> > >  	}
> > >
> > > -	igt_subtest("non-blocking")
> > > -		non_block(fd, EWOULDBLOCK);
> > > -
> > >  	igt_subtest("lr-mode-workload")
> > >  		lr_mode_workload(fd);
> > >
> >=20
LGTM,
 Reviewed-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
> > > --
> > > 2.34.1

