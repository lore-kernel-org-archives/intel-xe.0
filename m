Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01267C5CFEB
	for <intel-xe@archiver.kernel.org>; Thu, 13 Aug 2026 10:25:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 960B710E0AE;
	Thu, 13 Aug 2026 10:25:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aX1ltMKq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29EFE10E0AE
 for <intel-xe@lists.freedesktop.org>; Thu, 13 Aug 2026 10:25:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786616729; x=1818152729;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=+Y+Miyxd2azguVPP1KU9K425HaI4rLtSAvn/wM7F8MY=;
 b=aX1ltMKqPtg4e4BEErTyMx9GimhIn0kE6SdYpiVtk+Uf9MRFv4T9+t+g
 JhyuS0VPWDbzXxRM33kLB5G3Gz7TavC6YJdYln4c/vT1sEB9JYrUsGRIc
 +ydp6ptSY3qXstXRJqILAcXa3ibe29ZmxG+A/eiOuqzF2odBj/KPPUeMu
 zlQPUMv118Xchtq1qCcmgY0SPq7ZfxJYjckm3jCkhdH363KNuwEcfQuWe
 yT5Lswfy8bRFIpjmyqqBoR+GMGguEHtyJlclBD0DOC/se78YgsMkzSOke
 xVNxMPIgsVbR/Tp4DSW7EeEZb+B3d0/l50e/EKKbNkrk490v0eFzb1OLE A==;
X-CSE-ConnectionGUID: EL/rDnoITymUL7JL7K/PiA==
X-CSE-MsgGUID: GgM35iq8QdOISwsS5X1uxQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11873"; a="90865425"
X-IronPort-AV: E=Sophos;i="6.25,221,1779174000"; d="scan'208";a="90865425"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2026 03:25:28 -0700
X-CSE-ConnectionGUID: tixvdirKT9OPYiMi09ULow==
X-CSE-MsgGUID: 9sC/GvPzSIaoKe1xGM1dKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,221,1779174000"; d="scan'208";a="265887236"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2026 03:25:28 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 13 Aug 2026 03:25:28 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Thu, 13 Aug 2026 03:25:28 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.6) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 13 Aug 2026 03:25:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mGyEzeRctG4nC6AzEN6TKsSfRaKYyjJWaSO/9TnhXAKZ2AcwlZB5VeCjmTWhz+rvyte76Sx8LN+wewDG7IiSkiiRgC8AKuvH2jiZz0AKDl0+aqWErcFTOosK0gW35nZUm3fgGv4ktAzfUgoHXnk+0/OYNTqgefIRzG3mduI45pq9v20SzFRF2TBrmJOfPDU8B0ps1iH5UmoaSJfeffAM/7DkDH90DlE6dbPzb0pvRWpb7xGWTMKnEwLM2slrL56L9d7Hyj5gyZQ8yiSt4AriWLbgyQdDd/yC1+BMhUTd+NftRTlr/U+TJGfBieJMgpjk9Za6WwosELwI7glak74iDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ybZ8vnEQKDag4uDmZ5QBjaLliEFSLLkhErWJlBbDhSk=;
 b=Vic2s7K9pkTLb5/7ue+LoxfnwF9/nAfnwnU7jC1rrUow3oXElXEnbAIPeDGB8XHlFiQyAoF8yUn+t4WG9r+oktFdmoI1yYUGKLpGDHedpyqaNU59V9C+m+8QbVzGaW18G9Ict77XRIr533PbHczcjumEC3hEd4uq+ZT/Mzqe7JeaFs0u8CTaS5eU3rhTzTHI5G9Q5bEqSVINs5m74C2xisUUEzpg/fWqXKQY7KDhfONZHHzv//O3AsaRgKj6Lx73SwrCS1BCMIUBWbJp3DIs8PXzt1pR+LX3GEUadPRI7d13PhX+Y3OgN31pkPvr+3ADVHUJDKqRasHGdTnPgqA9hQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8039.namprd11.prod.outlook.com (2603:10b6:510:25f::18)
 by IA1PR11MB8802.namprd11.prod.outlook.com (2603:10b6:208:598::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Thu, 13 Aug
 2026 10:25:24 +0000
Received: from PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92]) by PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92%2]) with mapi id 15.21.0315.012; Thu, 13 Aug 2026
 10:25:23 +0000
