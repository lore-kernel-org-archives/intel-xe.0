Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1277CD358D6
	for <intel-xe@archiver.kernel.org>; Thu, 29 Jan 2026 16:55:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCE3410E298;
	Thu, 29 Jan 2026 16:55:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="L5CYsijN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A27C10E298
 for <intel-xe@lists.freedesktop.org>; Thu, 29 Jan 2026 16:55:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769705734; x=1801241734;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=2UmtWnjE22R1CSPASHSgfIaUo+pRngDlB0zpYWPFgaU=;
 b=L5CYsijN0UwS5T/UTBL7+KFNVhdJ+BZIztRePifxYKs/KxL+Y1LchokO
 LWzQ4fX5BvXOM6ZJoo9dVop++RcsDKd3XXurd1QGPAj5aFHRwljbhmsQF
 cL4YHe2pofuHq4PEukDMNFw9/SAMNhQhx5xgIDLMXAEWmpSfH/2iTSL9r
 3oP/RZVxSK8t1e87qqlYahs5j2uma0nt4zXFOzzQpm779UiOkuJHbc1o9
 48nicTqBWo49H+98sck89eMGWsVp5S7htOT5AK4uTZEd4O+lzQpu9VKxN
 sicG83AYK1+9En2oar26aWGE6J01WxZ6+GXnWj3AORksBlC3FBTO9j/NW g==;
X-CSE-ConnectionGUID: YhBDKCAmTAuXXlsZjq28uw==
X-CSE-MsgGUID: DRatq/+YS7ea6y5g8en6wg==
X-IronPort-AV: E=McAfee;i="6800,10657,11686"; a="82317469"
X-IronPort-AV: E=Sophos;i="6.21,261,1763452800"; d="scan'208";a="82317469"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2026 08:55:33 -0800
X-CSE-ConnectionGUID: EBeF061XQQW8KWFcpMNdEw==
X-CSE-MsgGUID: tJDjGRTwTsuSjXbtmc0Wow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,261,1763452800"; d="scan'208";a="213513142"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2026 08:55:33 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 29 Jan 2026 08:55:32 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Thu, 29 Jan 2026 08:55:32 -0800
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.1) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 29 Jan 2026 08:55:32 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PQAdMsUKtgAPDPWclvDzJwmleu31BWSap7X2zLjYyunxS9svtmEDYisTFkEe38yVIYRh1uUfGDafjojM/8PoobYFJ1DEqUcdt7LrZMPSozx7qNeIoxl1NIMrMvKXEoQoOw8tBj9Z5xVVjLQ68/NXwRE+ddQmq/nPOCno8gWYaP2Nc0zoM8V12zkFbjmHPZLPPR0IF36CmLMfQaGR0dZfzM8Qwkk89brKDc0qAwvDzyCiZ2KPSwTiS1kwWCFdL9QISvh/8Xvubw3Tsy3dBtpRLvKH0DOEoTpgbbJXBoSNqFC9CmwKuwkyUyyfsOQyLk7KdgvJnP9ErmKNLydtP07n9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xigd4LT35drXZRCFPb9N+woKE7mXBLlgObKwM6XX2Nc=;
 b=pgN5nQAG8bvJhNbwvftlDa4r2dkjsk0v+KHMNVUdjcjDJY67eUw3zqO8IXsr+t9qCUU2M4JdrStQQ3xGocW2OFTZopgzzFSZw6iU87eTCerFu4pkmlD4gFNy3+BN9Yh1P2oTl72DQ9wv2SnPB42ciXaEucpGdp1UTDbA6UGgqGNBUKBL+OEjeZkK1wurCtGoYowzYK1eDulZTpko0RE/if2Ohll9N4lraOTv9m1P95rIqIRMocJL8gAz1z01nd5DHLKR1JH8ITHfpuGWAWzUDUleubyLr2z9fGk+KyFRQRsnqZVF5QvPJ2BpgZVZGTNdrRN3rpf05IMaeJ84FwRjEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB5456.namprd11.prod.outlook.com (2603:10b6:5:39c::14)
 by DS0PR11MB8081.namprd11.prod.outlook.com (2603:10b6:8:15c::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.7; Thu, 29 Jan
 2026 16:55:25 +0000
Received: from DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::b23b:735f:b015:26ad]) by DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::b23b:735f:b015:26ad%5]) with mapi id 15.20.9564.006; Thu, 29 Jan 2026
 16:55:25 +0000
