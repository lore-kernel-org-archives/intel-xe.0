Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2EADCAC597
	for <intel-xe@archiver.kernel.org>; Thu, 18 Sep 2025 04:06:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8EAC10E0AA;
	Thu, 18 Sep 2025 04:06:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QiZLxuD9";
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fk8TaOm4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 996FA10E0AA
 for <intel-xe@lists.freedesktop.org>; Thu, 18 Sep 2025 04:06:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758168383; x=1789704383;
 h=resent-from:resent-date:resent-message-id:resent-to:from:
 to:cc:subject:date:message-id:in-reply-to:references:
 list-id:list-subscribe:list-unsubscribe:
 content-transfer-encoding:mime-version;
 bh=/iMfp8vig0mHKZAxlSf/u9heZ6hDxMUA6/Hx0ZTiPiQ=;
 b=QiZLxuD9O59r2xQtwM4UUpSBRBTKtaEPHCqK6b3R5aqJ6cNOfl/uaM5r
 uOacCgJoi9RNx0B70zcNPt6sGyhl7C1lKYWV3qvvKAIMQuFMqjbmRTRS3
 TCZG90J7W1DieImIE88qN8s8RhE+aa9I9KpkdtJPxMMEq5nx375+pyi4e
 u1Ecj0zJK+EpU5e9l6x5ZvtDG4OWBUsYTP5FlFXFljYgGrWq2Ca0EQoqq
 VfaTCzvAA16JTDNtT6s4LQ4XcipMCRv9efOIIaccroCJunkbvfrJhdeMh
 dH1TbSnOTGdvA4lJdDOJyJK6N6DFAbr1BCPDV5a5iXJRQNHiWghwreAEx Q==;
