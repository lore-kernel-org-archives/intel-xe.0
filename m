Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DE52606A328
	for <intel-xe@archiver.kernel.org>; Wed, 21 Oct 2026 08:58:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=bcsbYKWs
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB80110FCE2;
	Wed, 21 Oct 2026 08:58:12 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E434F10FCE2
 for <intel-xe@lists.freedesktop.org>; Wed, 21 Oct 2026 08:58:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792573087; x=1824109087;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=+yokeXUomVdSquLu7SGD3BUXGU8z40Vi+0iCymEe+RQ=;
 b=bcsbYKWs6ia2R2x/39bPMMIlPcj/SKKVrehg+U0Q2gFAgEKWVi+DblDX
 2LIc5yxlWaK5iZBHNST/AEX1XLDH0daThMEhkkvmABoewhT5H6x9jz0U0
 3mNscvxENWH4kzz4ark6z5F3rizL35Sj/Um3s47UuxqtM9m1IZ1LDOBQG
 WJPpaqCrYRILd1Yko6PFRDlina/MlPgug/uafgsuk0YesrEhEKcJe2MVX
 YBO9hRiQOXzVcxO95WY2GM1d3+RcIOkCBZJPXtN0csiCg+XXeebDlES8q
 n4I7YbfbIYlq2bDbl0c5cpqTNboUhPxdBEpfkckAg7QQFyNVfLsFmHUns Q==;
X-CSE-ConnectionGUID: jzah3XeUQGqQhw3qRKHC9g==
X-CSE-MsgGUID: l1ShFRGXQDCx2lD8v4Gq2A==
X-IronPort-AV: E=McAfee;i="6800,10657,11941"; a="1180844"
X-IronPort-AV: E=Sophos;i="6.27,169,1787036400"; 
   d="scan'208";a="1180844"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2026 01:58:02 -0700
X-CSE-ConnectionGUID: MuWGxh9+SKivEaaOUblZBQ==
X-CSE-MsgGUID: plJPSeQCTaKppQacM8y+CA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,169,1787036400"; 
   d="scan'208";a="3370956"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2026 01:58:01 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 21 Oct 2026 01:58:00 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Wed, 21 Oct 2026 01:58:00 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.40) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 21 Oct 2026 01:58:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m3Foet/gHLkY7wXM8K8dslCxnk2nbJltU/Wn8zXBnB03qZsFbHpPdVqwfX7EEGWwi5c5uPHrI8Y3K1zMHKESQH3lLVCtHpajHGqF0guSZmtAfpAn9W+HxAgTjcKS+z6ejprY6dMs/bL6rYv6vxdK/aNFBFwPQelLTGm3eMMQyLH8kJxVvPIS3FL/r/0Ai8i7S+nJHkgLiRAY3Z5GwDFr/jJ5Esd/fCXOjJXiTFRSGTScVQl1vc+p1bSovZ+2/gAu+OFRSlDV13GZrd0gvLUfhLKxYAZKZzzA28vMK7KBd3KMOu8ciuaHt5g2yTG0VtIOg7Xc+xrWUhrFnbWLG6ssmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u/fIw3RzX24iXl4qh/RoqzYvKEuxsIsDV3K/W0m2dNk=;
 b=lbSW9NmB40XwKksY2fsC6/NMnkqO4GzKC6aMlfDIE5jtd3y+E7ilS23RofJqZd2dprUGPxdpMWzYgEko6ypZhUqxtGxHnz2DKuCILkwQnU4hmg0KWhlGstLLIGgMCzeQ2oj44D36uhOoy1K6Xjk+AQSuJbhgE6E9G4ERu2k/iat0iM1cB1qhiMnOeGA2BHFrLJPiEhp2zwwuPizPXNMtaaBRLbsk5bNTVvZria4VBtpOjYXJ/ch3YtouJqDJ4LaUSWashqvPDsIC7KOVQMoT3k6pO9oi5JN3YNVMy9g2B/JADyEpSx65c5FSyPvXpGULriXF2kF+lJuZZkyMMI+Jug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8039.namprd11.prod.outlook.com (2603:10b6:510:25f::18)
 by DS6PR11MB943645.namprd11.prod.outlook.com (2603:10b6:8:499::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Wed, 21 Oct
 2026 08:57:53 +0000
Received: from PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92]) by PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92%2]) with mapi id 15.21.0546.012; Wed, 21 Oct 2026
 08:57:53 +0000