From: =?UTF-8?q?Pi=C3=B3rkowski=2C=20Piotr?= <piotr.piorkowski@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
Subject: [PATCH v1 1/4] drm/xe/vram: Add binding information to VRAM regions
Date: Thu, 13 Aug 2026 12:25:08 +0200
Message-ID: <20260813102511.200690-2-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260813102511.200690-1-piotr.piorkowski@intel.com>
References: <20260813102511.200690-1-piotr.piorkowski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DU2PR04CA0274.eurprd04.prod.outlook.com
 (2603:10a6:10:28c::9) To PH8PR11MB8039.namprd11.prod.outlook.com
 (2603:10b6:510:25f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8039:EE_|IA1PR11MB8802:EE_
X-MS-Office365-Filtering-Correlation-Id: 1eeb2c85-4497-45ac-5c8d-08def9252f60
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|23010399003|22082099003|18002099003|5023799004|11063799006|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info: 5mYJJF3V3fyTw/0lOUOQiMT8Bz6F9cnzvwDwSvFQvnzgBatl81j4/44mrST8zo1tTMV5sPIGlgrvrqfBbqhxVxdE1XYsI4nyZWuRsA4tOTAaHonTHxQjkg4HJwbH7fc1GB9UnvtnxJPMhTbMstiAUjN1H61EYOOF1qjEL4agsfrDRcmNOnHtT7IfeY38Wj/sikqawdHKgWXwuYM1SHHqxjKiOTrfIAf/cY3E/7JRBw4jQS9VVN2/X8q+1tElmD6g84BCS9mgBD4eLwAG65CKXzfGRuJVo5jNpDp4Q32kc0rO8arP8F5GEnaEQjVm6RSzJsoPQnPBhc7aGDqHZ18k1l6cZB6zx/X80VkCyWqfqZbu3/gNAVqJk3K9dwqNaOtawLWPhPqPQ7BxSscIcU/C6bjV88abHthspA1Keg59mtmqwiAAMEBrg2Fw9lnrnlSuch19GFuk+cN2HV0Dig8wNXOxTn/nPjlre2edn22nCPK6LEROdwh007821QXqgOph0NMjEUzdiTgwn5VPvV7tSiw8NlgGwHnIeXeOc71pQbRSkEGTQ2+9swfLzuunE2aWlRDC10HspNNYn69cEhxOIQvgsiYNkq7X3zJLbq+m6J2PJHzIABdGum9qQ4VuuD9VyA5Vy/COBWbZiS+zLkUP43mq9eakw6v9A/7AX75mLpM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8039.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(22082099003)(18002099003)(5023799004)(11063799006)(56012099006)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?emVndW9KcU81SlZIalcxZklWckhPZFdIeHJNYm1DSUVXZ0ZpUFl0cUE4d3pk?=
 =?utf-8?B?SEl0d3lVeDZEcUsyRGhXaThqNnBwZjdjZHJacGhHVTB1N1FmK0JvSWhiWmlV?=
 =?utf-8?B?TzRDVHRHRjZOTmpPdXUyc1VOMk9aNkZUbkRUNUdIbG9KVnhhazRVR0piam1V?=
 =?utf-8?B?YllNQ2tlblgwY1Vaa2M3Q0NyNUpUYmxhbzF2QnhDTXBFWVlpWDM0R0ZyUUVm?=
 =?utf-8?B?eWdVN3M0Y3BSdjQyazJXY1VBNy9kZElRZ0F1WHowQWFGcElEanBraHpzRFlI?=
 =?utf-8?B?WkVIRWYvSFF3Z3hpSlFWWks3TFNjVjdLdWp2b0FrSFdMeGszWVExTy9paU5m?=
 =?utf-8?B?ZVcxenQzdEQ1WllrVWNpSklQUEVGM3BnZTVpN3NhRHdZdUlQbk5OdlA4Smdw?=
 =?utf-8?B?My91QysxQm85YnB4N21OeHRKa1F0anFMWVl6cUhTRW1nSHN3cFVyV3hSbklO?=
 =?utf-8?B?THU0NEFvRTgybGZ4RkIrTnk3bUZDM2lmYlhlQ2l0bnBhNWVLWjRac21uczYx?=
 =?utf-8?B?Ymw5M1A1UFdGWGx6bDNSZ1Q4bDk5b3pPTTBXU1J5YkE5UEdybWhhcFpZYjY5?=
 =?utf-8?B?SnF2SDN5UGhkczBPUFpZMnhlc0szcC9iL29menVzSEdLNit0QkUxN0tJTEdV?=
 =?utf-8?B?RG9QTEFocmtoOTVia2c5QnAzMkRzbHNwWjRKZGlYTXFvaWN2OTFLSUpWb2hT?=
 =?utf-8?B?ZjBQSHVkZXVRN1hYR3l3MVQ5eVZzQ0JNb2hoK1YrUHE4MTBDRmhwdFNJdTBw?=
 =?utf-8?B?MU5yNHpQMXlTN3hQTUpmTGtZTHEyWTFaWXh5Q3V5WW9ITklQZE5JSEQzWDJE?=
 =?utf-8?B?dlRiUGZxMjlQbDV3RkVtemZJM0VKby91aXNtY3Y0UEorVGYyNHN4Ry82MEJK?=
 =?utf-8?B?a3A4eThrRFhscHIwTEtXSk8wZGU1cVZSdXZUTHlDYnF3dGNOWllxZmxDZ3VF?=
 =?utf-8?B?ajQwQW9XQU5HVGJQaU9xTll5dFN2SVZtSnVpZ2VsNExGNEc5Q0pETmtHb1kx?=
 =?utf-8?B?Y1dGTC8xNWhjY0RoWmh1UGlaNlBuSkpRNzkyZ0t3QldmUkErUTY1eDJoa3R5?=
 =?utf-8?B?a0JybU40eEQ4OFhJc3hGbFJoeHVMYThNaTlKQmVsS3pIWXpMQUJYb0o0UHBK?=
 =?utf-8?B?VEo5bFZtaGJyWXNKbi9IVHhPWWNhOWlmV1JNbmI3bkVMeEF6clBpbStBbjYz?=
 =?utf-8?B?Qnd0dFRsMFQzYm1tZUxOb05WL3BzUlYvcTkvU1F5dGNHck1ET2dmSUhkVjR3?=
 =?utf-8?B?MFZNMVJDT2MzVDVkL3ptR3J1YlNlaTBOZEhXZzhCdnZubVhHZHV2bGtpR1RZ?=
 =?utf-8?B?aTkwTlRQUE1lMEtOMkFYa2xJNTJwZWdKeVVyUmNTVlNuWEJiRDBreGhqR1lG?=
 =?utf-8?B?MXdCUXJTTW1tYkloQzJEc04yUVVpSWFSK1BhUDlmSWtGU2c2NTN1T291d2dP?=
 =?utf-8?B?QmZkNi9YenhvSFdaRzZFSEgzQWt6cThUZFpYKzd1QjlWSUltekFuY3ExRXJS?=
 =?utf-8?B?NU4rcFlrTWNNQjlWdnc3RDJNS1doS2hoWWp6YTJIOWgxL0h0WGxKM3Q5bCtE?=
 =?utf-8?B?cWNYWG9CSUNVRlFIUUUvRlN2ODF2Mm9EdXBVTldMM2JxcDdPa281aXE5MkZT?=
 =?utf-8?B?RjJQekZPa2JHTUt6bnZqODV3MGRueFFoeTJqaHNDVkFwd3o0dUlDSC9Sa2pY?=
 =?utf-8?B?Y0NLTlN4cU9rZmpUd2pzSnRWYWk3SmVDMUJxUUJ2NkcyUVhqamhNNW8rZHdx?=
 =?utf-8?B?SWgrTjAyYlVKczI0cXVWZ3dWbTNGK1hIczFIZ015N2NZYjlqaldUMjVFQzRp?=
 =?utf-8?B?eWEzTzc1eDZLTWJwTTNMQ0lIdUZJTldLQlVmNmRGUG9YTGJ0T3Blek94aGNv?=
 =?utf-8?B?L0c1Q3NFQW1BVUpiVm16NWxQd2Q1KzU3aXFDb0RyMmlhQ3FkejVsYncyUE5j?=
 =?utf-8?B?OWFsNzg3QmtUWTk5T0tNdVFiWG04OTZ4bGhES1loV2tDK2p0ZlJQMTQ1L2tD?=
 =?utf-8?B?V1JwdWVybjFUbkxjTGxqbXVCbjMrcC9YM1pkdWdiOHYxcXhmY3J0VkhuWS8r?=
 =?utf-8?B?Uy95bkRwN3RrZXcxNDBvbjMxd0hkenV2Nlp3b0hDaTRoM0NLc3BuVE5tak9H?=
 =?utf-8?B?V0NCU085dm1sMVZnNGVvVnZBMTVwVWprcDJjWGhHeTdPV2tnUE91cnpJOE5R?=
 =?utf-8?B?RWxOTTdBdVNkUldTVzFhZkxGdHptaXdhNFdDL2dUcThpZ3NtcWZOQ3dPNUcz?=
 =?utf-8?B?ZmpDU2c2cVlIeWJzS3hGdnNiNEF6dmRyOEl0Vy9kaUZhTk52YXBPZjF0eWdy?=
 =?utf-8?B?cExmait1M2NmSmc4eDlpTk5EcVVMdFhWZmsrcStLVVR5dlg5MVZDZ3FQYVIw?=
 =?utf-8?Q?e+aEvBSbhTGD+YxM=3D?=
X-Exchange-RoutingPolicyChecked: nXieUampsDk5cw5A4TTAUr4rh3gitgmGJB3jZdk55QeEmS5TiBU1Hd+LwKZNU2mns33ywyoIufisIwEzLEqulfqsvcP5cqoHhiFKsRCBL0yWFUx4F37Jae2auxp5tiQKpS21sBJM712Styrs2zTqQlno7yWKTAx1WctAcoKL+cT04MD5O7nh1HE4oJf1la6pHcd2N8yo7e6s1717LKd0/Y4QerqZUXZ8JUrf9VzNB5S43fp7+wJ3HHnWijiSc64mnMom7EsxyUvw+RQDI68b5K3NaBXgGjmaL1XE8efYdUCHKf/lC25R0zKVx65iAy81xONMZwpqEhu3eujVPof8EA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 1eeb2c85-4497-45ac-5c8d-08def9252f60
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8039.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2026 10:25:23.9166 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GG/hKjRROWkF6F5hfm24d3IDbqeE+b2APirBo6s+1xZWBBR3r5N4rT/szwKU5r22QdRqkW9P+rv6AT7FRxM8ofQGz33RNqCOkmkAn3htIQQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB8802
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

From: Piotr Piórkowski <piotr.piorkowski@intel.com>

Add a binding field to VRAM regions and pass it at allocation time.
This allows distinguishing VRAM regions serving different purposes. It is
needed for future patches where different VRAM regions serve different
purposes, such as dedicated VRAM for kernel allocations.

Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
---
 drivers/gpu/drm/xe/xe_tile.c       |  2 +-
 drivers/gpu/drm/xe/xe_vram.c       | 40 ++++++++++++++++++++++++------
 drivers/gpu/drm/xe/xe_vram.h       |  6 ++---
 drivers/gpu/drm/xe/xe_vram_types.h | 12 ++++++++-
 4 files changed, 48 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_tile.c b/drivers/gpu/drm/xe/xe_tile.c
index 74d925a337b7..fd0c2e4cbdd2 100644
--- a/drivers/gpu/drm/xe/xe_tile.c
+++ b/drivers/gpu/drm/xe/xe_tile.c
@@ -119,7 +119,7 @@ int xe_tile_alloc_vram(struct xe_tile *tile)
 	if (!IS_DGFX(xe))
 		return 0;
 
-	vram = xe_vram_region_alloc(xe, tile->id, XE_PL_VRAM0 + tile->id);
+	vram = xe_vram_region_alloc_tile(xe, tile->id);
 	if (!vram)
 		return -ENOMEM;
 	tile->mem.vram = vram;
diff --git a/drivers/gpu/drm/xe/xe_vram.c b/drivers/gpu/drm/xe/xe_vram.c
index 23eb7edbdd57..e5f83df98826 100644
--- a/drivers/gpu/drm/xe/xe_vram.c
+++ b/drivers/gpu/drm/xe/xe_vram.c
@@ -24,6 +24,16 @@
 #include "xe_vram.h"
 #include "xe_vram_types.h"
 
+static const char *stringify_vram_binding(enum xe_vram_binding binding)
+{
+	switch (binding) {
+	case XE_VRAM_BINDING_TILE:
+		return "Tile";
+	}
+
+	return "Unknown";
+}
+
 static bool resource_is_valid(struct pci_dev *pdev, int bar)
 {
 	if (!pci_resource_flags(pdev, bar))
@@ -189,7 +199,8 @@ static void vram_fini(void *arg)
 	}
 }
 