From: "Lin, Shuicheng" <shuicheng.lin@intel.com>
To: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, "Wajdeczko, Michal"
 <Michal.Wajdeczko@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: RE: [PATCH] drm/xe/pf: Fix typo in function kernel-doc
Thread-Topic: [PATCH] drm/xe/pf: Fix typo in function kernel-doc
Thread-Index: AQHcb2bnp9eArEXqKkCdhFr1pAWv9LUmFPaAgEOLsoA=
Date: Thu, 29 Jan 2026 16:55:25 +0000
Message-ID: <DM4PR11MB5456623FF9658D6D85BAC5DBEA9EA@DM4PR11MB5456.namprd11.prod.outlook.com>
References: <20251217150702.2669-1-michal.wajdeczko@intel.com>
 <aULnG7jGU0RwR0Hp@intel.com>
In-Reply-To: <aULnG7jGU0RwR0Hp@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB5456:EE_|DS0PR11MB8081:EE_
x-ms-office365-filtering-correlation-id: ea893b66-5530-4694-fc99-08de5f5732c1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700021;
x-microsoft-antispam-message-info: =?us-ascii?Q?RGNJlnD6l1rfyAsn0/pHHeyStJzCxCcjznrSU6PnNQaMzy+nqaz8SV6StKCx?=
 =?us-ascii?Q?GKakJ+XsAZcZWrVCV6FutOq/IlK3x1WKY6NB2Do/bjwDiyc5n14+SrmFt90u?=
 =?us-ascii?Q?fgATU7CRKvUrVgg1dm1wt7LcmgPIydkQIyXMVuu9o2xEIdoupqZJMoP9L17Z?=
 =?us-ascii?Q?3eHiNzg5u9aZzgPE82R96vGpmmHXSqzTLDxBQdeLnJvIOLvZYt+N6mYwFONS?=
 =?us-ascii?Q?YVGhOH58qYlgLExH8cCytG2MtoszaTFD0WKdndOh4PU0ofrB0gWHXTQ9+BGl?=
 =?us-ascii?Q?OXXzUa9IivEbzgZ6WXGnGsKD0iyAh3X1DjjlXGgQ8uIMl+SxluRUV9NLZisO?=
 =?us-ascii?Q?93s0YyfHWrFSiW80FwUeoUg1mVV+R5dMuQ70mPyVFi3R09hmBKIG35VKK+st?=
 =?us-ascii?Q?r4j9KQKdXP4r8Nt2VqLawygcZs4qCMeqO++3UUR7mtn4Y7lGr+/Q1MU558qP?=
 =?us-ascii?Q?UBAtRD6iO6DT7KZAM2HjiogFcV2URPZfuuYXwDxs9EWliN3pezWzFiXXmV/+?=
 =?us-ascii?Q?fd1CaAwFnjbWIPF8BzTlwYJDHfJ+QBA+Vg7kN8yszRSNDKy5XEJKFFe2rSpG?=
 =?us-ascii?Q?GVq5rVT/VLHFEiRBwqfuyItUk69ui8PGzfW33FOGk1Yki3mtwTuy1UeQG1EO?=
 =?us-ascii?Q?86EyjG+CBiyF0zHRbd3Bhtjf+lUn/mMP1K5IbeTI4mvU/1dUPKhnupki4EYH?=
 =?us-ascii?Q?4rJy4uoFYqU+kzgDA0emJiTARY3WqzmStRyOSYoPMRaducGTk0Lzm5AIG+7j?=
 =?us-ascii?Q?FKxdUtSCe3AeVYqgoWqZklOM+oMfMdti/cZTFE/zB+smNQPC50vGv0c/3NP/?=
 =?us-ascii?Q?9Mhp/jBYk5UkvX0FpPmILYlBBDNQD6d+OwCSk0eE14o2nRjeuGP3sXsFFKOb?=
 =?us-ascii?Q?HZp8xlKOAJJ6UnN4g/dPld1BX4Nq6pnEQDeVfH4d2hPHHruOArf6tsz8JjeN?=
 =?us-ascii?Q?0W+/ezpVV1kwVXgPZMS+3QtBfqe7cCzx8vLOC0Z97xNfcd7zWbtR/4EHGqMz?=
 =?us-ascii?Q?OUrrvkHKW1znJqxS4APeP3xPgDntcUte2FMYkFV81dqwN5NfUu3zQ4Um9QF4?=
 =?us-ascii?Q?Q5qLF9iQIz3GZMtDzvdlZoICj/aqblKQ0m7dpi5aSplUb+1R3XvAfoTvrixw?=
 =?us-ascii?Q?zN7ITFvwWbVkjTZNPngqjwrNKX4ym2FpZO95BBx/FvL2kKVDBS4ocAlfow8g?=
 =?us-ascii?Q?0mt1muiblDPZ2r6Jf/5RUlJl32Kp4axdzkrUSI+g+1Mxt8TArM/9/XfntU3x?=
 =?us-ascii?Q?FNZosKhhmPGeFWxxscft9PRZ7bVmzpTDYNhTizpLvfaY1Zo0edbYoabsKZQv?=
 =?us-ascii?Q?oO4r8ycMKI8k9hh09XmdD4i/ViFl71MsNq8s+5CkUx06ZbADXlf/wa4efcRr?=
 =?us-ascii?Q?zYt/pl6fqsUHW80cPnxxcFmptaPlm12YRDvohPKp/KZyMQRU/pyMkHjM5cXp?=
 =?us-ascii?Q?BuhKyKSLXXyHoiYU3BhQ5u7M5oZl1nngw29ryG5hRs0FfvB0naqxw0/ScupY?=
 =?us-ascii?Q?efYZHOj6TB6EbEsU+ve8QUP2tg6Fk8VJtwi+UcFoGIdDb9Si0vIErvcQQ8p4?=
 =?us-ascii?Q?BTnb41/to9jMcjoTlVoPEB0dT+wRTvm5JZTlTbOD1RvMrN/P+gQnHUsAUk05?=
 =?us-ascii?Q?RNqyll7+P07DwjRJvzyU7yU=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5456.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?deqUMptTV9WJUrjPqVmX/aFFVz+BT7G2k16A2dN9EyqJzLI32hKB71w3ZOrQ?=
 =?us-ascii?Q?vKg32pPE9r8QAvZVIBOxSTuSYMX7OPbb82ty3Gs01RgGwxL2Nm0cx4CRonOP?=
 =?us-ascii?Q?9PyVTIjZwvdUMWMBekELzoC/TrZB4WeyVAu1s0IuxDdgi3d8bIDLh9XsNwBH?=
 =?us-ascii?Q?Q3mbSAhaC6ESsx5rk1hNWTXqEA6LX5xDnlDs9huw4dRckCI7TLNHFXUJqtvI?=
 =?us-ascii?Q?7kLS6HQiA4d3S4wXWzIiCxEcTvlPhEfxkxqFwrLrkkWtPCuSErrSOhnIw36s?=
 =?us-ascii?Q?XzQ0dX3WKjzvNAMdBzyg0uSTZXu4ggM1xgamKdNHLRUVr+48yoZpvErQgMwJ?=
 =?us-ascii?Q?TVWPtG3QWv5ABceAup33NwGoh65LbQMxdjkz7VvRe8Wd7eOGnGeVEM5gr06K?=
 =?us-ascii?Q?1POhGbyE1MUW2ogsgcgEMRH6tLXGhr1u+24NeY7DQrTe87t/N0WpifnsaOG6?=
 =?us-ascii?Q?CIbGVMlNFu0nL7mm9k6pEgHDVfO9cJyiubSQVgHwr07yEXCivIWH1dyhzch+?=
 =?us-ascii?Q?kH2OOL3A1pkcpZSG5d5e55wCQfNEkWqo5Rm87YJAIEQbvbnWejF+MDefEfbP?=
 =?us-ascii?Q?K+E5IZeE/CbtDWhH7QZARmFzYzFTIUWjzJgWRUdf2FLdwVwbLUknv+cswZn7?=
 =?us-ascii?Q?ZplqLNNjHRbPxijFG2nGG27d4TLXmUfsMB9ks/H21DIszMVtXOYq3QLksP53?=
 =?us-ascii?Q?g8wFEazpRJ6SZLG1NJxFpgZ3vgUKKCqc5Mem8naLYhs5tObTPRhWN1mLBU03?=
 =?us-ascii?Q?iNk6ld6sdkicFeZih4vtCnNv/Z+klEArnnWzi7RF0p7Kqi1oNe64Xi4Y5xn5?=
 =?us-ascii?Q?2aQxwAEpwQfLbpQrBOByLLcdBqUSN/VUSCqamEds1tbz0iHDPlBH/HJXahS2?=
 =?us-ascii?Q?Pvo31BAUD8PHJduFmfmhMQOARZNX0Y1q4MADekvHsub1CMNWszoSZlPCCDuz?=
 =?us-ascii?Q?0nZpMY8Q7LUDksYzuKP+uJRCk3dSOoWkaejY/j7TaIM7O3XePulxRFNOXO2B?=
 =?us-ascii?Q?r3JgCQBZnaWQFGNdEad/+027mBU9EQsbal2j2FSvN4r1CQKqXLD5LsCO7E2f?=
 =?us-ascii?Q?GD4/zgzduWYH+OeI9EbPoqo638QT6AzPOsyY63ET+3GwIEIG8b0TEZHZUoW7?=
 =?us-ascii?Q?yCb0QpK7eb+PZ9AjS4GM5wXuNJoHRU/eX+/7XyT9IOqZ/DBhIDRhl+j6HhEH?=
 =?us-ascii?Q?ZlHpOsCQFgNgHkr24hHSmL2uON3p+weoJzHnfGs7uKVHPbFLhQxL/1zWNo8o?=
 =?us-ascii?Q?HvkAvw03qPi+8rAEuwQxwy3elSgNcxFgShkcYH48cBJAWI96ly1+7dM+7Qaz?=
 =?us-ascii?Q?2gNf9YbY2Wz4DKZEQP9d6nl+8nTigz0tvk/1tcfW62vokS7lheYPlF4NFU1l?=
 =?us-ascii?Q?t3EBpQ6wYjs5Zdwmx7RTvrxFT7CY9o5i1W7cdaAebWX9gOXMa4dYSdS0qa9b?=
 =?us-ascii?Q?+XrVy8st8t+p7KsvbQyVdea2VRC4khUN3fiT26GmZENJ0Jz77/sa02ohdG7C?=
 =?us-ascii?Q?71viHRAio6SsK7bA8JhLZw1auRNhkgP/9IUUIm3qbi0sR2yo/ZtuMs54TvNy?=
 =?us-ascii?Q?HnOxfBx0/2EMY01w2l8FK5imhoHOgtByCqHcu/SeHOo8yAtS/PdO+hsHr5ii?=
 =?us-ascii?Q?CgA5lH6QxPXzetSl8F6/hE1Imz8aBFCRESpAf9a/jvB0+NtOr8RXjyjhluCi?=
 =?us-ascii?Q?guzFJnSlkzUWfTANMBuVl01E4rr/x46YcH58t72xWGIV0TRmstrRdtxvItA3?=
 =?us-ascii?Q?5MvLWK4xuw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5456.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ea893b66-5530-4694-fc99-08de5f5732c1
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jan 2026 16:55:25.0979 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ohNfEQUgJm7G3bI7MvfcT1BufNhuvytk3GgVSgPQJQCmJ4LP8G+h64TpZTTHf2ee/63eMtEkfyPocQJAg8/e4A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8081
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