From: =?UTF-8?q?Pi=C3=B3rkowski=2C=20Piotr?= <piotr.piorkowski@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Maarten Lankhorst <dev@lankhorst.se>
Subject: [PATCH v7 2/5] drm/xe/ggtt: Introduce full GGTT range size
Date: Wed, 21 Oct 2026 10:57:13 +0200
Message-ID: <20261021085716.709503-3-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261021085716.709503-1-piotr.piorkowski@intel.com>
References: <20261021085716.709503-1-piotr.piorkowski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI5PEPF00000983.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:808:1::815) To PH8PR11MB8039.namprd11.prod.outlook.com
 (2603:10b6:510:25f::18)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8039:EE_|DS6PR11MB943645:EE_
X-MS-Office365-Filtering-Correlation-Id: ad8b5b0a-f5c2-4225-9a57-08df2f51647b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|23010399003|1800799024|11063799006|56012099006|261009223027099003|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 7jjfSJfWsecaQR6g2vPzYtMeXoaT8sY4FbGJ9ImlRMvU6NaKbDSV4UDvuB//bLI+x2iyFk1UD/6pzScxoa6aLRi1d0nuSx1b0FY1oC2rWc9wRz/IkSIVm00TzPdRcLEEt3HxQ4malKZ8wmvw3KUnlg2ISx/7k3awI7Q21VsMubZu1S3A2NF1NeT+ApF0ZNUASVT402vGbyDjgtfJjlfvoge7sWd4dv/6Fw+kGriSzDdbD402JVGQjbS87nhf5QsbZRlSrnLe9KIW1YDr7GDvLb13vejs8hCH+BK+2MLja0rrrD+UgrrbKWUwwixK1EM02Ye3K/kLqcVQdcybvr+3GP9ynPjqmPFm/anOfLzQ9DrAK7+exHgsJm5Xuiza985o4Jb5rMA2aj+zOsPjbO4NjCc0EJu0Rm+fBHjZVISmDforDcwN6XBH1a+jCeHHGFlK4yljjc/0Ysg45sSXdNoEek7guw5P5LUBS4bwbvRFEyddTMYIs0DeOqKbZx3xzbOPPh5w5csnSXBK2umoP6V+cwjkOnR2TMjP2QscJicEXJfdM26C4QHeI611V+RiLenai9xy0wydV8yFrZAzYZXnirsFe2rgbUaVnXSXvcA0An7ahPOSOyJb1JmZTnQ4u+RS4hRoQY3Bj9N/h1IPxMH8kIdB20NkdTGrhHaUcAPvycg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8039.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(11063799006)(56012099006)(261009223027099003)(10067099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WE1wZ1BBTUZrWGxPRXhQTmQ4a0lkbHpoeFk5K1lrVG9vbkR6dXpKT3FFNXhh?=
 =?utf-8?B?dVhHZWI2am1KbVp3UW9iYVRmTWsyMko1NlZFbitwT2hmeVZHdHByUmo5YVpm?=
 =?utf-8?B?UUZJTXFlbW5PckJ5dTZCQzFUZXg0M0xaWjNjcHZ2eTFWRFZkYnh6aWdtN1Fq?=
 =?utf-8?B?MEMrTkhFdG5DWWN2azY1V3FYMGdFc3dGVENWK3BBdFlBRmhGZCtoUVk2OXVG?=
 =?utf-8?B?bkYxby81WVc1NGIyZk9xZW02aVhocnRseWpjQVl0dEh1SnhIbEtxS3hCdkl4?=
 =?utf-8?B?cWpXZmpjYnhJUlNNYk5wWVFqT29jRldqZm40Z2w2dXc2cW54UHpUMEMyMGp2?=
 =?utf-8?B?czZ4SVJQSFdSNVA5L1FKNjVCM3ZJQVBJTEp3ZElHekhRNE5IaUw0cnZiQXdF?=
 =?utf-8?B?cjBSL2hrdGl2Q3ZjTWR5dVVjSjkvbExuZG5oSm1TYlJmaW9hN0UxL1pKdnpZ?=
 =?utf-8?B?eDM2NFNGWGNqb1hBUk55c1gzZjRQRnc1ZGtUR1RKWUlJN29lWld5R0FzaFNu?=
 =?utf-8?B?TjhTMGVSM0hRNDBIR1BNekV0TE45Wk5RRklZamxoOFkyRnNnT2thOTFocWcw?=
 =?utf-8?B?WXRIUGJ5RlVTQ1Q4Y2NOdXBLYzlBc3J5dXJCWnFUZWFEK3ZBVG1rcldIcTRm?=
 =?utf-8?B?Sm5UdkM2RTJJVmNCTUNLVEhqeVgzbnNOdmhjSHpMeGl0dlUwU1RtREhOSnZN?=
 =?utf-8?B?WWFpeXhPZ1RsV3p1UUNtSkRzVTlOdW9ZN2FQVnpDMTNFa09WWkdRRldDNDVr?=
 =?utf-8?B?TTJOazE2ZnZSMDBlcGRIZEIzQWhSQmJWYlVXajZ3OEh2K2dGYk1mNmxTRE9z?=
 =?utf-8?B?VlVjc0hJTFpYMzcvcjBsQTFGTzB0aUdDTEl6TDB6RWV1R2d5L2NFUzJ1NEdz?=
 =?utf-8?B?SGhBaHRzQ29NdThaYjh3TTJZaGNhcHY5TDhXTVBRWGdiUWdTT09vZ0t1L1NL?=
 =?utf-8?B?blhpUkZQekF0OGpaUGpSSGFtTjllT3FiUVNabzBWQmhCWlAzSXhySk43SmRL?=
 =?utf-8?B?VTRYSjkzeWo4d09RcEZBbktYbVl1bVN5S1BmeW9tSk1yRWFVbkY4WCtOenRU?=
 =?utf-8?B?Y2g5MmdoOWUvVEovMnZ3SFBiY085bXEzM1F1bkx4NGxtOHdXZmNobTBTSllq?=
 =?utf-8?B?UEhudE8rWEwyTWhlQ1J0a05IQU0vajU4c1FINWJCbE5URk41OUx2YzJJVVR5?=
 =?utf-8?B?VktQVmxPMWRZK1RENmt4amtqamUrUWI5RkhrZFZ5RW9KQndJR0s2ZHEyc254?=
 =?utf-8?B?UUdBQTQrVUZRd1J1aklIZWNVclB4OElXMkhxOEtpSmlrSXlobHBEV2VIck9u?=
 =?utf-8?B?a01XcWtTTmQwMTFvalM3bDZXYVhDbEVCSDIrNkNBRWZTazlBZ01PZzRncGRN?=
 =?utf-8?B?dWFRaUxya0hMaEVKeVoxSGRTend0ZUhrTXErUGdON2p0YXo1NzNBeE9yUld5?=
 =?utf-8?B?TXBDclBJQnFyZHA0ejBZQkNwU0g3RjFac09RczdqaXRSUDJrNkYzY05wUlU1?=
 =?utf-8?B?cGxtUEJLVHp1NmhZN2dHSGRqRDRRbHdzZHNMWUhER2NGMXVMK3JkVVVrUDBn?=
 =?utf-8?B?S3dxbFY1RHB3K2tGempncFNld0dRdHJXWGtSTHdocnVod3kxcFVNQkxPcElD?=
 =?utf-8?B?L0JJSVVCN2wrS3ppRlY2dWJPanpWL2szMEJ2ZGFjK1U4akIwVUpjODZRc0Va?=
 =?utf-8?B?cTR1YlN4UjJnUXc2cXc4dWd2L2FlNERva1lqY3pBdkE0WUNZcFFPK0JTRkE0?=
 =?utf-8?B?NXlhempsdW9vZWFXZTNGc201NHpGWTFMb3AremREa3dkZnBsaW5XSG5EcEZ4?=
 =?utf-8?B?VThMcHNEdmd0eFFQZmRtVGFWZ2ZLdmRHVXV2S3h2KzhnVWZJQVpPOGE3Y0R0?=
 =?utf-8?B?ZSs3SG9nNFp3Z3JlRjU3S1J6czMzMjQ0ZHQrRk8wUmtYWldmWHFvdkcwL0hT?=
 =?utf-8?B?ZmFVNW1yYkk5KzVoODhUOS9UNHpKa3gyNXBWcWV3aTZBQmM2ZVBUSmZwZ2Jm?=
 =?utf-8?B?cm8vMjd2MURwNUtTY0dMTG9vc29YN0tkU2p0TnBaVWFCK29jSFIyajdhQk95?=
 =?utf-8?B?eDFYQWhkc1VzSjI4cHowYXdEZ0FWQVA4ZnNxQ2QveGtaak9CNnc3MitiMjgz?=
 =?utf-8?B?ZHNQSmkwQ2VTZnJiNXk3cnBKZVN6RkhPRHZZSm5OKytLbkdJeWkzRldoMDJy?=
 =?utf-8?B?cHYzSUc3NkdFRGpkWnJPMHU2V1FqUUxGVFA2UTNCN2cwSmJtMVU4ZjRjU3R1?=
 =?utf-8?B?WjNvU2hrb0ExUm9nblAyOU9kVHowSzNxdXFVK3ROR0hOU2hQRzhQUHpwQSs0?=
 =?utf-8?B?ODBoS2VoYTlKbW1ZNVNhM2FReHl0eXp6TEJRQ2xjRFNsemI0RDFPb2J1bGJ3?=
 =?utf-8?Q?0BS1KvWBB/PQw+VQ=3D?=