-struct xe_vram_region *xe_vram_region_alloc(struct xe_device *xe, u8 id, u32 placement)
+static struct xe_vram_region *vram_region_alloc(struct xe_device *xe, enum xe_vram_binding binding,
+						u8 id, u32 placement)
 {
 	struct xe_vram_region *vram;
 	struct drm_device *drm = &xe->drm;
@@ -203,12 +214,25 @@ struct xe_vram_region *xe_vram_region_alloc(struct xe_device *xe, u8 id, u32 pla
 	vram->xe = xe;
 	vram->id = id;
 	vram->placement = placement;
+	vram->binding = binding;
 #if defined(CONFIG_DRM_XE_PAGEMAP)
 	vram->migrate = xe->tiles[id].migrate;
 #endif
 	return vram;
 }
 
+/**
+ * xe_vram_region_alloc_tile - Allocate a tile VRAM region
+ * @xe: the &xe_device
+ * @id: tile id
+ *
+ * Return: the allocated VRAM region, or NULL on failure.
+ */
+struct xe_vram_region *xe_vram_region_alloc_tile(struct xe_device *xe, u8 id)
+{
+	return vram_region_alloc(xe, XE_VRAM_BINDING_TILE, id, XE_PL_VRAM0 + id);
+}
+
 static void print_vram_region_info(struct xe_device *xe, struct xe_vram_region *vram)
 {
 	struct drm_device *drm = &xe->drm;
@@ -217,11 +241,13 @@ static void print_vram_region_info(struct xe_device *xe, struct xe_vram_region *
 		drm_info(drm, "Small BAR device\n");
 
 	drm_info(drm,
-		 "VRAM[%u]: Actual physical size %pa, usable size exclude stolen %pa, CPU accessible size %pa\n",
-		 vram->id, &vram->actual_physical_size, &vram->usable_size, &vram->io_size);
-	drm_info(drm, "VRAM[%u]: DPA range: [%pa-%llx], io range: [%pa-%llx]\n",
-		 vram->id, &vram->dpa_base, vram->dpa_base + (u64)vram->actual_physical_size,
-		 &vram->io_start, vram->io_start + (u64)vram->io_size);
+		 "%s[%u] VRAM region: Actual physical size %pa, usable size exclude stolen %pa, CPU accessible size %pa\n",
+		 stringify_vram_binding(vram->binding), vram->id, &vram->actual_physical_size,
+		 &vram->usable_size, &vram->io_size);
+	drm_info(drm, "%s[%u] VRAM region: DPA range: [%pa-%llx], io range: [%pa-%llx]\n",
+		 stringify_vram_binding(vram->binding), vram->id, &vram->dpa_base,
+		 vram->dpa_base + (u64)vram->actual_physical_size, &vram->io_start,
+		 vram->io_start + (u64)vram->io_size);
 }
 
 static int vram_region_init(struct xe_device *xe, struct xe_vram_region *vram,
@@ -237,7 +263,7 @@ static int vram_region_init(struct xe_device *xe, struct xe_vram_region *vram,
 	vram->io_size = min_t(u64, usable_size, remain_io_size);
 
 	if (!vram->io_size) {
-		drm_err(&xe->drm, "Tile without any CPU visible VRAM. Aborting.\n");
+		drm_err(&xe->drm, "VRAM region without any CPU visible memory\n");
 		return -ENODEV;
 	}
 
diff --git a/drivers/gpu/drm/xe/xe_vram.h b/drivers/gpu/drm/xe/xe_vram.h
index dd1c8bf17922..87088ffbfd5e 100644
--- a/drivers/gpu/drm/xe/xe_vram.h
+++ b/drivers/gpu/drm/xe/xe_vram.h
@@ -8,15 +8,15 @@
 
 #include <linux/types.h>
 
+#include "xe_vram_types.h"
+
 struct xe_device;
-struct xe_vram_region;
 struct ttm_resource;
 
 struct xe_vram_region *xe_map_resource_to_region(struct ttm_resource *res);
 int xe_vram_probe(struct xe_device *xe);
 
-struct xe_vram_region *xe_vram_region_alloc(struct xe_device *xe, u8 id, u32 placement);
-
+struct xe_vram_region *xe_vram_region_alloc_tile(struct xe_device *xe, u8 id);
 resource_size_t xe_vram_region_io_start(const struct xe_vram_region *vram);
 resource_size_t xe_vram_region_io_size(const struct xe_vram_region *vram);
 resource_size_t xe_vram_region_dpa_base(const struct xe_vram_region *vram);
diff --git a/drivers/gpu/drm/xe/xe_vram_types.h b/drivers/gpu/drm/xe/xe_vram_types.h
index 646e3c12ae9f..51884e7a679d 100644
--- a/drivers/gpu/drm/xe/xe_vram_types.h
+++ b/drivers/gpu/drm/xe/xe_vram_types.h
@@ -15,6 +15,14 @@
 struct xe_device;
 struct xe_migrate;
 
+/**
+ * enum xe_vram_binding - VRAM binding types
+ * @XE_VRAM_BINDING_TILE: general-purpose VRAM region bound to a tile
+ */
+enum xe_vram_binding {
+	XE_VRAM_BINDING_TILE = 0,
+};
+
 /**
  * struct xe_vram_region - memory region structure
  * This is used to describe a memory region in xe
@@ -26,9 +34,11 @@ struct xe_vram_region {
 	/**
 	 * @id: VRAM region instance id
 	 *
-	 * The value should be unique for VRAM region.
+	 * The value should be unique within a given binding.
 	 */
 	u8 id;
+	/** @binding: VRAM region instance binding */
+	enum xe_vram_binding binding;
 	/** @io_start: IO start address of this VRAM instance */
 	resource_size_t io_start;
 	/**
-- 
2.34.1

