Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCA69C531DC
	for <intel-xe@archiver.kernel.org>; Tue, 20 Aug 2024 20:25:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8727010E295;
	Tue, 20 Aug 2024 20:25:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="botr33oE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08B1810E295
 for <intel-xe@lists.freedesktop.org>; Tue, 20 Aug 2024 20:25:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724185557; x=1755721557;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=7NqO29wmwPFzQD3EWMQ8R9S65yF5Edw1BEhvvGQxMIA=;
 b=botr33oEEtP8BhDl6rJFX90EHdNV10W64KYDmH00XPb1g6jLNWv5dcJ/
 2q6TiMpqL4InQVvj9f0ijECeL3FVuTycCHwKvvlLXThdbmkTq4OA3PdNB
 q27rDibustiQF5hYPLtLHdAJkneAaVr8ptt8oA6TqLGGwwy35zVpRMjI0
 anNdxkDEkdG3yeWt1xTRCQeqeJs0pbSh4a9hhHaYd3SRUKzZtIln6qom8
 ESnF/8eIIyL6Vvm4Pcd7RJfkNVEtrRisF39SNBBSZiDmaakEjpUiMW2Nd
 VNrrWkm8Ipjk+xKo6pRomW1dUjQ2IjFcI12u/VVB02OYidu/kMME8jBXM A==;
X-CSE-ConnectionGUID: DYE0ITArSQqUqRO/emAClA==
X-CSE-MsgGUID: Pv4r1vfmSpuU4ySsfI9Jlw==
X-IronPort-AV: E=McAfee;i="6700,10204,11170"; a="25413529"
X-IronPort-AV: E=Sophos;i="6.10,162,1719903600"; d="scan'208";a="25413529"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2024 13:25:56 -0700
X-CSE-ConnectionGUID: 27fLidc1Rz6jdLtTt5oPTw==
X-CSE-MsgGUID: z8zGYRd9SBOwRCb/FiSiDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,162,1719903600"; d="scan'208";a="65809626"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Aug 2024 13:25:56 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 20 Aug 2024 13:25:55 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 20 Aug 2024 13:25:55 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 20 Aug 2024 13:25:55 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.172)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 20 Aug 2024 13:25:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yKqPK9uMPYypRdUbdmhT/mjaxLljX61bxEmtIoLapPvu+ibRtJM5KGaaaX+ImgkM1l3l2JZcsXJ7xE65meRJZE3S3Pz800h2stNp4kCd4r0vGpcovFLwVSXYM50qzGC8I6O7LkIdCQH2CZxrafG2/awbF4ClnETOLH9eVnzkOQSyhwxyUc7EEV1740rKDHeVQtc5TWrizmLxVtiHcAYgY+B36iKTl+gIy4RVRfQ9XB02IqTd3yMirHpXBCaF9lCL6dKN+FkdtugfMptmLulKLABZ3Jwz6xf45S0Dh1lALpwtgQ1g8cHIbOEP4RtCs/1dK6YaaK208iXOTkdp7m+Z8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nPGGF6cOSh5MufufwMWlimDzt13nY6gMjMaiD/7Fzfw=;
 b=upCNBUmojh19pqfsVetFkiMap/ACSxI2z4qfS4HT4A/9RAPMLNbaTExIOW1adyiqsZpoQe4UaNw+nrvw5rsDKXuDE9JcRCfpURHy4IcjyGB58cY5m+W0ouyB58XUJHA1zXhl3WznWkwVE2GWeU5Ic14JgoWKCyOZ/RkpCcep0IOBU7hky/C8Xhm+IWXAsCZH/ZL6rJna3EKLuuV7LhRO6I1D8cjXTlQE7IOTnCa56AQtw98jsAUdrCcU/AlI76EHa18C1arBMaUnmP4L04E5JnYt1X7SiAT7+UTb9Vl+9NNpYKaRK+Qf3Irlj+94i97Quw1Ds1fvQGsD28qhR4MspQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by PH7PR11MB6029.namprd11.prod.outlook.com (2603:10b6:510:1d0::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Tue, 20 Aug
 2024 20:25:52 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%5]) with mapi id 15.20.7875.019; Tue, 20 Aug 2024
 20:25:52 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: <lucas.demarchi@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, Matthew
 Brost <matthew.brost@intel.com>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>, Himal Prasad Ghimiray
 <himal.prasad.ghimiray@intel.com>