X-Exchange-RoutingPolicyChecked: bHmyJYRjhRYtwGXbM8lCfxdGfGukIsluhaq8G3buXFmHebVn/vc4MWLtv0DHDiPIYMlfQY9DvPnSpzo8LKIwHzG7TFYwk5muyTJ8pyqUMFXNXodsVa+CXK7rrijGbcwnCbtzLLdEptnWJBAELOotd8wcb/diKxcxmWieHGwiLRJdptcLvZODdjNNuQTeD6Qxa3oooIugfhtIxfVPRwZA8V5uYdDQyjOrhLA3X8e92WGGaXGzqlWTvV8Hkhre1hh3fMKE46jll/Ax6MtBl6lwh18yTnbEYqq6br1ogruRaRLwwlTcY77FEtQBdvZ7F6XbpEHAmQh4qIssNFASlIESgw==
X-MS-Exchange-CrossTenant-Network-Message-Id: ad8b5b0a-f5c2-4225-9a57-08df2f51647b
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8039.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2026 08:57:53.7130 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i9fduvHEOg/W4yHCfpv4XP2mvcMI+bLs+Quj/0Oq+xTL9jrJY6W3UYBEL1VPFuQmlKQLbTw7pnlzkKNBnDpcBeyf1YQs6cUUF5EqULt0+zg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS6PR11MB943645
X-OriginatorOrg: intel.com
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Piotr Piórkowski <piotr.piorkowski@intel.com>