On Wed, Dec 17, 2025 9:24 AM Rodrigo Vivi wrote:
> On Wed, Dec 17, 2025 at 04:07:02PM +0100, Michal Wajdeczko wrote:
> > The function name is missing an underscore, which results in:
>=20
> I'm glad you wrote this. I was looking to the patch first without been ab=
le to
> spot the difference! o.O
>=20
> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

It seems this patch is missed to be merged. I don't see it in the latest xe=
 kernel.
LGTM.
Reviewed-by: Shuicheng Lin <shuicheng.lin@intel.com>

>=20
> >
> >   Warning: ../drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c:1261
> >   This comment starts with '/**', but isn't a kernel-doc comment.
> >   Refer to Documentation/doc-guide/kernel-doc.rst
> >   * xe_gt_sriov_pf_control_trigger restore_vf() - Start ...
> >
> > Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
> > b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
> > index bf48b05797de..5cb705c7ee7a 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
> > +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
> > @@ -1259,7 +1259,7 @@ int
> > xe_gt_sriov_pf_control_process_restore_data(struct xe_gt *gt, unsigned
> > int v  }
> >
> >  /**
> > - * xe_gt_sriov_pf_control_trigger restore_vf() - Start an SR-IOV VF
> migration data restore sequence.
> > + * xe_gt_sriov_pf_control_trigger_restore_vf() - Start an SR-IOV VF
> migration data restore sequence.
> >   * @gt: the &xe_gt
> >   * @vfid: the VF identifier
> >   *
> > --
> > 2.47.1
> >