Subject: [PATCH 02/12] drm/xe: Introduce GGTT documentation
Date: Tue, 20 Aug 2024 16:25:37 -0400
Message-ID: <20240820202547.300257-2-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240820202547.300257-1-rodrigo.vivi@intel.com>
References: <20240820202547.300257-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0029.namprd03.prod.outlook.com
 (2603:10b6:a03:33a::34) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|PH7PR11MB6029:EE_
X-MS-Office365-Filtering-Correlation-Id: 10b78f51-ad63-470d-e7e3-08dcc1564965
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?RJlIwn+ZoSmkm0ete+IwojpYmO90l5JkVSq4mmHTaYjI9goOumAafyfT8yWz?=
 =?us-ascii?Q?R3MshaFGHEApMCiSpNUS7AkBFQ+lLc+qabzsAD6aG4fjKVIoLaNieEcYvI34?=
 =?us-ascii?Q?AvgIxlyVhBHS2kGeIeUr1RUcIo5fHN8wUu4oBgVDY0AjYcqvaNw8kU414wFJ?=
 =?us-ascii?Q?kPZyKsMUGh4z9EISRtsHv27oj71mc8f8k1TlYhBbjVTShPsSxT5kapnzq7Y9?=
 =?us-ascii?Q?X5uOvJmffbzUHM7qL4YMOObkXrDzaCaIpnOnCFcUMCPGmJ2aF+cOW97ODYuv?=
 =?us-ascii?Q?a1wSwBr543aBsq5C0zjEbGuGpF7Gae3MCGwjfrsyiClvtE/Fmx1oiKhsbrBI?=
 =?us-ascii?Q?58FNdT2+GBGR3VeXkmG33B9QymCpLi0bRMo2QStloXPJA09ugQrjnY0Kznce?=
 =?us-ascii?Q?h45s8cLUJXAUFa8e9UYytP8F8K5mYkcZcPLpxNRxBXE19UjvAYHVar7DDs3t?=
 =?us-ascii?Q?uyFWWMP3b9sTCALU0awH7DxMK+0sFkqnJeLXetL3Qppze4bncuC/ZpISCeso?=
 =?us-ascii?Q?oUfdo6yQxWenqrGnoJGrlkLqqhnBRmuB1MCQpOxj+vZNVaIf9Y2loZ8OIdfN?=
 =?us-ascii?Q?N3h5O9nBb7uj6WGEP3+z0LkXPlCBUB7pcIfFAFnccYbxlAEJx/1AyeIrGw7B?=
 =?us-ascii?Q?w1W2SznBWggpmNHSyoQnBRBmmkSKHxlSkGQ9Ot4oXPWN8lt7Ln4Hxf5DsYRw?=
 =?us-ascii?Q?qxV9cEtIbuaqxeoB/1NlP9MBIfZ+8NGsF6JLcvnxJ9o3//9dllp5R1cBDM23?=
 =?us-ascii?Q?ph2mnFPbtIr1NC4kAzeXVjyRKfyVd2isnd/r4YMV9nwT7/i+hOAoX/B9RZaW?=
 =?us-ascii?Q?PsHO9js1lr5n4v2vQhNZyQIFbLwWsFOIOw9h1OfqWxiumgLhkSo4l1JVYKCu?=
 =?us-ascii?Q?iEYLnK0cvEnpTPPoUBxkFNelF5A6bWwhiTcKwdptytuqTX6P5bFvTwepaYXi?=
 =?us-ascii?Q?UIqOoqFwTDB+0MuZoq1xqfCI+3v197vzoe2Jg0XoMuS28Xf1kzRlkoudkJKU?=
 =?us-ascii?Q?ZXQn8KAa4NWI0Zw6uAeDim5lvOEIEhbiZnIFCGphVEBT5UsZckly/6qPizIO?=
 =?us-ascii?Q?jWdHoWjiTBdVig45u7lDjthS8SuXxMG1xloxGCSSwYWLnUNcVxnv55g9yUD8?=
 =?us-ascii?Q?v8d8vFJQUmHj2wffrqJJWsvWzL7dYSO3Dplwr08YB0HvDXZ2xag62oC7AmRQ?=
 =?us-ascii?Q?X+j8Jld7i1LOb7QkaXVIh9+chdeNQdtfgCN8SZQq2GbRIOoQ9faKzlvEZZDa?=
 =?us-ascii?Q?S4SF0TGVRH82duXw0+0bhJfEW0l1k7oUSFOSPbL6DKGYAUfg4ShDUVTDfm/h?=
 =?us-ascii?Q?jU4H/abs8XlVXEbG2BukskgziAXbticbLl7A41gH5mpTpw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?5L3s4aalVrGz5pFaJC/61VAIh31s9hQw2sMgsK/oCI7Ip1AyaU8/uXQ44Xft?=
 =?us-ascii?Q?qUwoYEqdbtNiCi4k9T7JsNpxRKeKzv2VMszehu28WHj72rYdkwVZ6kao7eAu?=
 =?us-ascii?Q?Yx0WGeL+/Kw0/HGz1QhiupSDrZdgROrvvKt42I2Ovr9TEz0SvRPGQLOYvPpO?=
 =?us-ascii?Q?gFfvvOgG80dA1kBE4Wp8vTBb1kA+LlfzOZOzQDNs+h1hqjL8Pw2qnSYT0eqr?=
 =?us-ascii?Q?mWW2guOM3KsnyctpMafKwoyrqa1HrxRdtkqkNSeRU3o4Jr0X1zP9E4MwKJGa?=
 =?us-ascii?Q?Mt7d+r/tYy91K+m+fMAYlggjsHOu5XW+ivZ6W0RzB80Le0gFoOAXK7Cu5201?=
 =?us-ascii?Q?zuZfz5zH8rZUwhkmD1G/FOyyn/p6iR0sa9QnFQ2D6UouHRhcrlMl8s8+3ShZ?=
 =?us-ascii?Q?DMzDZwk6iVpbgvJgD20mkAfySAq/ilRGZMPXlgz54UDDKh3vw43+JL+Y1Y9O?=
 =?us-ascii?Q?9YRtQLmonpXrA5cDpNUcE++TDT5AGgg+kQn0g62r2asp1pLCFjQjY3ub/QBq?=
 =?us-ascii?Q?gQ/R1Eg/zYDV4O0xQPpy25pJqASco5Y4LaKa/8QJPvX8M972oxFUkkRgM4+z?=
 =?us-ascii?Q?YGG4noj2mxgiP7XqgSKhRPW5jLimmfgBSB4F33IXxYn4XhdgkrqtwUH8e0xc?=
 =?us-ascii?Q?X+Yo4tfyJXUSDyIyqFJ9boUPEMnG8zOVNrhgnoCsMI4ZZlcN6amu1lTQPJ7M?=
 =?us-ascii?Q?uDjArmAGsadssHPLHjSt/cqZeQ6iUP5dKE7ZiKJ41vLXBFbr8wp9yMSzpLKK?=
 =?us-ascii?Q?rEBsra30UlHRXrakxDG1C+0DDHdhx4pNo5rBYHFEU5LeMR2b4TwCyx1IPOK5?=
 =?us-ascii?Q?YbFEy//WHMXDJwzjx+wOmJvLIxOmaEWXfYugD81ckyLav+djaMgPvB5L0PmS?=
 =?us-ascii?Q?Qw0ViagcoVRpei+Gwc/jvhiT5W0zp2akg8qIj+3qUmUOcQxTvw+Y+ALO54e8?=
 =?us-ascii?Q?7mbLAGljlEr6roZZ7fxC+HVIHflXkiHjenJhzoIPhhnvfZlnSeLqPrKO8j5u?=
 =?us-ascii?Q?j9eJQRHal5X3s+a5lZyNupub4QADP3D997IdajZHU4q7Dv/6joKZUL2xWoV1?=
 =?us-ascii?Q?9xUoZRAFDpYWR7tJ1CNRcWoxb+cpJ1P3dv1wHWe2SntIc6Qrz6J/JkqOSjhR?=
 =?us-ascii?Q?w9JR52iSzlV6DovF0of+slYQqR+OwRxsc3GsVD8S2wAVmFKPHaQS4jI1OvtR?=
 =?us-ascii?Q?ZJeFUCsehtgNOHQW1lNUuK1T0Osd66XWv0/adNDId0gBmRpVAy073KNcAMfL?=
 =?us-ascii?Q?HrVQZpw7WeDenPZckUc5JQwwH7pM8CjA3XxHKN8T4XwalVn2CuPbZ1qok7T8?=
 =?us-ascii?Q?Kjwv3ClLgeF/h11ssePRZ5UfPHvLpVMTETOKKa0ldEI+TlVBqXdoM0cvv1XE?=
 =?us-ascii?Q?jp25ATCuz+wcO8oXB1HrwVr1u6mwAWZhc+0HU2Zup8/2dShKn0Bvngd5GNt/?=
 =?us-ascii?Q?qMMDuul0KZjrf0BR0xH0Io9+2IynPN0kmxMnVF3lyMSwoG87TTWrQzDx+SGb?=
 =?us-ascii?Q?t6b+aCdKqjE3o57xOkd06FLGU3HTua+MNrN5ZESMClfegWw9HQ6VVVi1Pq0y?=
 =?us-ascii?Q?8aIh8jGEpWrh0en8MFJb++anBlOGMyrdyu8pi+df?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 10b78f51-ad63-470d-e7e3-08dcc1564965
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2024 20:25:52.5936 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qnEjOWpn46e9fxZOhYFDC417yBjcmu/8vHvUgU7K7vSxzLz/0Qy6znjfqhcsGAobYROB7AF2idcJTX0hXwfhyA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6029
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