Separate the full assigned GGTT range size from the size available for
regular allocations.

For now both sizes are identical. A subsequent change will reserve part of
the full range for VF provisioning.

Assisted-by: Claude:claude-5-sonnet
Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Cc: Maarten Lankhorst <dev@lankhorst.se>
---
 drivers/gpu/drm/xe/xe_ggtt.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
index 2d890fe74c1b0..533c60446aebe 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.c
+++ b/drivers/gpu/drm/xe/xe_ggtt.c
@@ -113,9 +113,11 @@ struct xe_ggtt_pt_ops {
 struct xe_ggtt {
 	/** @tile: Back pointer to tile where this GGTT belongs */
 	struct xe_tile *tile;
-	/** @start: Start offset of GGTT */
+	/** @start: Start offset of the assigned GGTT range */
 	u64 start;
-	/** @size: Total usable size of this GGTT */
+	/** @full_size: Full size of the assigned GGTT range */
+	u64 full_size;
+	/** @size: Size of the GGTT range for regular use */
 	u64 size;
 	/**
 	 * @flags: Flags for this GGTT.
@@ -241,7 +243,7 @@ static void xe_ggtt_set_pte(struct xe_ggtt *ggtt, u64 addr, u64 pte)
 {
 	xe_tile_assert(ggtt->tile, !(addr & XE_PTE_MASK));
 	xe_tile_assert(ggtt->tile, addr >= ggtt->start);
-	xe_tile_assert(ggtt->tile, addr < ggtt->start + ggtt->size);
+	xe_tile_assert(ggtt->tile, addr < ggtt->start + ggtt->full_size);
 
 	writeq(pte, &ggtt->gsm[addr >> XE_PTE_SHIFT]);
 }
@@ -256,7 +258,7 @@ static u64 xe_ggtt_get_pte(struct xe_ggtt *ggtt, u64 addr)
 {
 	xe_tile_assert(ggtt->tile, !(addr & XE_PTE_MASK));
 	xe_tile_assert(ggtt->tile, addr >= ggtt->start);
-	xe_tile_assert(ggtt->tile, addr < ggtt->start + ggtt->size);
+	xe_tile_assert(ggtt->tile, addr < ggtt->start + ggtt->full_size);
 
 	return readq(&ggtt->gsm[addr >> XE_PTE_SHIFT]);
 }
@@ -361,6 +363,7 @@ static const struct xe_ggtt_pt_ops xelpg_pt_wa_ops = {
 static void __xe_ggtt_init_early(struct xe_ggtt *ggtt, u64 start, u64 size)
 {
 	ggtt->start = start;
+	ggtt->full_size = size;
 	ggtt->size = size;
 	drm_mm_init(&ggtt->mm, 0, size);
 }
-- 
2.34.1