X-CSE-ConnectionGUID: KpPjSdCQSIyChuSyDRI10A==
X-CSE-MsgGUID: K0Fs/TLbQKGnNddeh42v7Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11556"; a="77924697"
X-IronPort-AV: E=Sophos;i="6.18,274,1751266800"; d="scan'208";a="77924697"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2025 21:06:23 -0700
X-CSE-ConnectionGUID: u5v1fnCFSfiwpvVaOoKLMg==
X-CSE-MsgGUID: 75E+HWqSTHifAzO5wlILZw==
X-ExtLoopCount2: 2 from 10.22.229.23
X-IronPort-AV: E=Sophos;i="6.18,274,1751266800"; d="scan'208";a="174542633"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2025 21:06:23 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 17 Sep 2025 21:06:22 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Wed, 17 Sep 2025 21:06:22 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.2) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 17 Sep 2025 21:06:21 -0700
Authentication-Results: dkim=error (no key for signature)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SJ0PR11MB4960.namprd11.prod.outlook.com (2603:10b6:a03:2ac::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.23; Thu, 18 Sep
 2025 04:06:19 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.9137.012; Thu, 18 Sep 2025
 04:06:19 +0000
Resent-From: Lucas De Marchi <lucas.demarchi@intel.com>
Resent-Date: Wed, 17 Sep 2025 23:06:17 -0500
Resent-Message-ID: <mvg2yvnsfoc4m2bxhulkpusbr6mantren4id3sgplm3nuw7gbp@k2aqypnkarce>
Resent-To: <intel-xe@lists.freedesktop.org>
Authentication-Results: smtp.subspace.kernel.org;
 arc=none smtp.client-ip=198.175.65.18
ARC-Seal: i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
 t=1758145077; cv=none;
 b=pVbAXQjWP0cueitVQUKPFGU+Ihim9p0kgeDmwxjtkuU/VSHj7i+JlXTvJWfobscZYoYHlj6Kz5McpTz96vGh6H8NtVexY1hSAj77riJlI1A4XJWhsWRIBQweIdteEe6oV0dT8nIYA2Cp937O9rw2Ms0oBJzDHpBd0CP8bhvjm/s=
ARC-Message-Signature: i=1; a=rsa-sha256; d=subspace.kernel.org;
 s=arc-20240116; t=1758145077; c=relaxed/simple;
 bh=/iMfp8vig0mHKZAxlSf/u9heZ6hDxMUA6/Hx0ZTiPiQ=;
 h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
 MIME-Version:Content-Type;
 b=gPVehpOFNbjHnKfpI8kAGzzyMsfLOjPmcaSF3tEsspiUrCbg1pdzKS/tl656bKcoavfwzdDi+Huld6l0M96n7jxpShJGfg3119IPi2uPbgT0pPPZVB89OLVc5ONwLi4XVH72uUfVm0qJNnCkZ328LLbVCFPAI/IvRyZJZuTugco=
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org;
 dmarc=pass (p=none dis=none) header.from=intel.com;
 spf=pass smtp.mailfrom=intel.com;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b=fk8TaOm4; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org;
 spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="fk8TaOm4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758145076; x=1789681076;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/iMfp8vig0mHKZAxlSf/u9heZ6hDxMUA6/Hx0ZTiPiQ=;
 b=fk8TaOm4RVUcHacYO32rvB4Ek9fVObrvtEOS/4tXWi+GUVt2swMXfYGA
 0/pgSl2nEEKPaHPQz0xmkw/2fz7x2anC+GO+3mmAF9nk6fTdSrCbofMVP
 qIUZOSLKSAqMj0hVKY26uhRnkIohuOrXyB8jaYs/6ZBEpWwxuSGBbx/jk
 iUqB/9OQdoHqDtd8YpOTdBdUqHdtxeNUkFxJ2fqUp7F/2oJORUvvVy14x
 tUaQ0oxwcVLGvHLzf1xFPOz+h4ofd/ivG6DqyUMpMuAPUiC+9REHfmAaw
 21w9nyKWynZfbL5ho1N0UEn+lAgibeaQ8T9MKvfmnjhdFYP+I2Z1/owXP Q==;
X-CSE-ConnectionGUID: aYbaa7CvR36QbNeF16fC+A==
X-CSE-MsgGUID: 7MqWfOHKRmevSiufm/sw1g==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="60522747"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="60522747"
X-CSE-ConnectionGUID: 9fkasHJuSRGIKizPq+iZIw==
X-CSE-MsgGUID: LdqgF4PBQ5SC9hf53RAd3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,273,1751266800"; d="scan'208";a="179643054"
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 stable@vger.kernel.org
Subject: [PATCH 1/3] PCI: Release BAR0 of an integrated bridge to allow GPU
 BAR resize
Date: Wed, 17 Sep 2025 14:37:30 -0700
Message-ID: <20250917-xe-pci-rebar-2-v1-1-005daa7c19be@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250917-xe-pci-rebar-2-v1-0-005daa7c19be@intel.com>
References: <20250917-xe-pci-rebar-2-v1-0-005daa7c19be@intel.com>
Precedence: bulk
X-Mailing-List: stable@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.15-dev-b03c7
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BY5PR20CA0003.namprd20.prod.outlook.com
 (2603:10b6:a03:1f4::16) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SJ0PR11MB4960:EE_
X-MS-Office365-Filtering-Correlation-Id: c24be7c2-3f02-44a6-6e58-08ddf668b8a3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|4022899009;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WTJySTFsVS8wQUNwSHhCWWhPZmNaQm9XTnVPdHhobnl0cElSRlJvbGpYanJl?=
 =?utf-8?B?T1psWWZpQWtybmFYdTNCOWU4N1llcGJZN0hYMHY5MGhnVlRrTDNTRWNFa05j?=
 =?utf-8?B?ZkJxZUhjeGJWbGQ1WFh3cTR2d1luclAwWUVZT2hDRmR2a0FSNVhtZHlnNnJC?=
 =?utf-8?B?c1QwVjlOSG9wYkczUDhzV2hvbGNUVnQwVUZhNHpOZ0l2ZEt1VWhLWHplejZE?=
 =?utf-8?B?Z3RZRy94VEdKRXlveXIxZmNkYjZPaGJKUG1HWnRIaXp4eHU1SmdwK3ExMHhI?=
 =?utf-8?B?WUFFekt0MXlVZjhaUENIVUJGWjV6cUdzSSt1NzRUcHJkc0JGSkdsZDZrY3ho?=
 =?utf-8?B?blpvd2JVd0crUlEraTBVdE1KZmlEL3pSRXhXRWRUcDRsTVlneVR6UlJoWjV4?=
 =?utf-8?B?NERsM1dKNnEycWN4Um9KdWNWd29NTXNoajdGZDlHTW8xL3RBWm1ubmN3WTFy?=
 =?utf-8?B?cTNxZHhrZVpJTzNiMFBsNHJ1Q01vYm9FbFFUKy9xeTJQeVhrVjdaYjREWGVH?=
 =?utf-8?B?azBGbnlhait2ZWVPV2JsYzBROXREeStuT3VIbHAxVDhBL01iYU4yMzZsRU1v?=
 =?utf-8?B?d1RSSGVUbElsNldCUDRuUUZFV2VWck5vMmwrWE84ZjFOZUlUMno5QXZvbmdu?=
 =?utf-8?B?eUhEcXNrTEcrYm1tREVtZWZVczR1ZG1VY3ZabzhqRll0YmZCUU9YSEhEdHFE?=
 =?utf-8?B?RkdHTU5GUzUrNUpDUlliQWRJTTBBWU9YQ0ZsTFNpbnl3dmpwc0V2UTM1d3lF?=
 =?utf-8?B?UHJ5WTdSWUJ0ZkNBeGZkYkZhbWdQTUgyOE4rZWxZL3FrSUNSR1d1T1gra0VJ?=
 =?utf-8?B?dWFZUk13ejhpekVSV3RwNHF5OE00U2hSNEsxSW9nS0MxSnAxVmxMNG4zZjlq?=
 =?utf-8?B?bi9iNDRhUnUvMkV5MkNPeDRaKzZRTHRRdkZsLzhydEcvLzhsa044T0NkcDJE?=
 =?utf-8?B?WWo0R2VTeERFR2JSVjNXNXVleVJqaHNpeHpaRGFraWtaTkdSR0xwRitGVkNi?=
 =?utf-8?B?T2xnNFh4RlQvWkZQcFBxNy9uLzZCMUM2emNUdW1qZ2Q0UzVYM2MyYXpxR29P?=
 =?utf-8?B?U1d0RGFVWGR6OTlJUzVJQ2JpSFFCWGI1QTNCM3ltWEVmMWV2ZEprOS9MMlRq?=
 =?utf-8?B?UUtNbzZpQ0paclQ5VnhnTFNtNlJ5ZW80d3BNOGZEbWQwTytQbkMwRUVtUXM1?=
 =?utf-8?B?ckRpMWh3VXV0TUtjQkZYNHEvZGpYa3lTcXNpakpKWm5MTmtsN1JpdnVMcDJ4?=
 =?utf-8?B?REFVY2pIWmNES29uZG5VZDNFODIwT3ZObVdSM01nSzRyWGE0YzhCWE5NV1Js?=
 =?utf-8?B?aUd1aUlUbDIxNDRzS2d4TlFPN1FGWW5qU3hRbHM1WWN0NW5HN1VaN1IrVGxo?=
 =?utf-8?B?RWt3NDlqdDY5Z3NqUHdCUnVYRHZ6N2RsU1FIZTFzOUdTdFM1U1NZVko3MWNX?=
 =?utf-8?B?U1BaM2lZSXpRc280QTJYaDN4bjVwdDlldGFzQjdQczZ6Sjd6c0h2V3gyaUZL?=
 =?utf-8?B?RlVaYldoc29SVWJYNmp0R2NUd2VqZnJRZHVacEJCZFJIQTQwOEdlZHBWczdu?=
 =?utf-8?B?aHAvVk50NDdnTXk1ajZFZ2FyRFQzeVgyd2R5Skcycys5RVpkVEN2N2NJOERO?=
 =?utf-8?B?N2RFS3YxUkpicTlGcWE4TGUvaDhod25peGEzSmR6RmNjZmVmbVprcjJlNWZH?=
 =?utf-8?B?YmkyNHJUdGcyc0VJV01BZ2dSLzNHMWg5NFdXRkhrQ0ZmZU9aL0R6Wkgrdisw?=
 =?utf-8?B?Q2tpT1lpNTkwandVL3RId3pTLzFSdWhGd1h0aVN1OFB1TVBaelVsZkV6cWFk?=
 =?utf-8?Q?IzHxloSBZ5O4iub4zj+90yQd50v30CpF0IZ14=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(4022899009); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cDJybjAxMytyZzc5c2I2d2NwMjc5RjJqZUZYWUlDdTIzemZLQnZ6QmFTZ3NL?=
 =?utf-8?B?R2ZhbzJJTVhNQzNBekxYaUh4dmMrU1EzNjdWb214ZzZUR2NoZXE4WGpxSjh1?=
 =?utf-8?B?d0hqbkVDc3RPQnRNZnFPcEZiSmUvN3BkVTR4TGZkeStmSy9vTGlhM3ZhN2dW?=
 =?utf-8?B?YW4ybFU4NldFTGJuMlM2ZVM1QlE4ZEJuSEV5aytram9WYldkTStrb2MzZGpr?=
 =?utf-8?B?L0tYdmw5dXNCbEVnMjBjcFQxZnFpSGJnVzBWbHdtRlQ5WElGNkpxNVF4NHI5?=
 =?utf-8?B?MzVRVnRmU21IbWwyazZmTURONzRDVjZFZ2ZFQy9OVVVEdm1GaEJpemc2MUhY?=
 =?utf-8?B?cDR2NTVmZGpHY09IdWxYbFRMQklKSGJTdjhoUkJIN3hMRW1sRVhIY1FRd1Qz?=
 =?utf-8?B?a08xL3QzSm0vTU41YWljZkhtMFRUdy9hZERLZ2tOYmhpdXdjakNET1gzL3hK?=
 =?utf-8?B?YmNBbDFlQjVHbis5QTdkQW5tc3JsTkI2WHpvK3VJZEhkOG1oT0tYU1RiSXBz?=
 =?utf-8?B?ZzZtWEFzRXN5RUFVSHJYL01oRFIwU0RFblRiN2xtQml5NEQ2bk9PNndWSmJv?=
 =?utf-8?B?ZGVwUzNUem1NUUFWOHNSRG4xL09UeFRVT0J2RmF3ZnVJOGRza3hmVnp1SlJY?=
 =?utf-8?B?UjlocERxL3krdi9UbVljVzg2c3BoR0dSbU1ubFdObllMZG4xa1VpTWVZcCtY?=
 =?utf-8?B?UkJTb1JUa282NUhSQW55OUtoRllBN1JkWVFjdEFPSG16M0xSYVRwdk1WNUtE?=
 =?utf-8?B?MW1wWDJIMUtWNXBTdm94NGZ3YXRucGg3bjFpY0RXay9NcmNyeHhsTmE5dy8y?=
 =?utf-8?B?bERBcDVQZHpQZW1mazF3NkxSYlhBMVllWStkeVdlVDdwblNUU25rZXR1eDBu?=
 =?utf-8?B?SHFCak9zQlVXUEJyUVF5RnpaVkpXRUYvVDVDUkJVS2tQMTMwSFpEa2ZjbW5v?=
 =?utf-8?B?Q0d4SmtnS1ZZM2kwS0NMM0V2Nk9DMWlEb3FodzlNa2tpa1JiRkI1cUY5b2pl?=
 =?utf-8?B?akI0Y3R0V3hiQngyaDN3MGF5S2gvYWFIWkJCbXpDUEVxRThKdnI3WDBycjFK?=
 =?utf-8?B?ZThyd05GdzVnYVNlaTRqTGo0UTRvZk81MVBEOUhTMmJUdjZaVmFqQ1hZQzdv?=
 =?utf-8?B?ZW4xY2RzeGFJQ2cwTnI3VnBkdHVhSFFXOGh3aVdvais3TDRVQ1B6NWtkcVJT?=
 =?utf-8?B?aHUxSHB4M084cnQ5U2tpOVlselloZnBJMk1WalpuM1lESzkrZkR5RThUYWZs?=
 =?utf-8?B?R3VuVTlBQW5PU1dKbXdWR3pCbG43QXJscjg3TGFJd3lQZGF6elNQZmJIcitW?=
 =?utf-8?B?R0lLTE5kR0JCd0hZRXlzMGt5dFRtUlcvSEtlUTM5ZnJweGZlODJPSFVnSVVs?=
 =?utf-8?B?cC9Rd2gvOXltTCs0RlpaZkM4bU9YcWZQUDkxbVRkWG1GSHJTTVB6Y0NXTGdD?=
 =?utf-8?B?ajVoRnE4VE5lYWVVTFE3Vkh0T3dUVk9aQTNPNndZUGV5aHBZa1RvOGM0bmVK?=
 =?utf-8?B?SlpjYjN5dGFocGRBUWNZNGZrQmU1cnR0Nnd5ZFo2RnJqQlRCSFUzTVZjK2xH?=
 =?utf-8?B?d2NGaThoRXA2UGRQcDBuMGxvMjFqYjhTdDRaOWU1Q2VMd0sxajFCMTJMNkNp?=
 =?utf-8?B?NCtJZzhHa0d6akdhUDVKV0hta1VHczNSZkU1eWRsRDdzR2hWZ3ppOEs4TGdK?=
 =?utf-8?B?MEE0aisxVnZOSG5qOXlydHE3MjdIWVFpcG9aaFU4NUJZVWZQM0cwYjh1K0Nj?=
 =?utf-8?B?ancydk9yVWtkOUlnZ05wTTMxazZERFY4ejJDVGtxTVVGNGhpdXdnUTZQcUp6?=
 =?utf-8?B?eHFnTmp6T2JoQW1Fekk5K1AzWkt4bUZDSm1GbVpWQ2E2L3dndHpMNHdnczVI?=
 =?utf-8?B?K0k5eHJSeHZyM3I5QmxOUXA4WlE0WWtiYURHMzJjTFo4Sjg0VXp2cVhOY1Rl?=
 =?utf-8?B?Zy8yQmRieTlvUE5veFBKN2hmR28rOW1zUlJxYS9YTmJyc0FBWXNWaUNLN0ds?=
 =?utf-8?B?OFRjZDZycDloaEk3ZE5zZU5YWG1DdW1rYUN5Q1J5b2djbjMxSVlDZ0FKaGo5?=
 =?utf-8?B?M0lONWMza3dEaG0rNXl1bjNNQTJOZS9ZRHpHWjBPV2VyK1FzdkYyRTVkTU5h?=
 =?utf-8?B?UTNBYU5xWUNRcDJPc0dHUjVSbzhPZTdFcXVySUxDM3d3Mk5MeVA3V1c4QU0v?=
 =?utf-8?B?RFE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c24be7c2-3f02-44a6-6e58-08ddf668b8a3
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2025 04:06:19.2564 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: plMP/pLyvmMRTLgWoEzaDmbcAXX+7PzceaDBk6RsLpQL2Wk9IfDXw7AfDeE5hqKrbI2LHeb58wKjUd/9okIW0YJ0Senw0RsjQK/D64+UoeY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4960
X-OriginatorOrg: intel.com
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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

From: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>

Resizing BAR to a larger size has to release upstream bridge windows in
order make the bridge windows larger as well (and to potential relocate
them into a larger free block within iomem space). Some GPUs have an
integrated PCI switch that has BAR0. The resource allocation assigns
space for that BAR0 as it does for any resource.

An extra resource on a bridge will pin its upstream bridge window in
place which prevents BAR resize for anything beneath that bridge.

Nothing in the pcieport driver provided by PCI core, which typically is
the driver bound to these bridges, requires that BAR0. Because of that,
releasing the extra BAR does not seem to have notable downsides but
comes with a clear upside.

Therefore, release BAR0 of such switches using a quirk and clear its
flags to prevent any new invocation of the resource assignment
algorithm from assigning the resource again.

Due to other siblings within the PCI hierarchy of all the devices
integrated into the GPU, some other devices may still have to be
manually removed before the resize is free of any bridge window pins.
Such siblings can be released through sysfs to unpin windows while
leaving access to GPU's sysfs entries required for initiating the
resize operation, whereas removing the topmost bridge this quirk
targets would result in removing the GPU device as well so no manual
workaround for this problem exists.

Reported-by: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: <stable@vger.kernel.org> # 6.12+
Link: https://lore.kernel.org/linux-pci/fl6tx5ztvttg7txmz2ps7oyd745wg3lwcp3h7esmvnyg26n44y@owo2ojiu2mov/
Signed-off-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/pci/quirks.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/pci/quirks.c b/drivers/pci/quirks.c
index d97335a401930..98a4f0a1285be 100644
--- a/drivers/pci/quirks.c
+++ b/drivers/pci/quirks.c
@@ -6338,3 +6338,23 @@ static void pci_mask_replay_timer_timeout(struct pci_dev *pdev)
 DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_GLI, 0x9750, pci_mask_replay_timer_timeout);
 DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_GLI, 0x9755, pci_mask_replay_timer_timeout);
 #endif
+
+/*
+ * PCI switches integrated into some GPUs have BAR0 that prevents resizing
+ * the BARs of the GPU device due to that bridge BAR0 pinning the bridge
+ * window it's under in place. Nothing in pcieport requires that BAR0.
+ *
+ * Release and disable BAR0 permanently by clearing its flags to prevent
+ * anything from assigning it again.
+ */
+static void pci_release_bar0(struct pci_dev *pdev)
+{
+	struct resource *res = pci_resource_n(pdev, 0);
+
+	if (!res->parent)
+		return;
+
+	pci_release_resource(pdev, 0);
+	res->flags = 0;
+}
+DECLARE_PCI_FIXUP_ENABLE(PCI_VENDOR_ID_INTEL, 0xe2ff, pci_release_bar0);

-- 
2.50.1