Document xe_ggtt and ensure it is part of the built kernel docs.

v2: - Accepted all Michal's suggestions
    - Rebased on top of new set_pte per platform/wa function pointer
v3: - Typos and other acronym fixes (Michal)

Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com> #v1
Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 Documentation/gpu/xe/xe_mm.rst     |  15 ++++
 drivers/gpu/drm/xe/xe_ggtt.c       | 136 +++++++++++++++++++++++------
 drivers/gpu/drm/xe/xe_ggtt_types.h |  34 ++++++--
 3 files changed, 150 insertions(+), 35 deletions(-)

diff --git a/Documentation/gpu/xe/xe_mm.rst b/Documentation/gpu/xe/xe_mm.rst
index 6c8fd8b4a466..95864a4502dd 100644
--- a/Documentation/gpu/xe/xe_mm.rst
+++ b/Documentation/gpu/xe/xe_mm.rst
@@ -7,6 +7,21 @@ Memory Management
 .. kernel-doc:: drivers/gpu/drm/xe/xe_bo_doc.h
    :doc: Buffer Objects (BO)
 
+GGTT
+====
+
+.. kernel-doc:: drivers/gpu/drm/xe/xe_ggtt.c
+   :doc: Global Graphics Translation Table (GGTT)
+
+GGTT Internal API
+-----------------
+
+.. kernel-doc:: drivers/gpu/drm/xe/xe_ggtt_types.h
+   :internal:
+
+.. kernel-doc:: drivers/gpu/drm/xe/xe_ggtt.c
+   :internal:
+
 Pagetable building
 ==================
 
diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
index add14f3dea1f..dd5cd0df705c 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.c
+++ b/drivers/gpu/drm/xe/xe_ggtt.c
@@ -30,6 +30,39 @@
 #include "xe_wa.h"
 #include "xe_wopcm.h"
 
+/**
+ * DOC: Global Graphics Translation Table (GGTT)
+ *
+ * Xe GGTT implements the support for a Global Virtual Address space that is used
+ * for resources that are accessible to privileged (i.e. kernel-mode) processes,
+ * and not tied to a specific user-level process. For example, the Graphics
+ * micro-Controller (GuC) and Display Engine (if present) utilize this Global
+ * address space.
+ *
+ * The Global GTT (GGTT) translates from the Global virtual address to a physical
+ * address that can be accessed by HW. The GGTT is a flat, single-level table.
+ *
+ * Xe implements a simplified version of the GGTT specifically managing only a
+ * certain range of it that goes from the Write Once Protected Content Memory (WOPCM)
+ * Layout to a predefined GUC_GGTT_TOP. This approach avoids complications related to
+ * the GuC (Graphics Microcontroller) hardware limitations. The GuC address space
+ * is limited on both ends of the GGTT, because the GuC shim HW redirects
+ * accesses to those addresses to other HW areas instead of going through the
+ * GGTT. On the bottom end, the GuC can't access offsets below the WOPCM size,
+ * while on the top side the limit is fixed at GUC_GGTT_TOP. To keep things
+ * simple, instead of checking each object to see if they are accessed by GuC or
+ * not, we just exclude those areas from the allocator. Additionally, to simplify
+ * the driver load, we use the maximum WOPCM size in this logic instead of the
+ * programmed one, so we don't need to wait until the actual size to be
+ * programmed is determined (which requires FW fetch) before initializing the
+ * GGTT. These simplifications might waste space in the GGTT (about 20-25 MBs
+ * depending on the platform) but we can live with this. Another benefit of this
+ * is the GuC bootrom can't access anything below the WOPCM max size so anything
+ * the bootrom needs to access (e.g. a RSA key) needs to be placed in the GGTT
+ * above the WOPCM max size. Starting the GGTT allocations above the WOPCM max
+ * give us the correct placement for free.
+ */
+
 static u64 xelp_ggtt_pte_encode_bo(struct xe_bo *bo, u64 bo_offset,
 				   u16 pat_index)
 {
@@ -164,12 +197,16 @@ static const struct xe_ggtt_pt_ops xelpg_pt_wa_ops = {
 	.ggtt_set_pte = xe_ggtt_set_pte_and_flush,
 };
 
-/*
- * Early GGTT initialization, which allows to create new mappings usable by the
- * GuC.
- * Mappings are not usable by the HW engines, as it doesn't have scratch /
+/**
+ * xe_ggtt_init_early - Early GGTT initialization
+ * @ggtt: the &xe_ggtt to be initialized
+ *
+ * It allows to create new mappings usable by the GuC.
+ * Mappings are not usable by the HW engines, as it doesn't have scratch nor
  * initial clear done to it yet. That will happen in the regular, non-early
- * GGTT init.
+ * GGTT initialization.
+ *
+ * Return: 0 on success or a negative error code on failure.
  */
 int xe_ggtt_init_early(struct xe_ggtt *ggtt)
 {
@@ -194,29 +231,6 @@ int xe_ggtt_init_early(struct xe_ggtt *ggtt)
 	if (IS_DGFX(xe) && xe->info.vram_flags & XE_VRAM_FLAGS_NEED64K)
 		ggtt->flags |= XE_GGTT_FLAGS_64K;
 
-	/*
-	 * 8B per entry, each points to a 4KB page.
-	 *
-	 * The GuC address space is limited on both ends of the GGTT, because
-	 * the GuC shim HW redirects accesses to those addresses to other HW
-	 * areas instead of going through the GGTT. On the bottom end, the GuC
-	 * can't access offsets below the WOPCM size, while on the top side the
-	 * limit is fixed at GUC_GGTT_TOP. To keep things simple, instead of
-	 * checking each object to see if they are accessed by GuC or not, we
-	 * just exclude those areas from the allocator. Additionally, to
-	 * simplify the driver load, we use the maximum WOPCM size in this logic
-	 * instead of the programmed one, so we don't need to wait until the
-	 * actual size to be programmed is determined (which requires FW fetch)
-	 * before initializing the GGTT. These simplifications might waste space
-	 * in the GGTT (about 20-25 MBs depending on the platform) but we can
-	 * live with this.
-	 *
-	 * Another benifit of this is the GuC bootrom can't access anything
-	 * below the WOPCM max size so anything the bootom needs to access (e.g.
-	 * a RSA key) needs to be placed in the GGTT above the WOPCM max size.
-	 * Starting the GGTT allocations above the WOPCM max give us the correct
-	 * placement for free.
-	 */
 	if (ggtt->size > GUC_GGTT_TOP)
 		ggtt->size = GUC_GGTT_TOP;
 
@@ -262,6 +276,12 @@ static void xe_ggtt_initial_clear(struct xe_ggtt *ggtt)
 	mutex_unlock(&ggtt->lock);
 }
 
+/**
+ * xe_ggtt_init - Regular non-early GGTT initialization
+ * @ggtt: the &xe_ggtt to be initialized
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
 int xe_ggtt_init(struct xe_ggtt *ggtt)
 {
 	struct xe_device *xe = tile_to_xe(ggtt->tile);
@@ -382,6 +402,18 @@ void xe_ggtt_deballoon(struct xe_ggtt *ggtt, struct drm_mm_node *node)
 	mutex_unlock(&ggtt->lock);
 }
 
+/**
+ * xe_ggtt_insert_special_node_locked - Locked version to insert a &drm_mm_node into the GGTT
+ * @ggtt: the &xe_ggtt where node will be inserted
+ * @node: the &drm_mm_node to be inserted
+ * @size: size of the node
+ * @align: alignment constrain of the node
+ * @mm_flags: flags to control the node behavior
+ *
+ * To be used in cases where ggtt->lock is already taken.
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
 int xe_ggtt_insert_special_node_locked(struct xe_ggtt *ggtt, struct drm_mm_node *node,
 				       u32 size, u32 align, u32 mm_flags)
 {
@@ -389,6 +421,15 @@ int xe_ggtt_insert_special_node_locked(struct xe_ggtt *ggtt, struct drm_mm_node
 					  mm_flags);
 }
 
+/**
+ * xe_ggtt_insert_special_node - Insert a &drm_mm_node into the GGTT
+ * @ggtt: the &xe_ggtt where node will be inserted
+ * @node: the &drm_mm_node to be inserted
+ * @size: size of the node
+ * @align: alignment constrain of the node
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
 int xe_ggtt_insert_special_node(struct xe_ggtt *ggtt, struct drm_mm_node *node,
 				u32 size, u32 align)
 {
@@ -402,6 +443,11 @@ int xe_ggtt_insert_special_node(struct xe_ggtt *ggtt, struct drm_mm_node *node,
 	return ret;
 }
 
+/**
+ * xe_ggtt_map_bo - Map the BO into GGTT
+ * @ggtt: the &xe_ggtt where node will be mapped
+ * @bo: the &xe_bo to be mapped
+ */
 void xe_ggtt_map_bo(struct xe_ggtt *ggtt, struct xe_bo *bo)
 {
 	u16 cache_mode = bo->flags & XE_BO_FLAG_NEEDS_UC ? XE_CACHE_NONE : XE_CACHE_WB;
@@ -449,17 +495,39 @@ static int __xe_ggtt_insert_bo_at(struct xe_ggtt *ggtt, struct xe_bo *bo,
 	return err;
 }
 
+/**
+ * xe_ggtt_insert_bo_at - Insert BO at a specific GGTT space
+ * @ggtt: the &xe_ggtt where bo will be inserted
+ * @bo: the &xe_bo to be inserted
+ * @start: address where it will be inserted
+ * @end: end of the range where it will be inserted
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
 int xe_ggtt_insert_bo_at(struct xe_ggtt *ggtt, struct xe_bo *bo,
 			 u64 start, u64 end)
 {
 	return __xe_ggtt_insert_bo_at(ggtt, bo, start, end);
 }
 
+/**
+ * xe_ggtt_insert_bo - Insert BO into GGTT
+ * @ggtt: the &xe_ggtt where bo will be inserted
+ * @bo: the &xe_bo to be inserted
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
 int xe_ggtt_insert_bo(struct xe_ggtt *ggtt, struct xe_bo *bo)
 {
 	return __xe_ggtt_insert_bo_at(ggtt, bo, 0, U64_MAX);
 }
 
+/**
+ * xe_ggtt_remove_node - Remove a &drm_mm_node from the GGTT
+ * @ggtt: the &xe_ggtt where node will be removed
+ * @node: the &drm_mm_node to be removed
+ * @invalidate: if node needs invalidation upon removal
+ */
 void xe_ggtt_remove_node(struct xe_ggtt *ggtt, struct drm_mm_node *node,
 			 bool invalidate)
 {
@@ -488,6 +556,11 @@ void xe_ggtt_remove_node(struct xe_ggtt *ggtt, struct drm_mm_node *node,
 	drm_dev_exit(idx);
 }
 
+/**
+ * xe_ggtt_remove_bo - Remove a BO from the GGTT
+ * @ggtt: the &xe_ggtt where node will be removed
+ * @bo: the &xe_bo to be removed
+ */
 void xe_ggtt_remove_bo(struct xe_ggtt *ggtt, struct xe_bo *bo)
 {
 	if (XE_WARN_ON(!bo->ggtt_node.size))
@@ -544,6 +617,13 @@ void xe_ggtt_assign(struct xe_ggtt *ggtt, const struct drm_mm_node *node, u16 vf
 }
 #endif
 
+/**
+ * xe_ggtt_dump - Dump GGTT for debug
+ * @ggtt: the &xe_ggtt to be dumped
+ * @p: the &drm_mm_printer helper handle to be used to dump the information
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
 int xe_ggtt_dump(struct xe_ggtt *ggtt, struct drm_printer *p)
 {
 	int err;
diff --git a/drivers/gpu/drm/xe/xe_ggtt_types.h b/drivers/gpu/drm/xe/xe_ggtt_types.h
index 2245d88d8f39..154de298a4e3 100644
--- a/drivers/gpu/drm/xe/xe_ggtt_types.h
+++ b/drivers/gpu/drm/xe/xe_ggtt_types.h
@@ -13,30 +13,50 @@
 struct xe_bo;
 struct xe_gt;
 
+/**
+ * struct xe_ggtt - Main GGTT struct
+ *
+ * In general, each tile can contains its own Global Graphics Translation Table
+ * (GGTT) instance.
+ */
 struct xe_ggtt {
+	/** @tile: Back pointer to tile where this GGTT belongs */
 	struct xe_tile *tile;
-
+	/** @size: Total size of this GGTT */
 	u64 size;
 
 #define XE_GGTT_FLAGS_64K BIT(0)
+	/**
+	 * @flags: Flags for this GGTT
+	 * Acceptable flags:
+	 * - %XE_GGTT_FLAGS_64K - if PTE size is 64K. Otherwise, regular is 4K.
+	 */
 	unsigned int flags;
-
+	/** @scratch: Internal object allocation used as a scratch page */
 	struct xe_bo *scratch;
-
+	/** @lock: Mutex lock to protect GGTT data */
 	struct mutex lock;
-
+	/**
+	 *  @gsm: The iomem pointer to the actual location of the translation
+	 * table located in the GSM for easy PTE manipulation
+	 */
 	u64 __iomem *gsm;
-
+	/** @pt_ops: Page Table operations per platform */
 	const struct xe_ggtt_pt_ops *pt_ops;
-
+	/** @mm: The memory manager used to manage individual GGTT allocations */
 	struct drm_mm mm;
-
 	/** @access_count: counts GGTT writes */
 	unsigned int access_count;
 };
 
+/**
+ * struct xe_ggtt_pt_ops - GGTT Page table operations
+ * Which can vary from platform to platform.
+ */
 struct xe_ggtt_pt_ops {
+	/** @pte_encode_bo: Encode PTE address for a given BO */
 	u64 (*pte_encode_bo)(struct xe_bo *bo, u64 bo_offset, u16 pat_index);
+	/** @ggtt_set_pte: Directly write into GGTT's PTE */
 	void (*ggtt_set_pte)(struct xe_ggtt *ggtt, u64 addr, u64 pte);
 };
 
-- 
2.46.0

