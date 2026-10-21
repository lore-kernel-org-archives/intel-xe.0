Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D15A60A2610
	for <intel-xe@archiver.kernel.org>; Wed, 21 Oct 2026 08:58:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Q/55EZqB
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50B2C10FCD8;
	Wed, 21 Oct 2026 08:58:08 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C04E210FCD8
 for <intel-xe@lists.freedesktop.org>; Wed, 21 Oct 2026 08:58:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792573082; x=1824109082;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=29LunKUn49jKZIUmKUulALR+ZQm/8E0JXaOJhdp6U5I=;
 b=Q/55EZqBERHAnLFvkGOtvOrZ+LCgtb7ksdJ39WE9RzURtl8XX0sveJXZ
 fGEtfJvIgVqlqdnmFOnJF3/LqBZ5QifkkfmulE6V+00HFOrWs8din9jnr
 IG8UOg0zVRAgcZ18h3TD97+97f04C3vzkXOGsyAolypTy6sU8FX+HhJNl
 YvsAAzrb5RKYOJuKVyOti63xiumslYD/+qVLqkAIdyO/JoLc4DsNJzq0k
 mXtD2vPE4Re+HlrmLo+bw9oa7NAW6IoLih7DLwgr9JQmZynevyp61YMUC
 vvBGLqJFyJgsPWZcz8l/4BVOGwX9QZJjvBiQksS6PyK02mqaQPoE8ZI+v A==;
X-CSE-ConnectionGUID: MASlw6MNR6avzJvtulTk2A==
X-CSE-MsgGUID: G6ahxBCfTdW1JjXyiSOtIg==
X-IronPort-AV: E=McAfee;i="6800,10657,11941"; a="1180842"
X-IronPort-AV: E=Sophos;i="6.27,169,1787036400"; 
   d="scan'208";a="1180842"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2026 01:58:01 -0700
X-CSE-ConnectionGUID: YYVuTQW5SKWgOQUHlS84hQ==
X-CSE-MsgGUID: reoPl/ETTJGTXe9XkhTXBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,169,1787036400"; 
   d="scan'208";a="3370955"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2026 01:58:01 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 21 Oct 2026 01:58:00 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Wed, 21 Oct 2026 01:58:00 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.22) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 21 Oct 2026 01:58:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=api9Y1IYjOwouMnazypGFoSVAmX2qakLa1L5RHpT3Tz9gJDDCn8uFNIcYxmWldYpVgotBHdqlZbnG3x8rR+HC09H4S3VWdYknAc2SpWvnqzqu4ykOrJKimIlRGNxzRsdT9ky3iW8n3kWzi4fbkvAsLTrlnhJH7QkMUoZuDedh3eWjkM3fF7hiRI4MKK/gYT5uVIXWYSBgj4ijbAaGyLqUStCMaZcKQnO7JQF8Gqav+bWs2aLEPlID3LHZRth8PI1p7+rLYJrTMfUo4yq9VA3X/5m2xPBO8LhHqkVqP2HjjYi8eV4wyuiHaCMWzvncA5fADOabDxxokNbONeXhyEalg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7jBwm3/4Rm/HfVn08ABEXLaK2Akj2sI8q0Xi6IyGRjw=;
 b=Yxc0mqvPj4jcqaDLyoJdZPQav7slw+30+wIpgWccZBH2p3H/fjCTbLgVVr9rTSWO6ujiwMRG98klTpBCufFuGhSJM+u2ACh0io25LiojZHbyDIbEK3x4UGr1c12jH2VtgQOWzE6j1VJHzsnccGCKJjmwJ0v+Qwmb74jluAUtdfbWMT1AaM6/TjdhldRsgSKRDcDpeAtuL0hx/5uO0HFX9+txHwj0XV11pfW/UiTuMZY5CorJs94vLzp6OGhGJP1gTQM/y1DexPHeu7TqHrtm1kdE7y0raGjJkU71fOlI/VgsCyc5HagwhwzowZ5TVihUTq+IB7/lmnXc8bArGAlL/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8039.namprd11.prod.outlook.com (2603:10b6:510:25f::18)
 by MW4PR11MB7078.namprd11.prod.outlook.com (2603:10b6:303:219::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Wed, 21 Oct
 2026 08:57:58 +0000
Received: from PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92]) by PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92%2]) with mapi id 15.21.0546.012; Wed, 21 Oct 2026
 08:57:57 +0000
From: =?UTF-8?q?Pi=C3=B3rkowski=2C=20Piotr?= <piotr.piorkowski@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Maarten Lankhorst <dev@lankhorst.se>
Subject: [PATCH v7 3/5] drm/xe/ggtt: Split GGTT into usable and shareable pools
Date: Wed, 21 Oct 2026 10:57:14 +0200
Message-ID: <20261021085716.709503-4-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261021085716.709503-1-piotr.piorkowski@intel.com>
References: <20261021085716.709503-1-piotr.piorkowski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA1PEPF00005B96.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d8::633) To PH8PR11MB8039.namprd11.prod.outlook.com
 (2603:10b6:510:25f::18)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8039:EE_|MW4PR11MB7078:EE_
X-MS-Office365-Filtering-Correlation-Id: c4f250f5-874c-4f62-ad45-08df2f5166bd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|23010399003|56012099006|11063799006|261009223027099003|10067099003|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info: gzNDVcMow6qPs8Fvajqp0UtBf0x7CPLrmiGy9gYH9IWmI7cwQ7EPZvCSbmJvzVjxmJ3otUCtfRZYjKwfFXvkc52S6/6wZDMU1qLEBCxnOHKkiCyy/6HGahvqqweV7f1uLz/bRF37lrbyNmPK+ijONRIc85UxaDmWY9FfIA6fhlS1vxFtagS9G1tNXLJspW6oQlkRcIxI2f0cUsHbcLBUkZcp8xllZNYv3/0RHjI4hs460t02MC4ZbWPG8Jq0BykbPX7OEtjgSmp8497NtdzKdwq1FFbolJaoBqKh3eiYVuRAr1Fya04sG//KnKYq06LMGyIDyce6BTbGPvlE51zPpOVbHmXl7V332yOOeiPNyRQwhx+wZCDXOku3qr4mjfqT7UqrktPQNWLXIxT+O0zbS/hMHTpbvqoxUrcqItiIgD5MfGyXbEaE4/k+FRyUErPvcQLZxFuKk+TYMtLGYao0NFXp854I0A3duwpSm3VDCCuLWYHJOEvDDMQTr/gmL94rjX4px8LooJEJxo8yxorXGFfOjDhxOLJIOqTx8VMqD/eO39o2YnNCceD2K9/0NtKcgEMQ+v/u4lDkhnY0/9OwGCOR7iDQYn5qNsINhJ9MlAQpVPChPNAUJn9LFjnNNTyEiy275ExRx7Yl5uppEEad5X8msdmjgz22xQP+MjdWYMI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8039.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(56012099006)(11063799006)(261009223027099003)(10067099003)(22082099003)(18002099003)(6133799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RkhUMzBlT20vUW5aSW9jMVVXMnArWVRsd3Z6bDBNeno4bXdoV3ZadFYzb1Y1?=
 =?utf-8?B?VERYRTAwNzRWeXdKVDNUVlU2cTFJOEhtcC9WM2JOYlpwcGxnQ0xha0oyMkZr?=
 =?utf-8?B?MkpaWU5CUnZqWkQ0VjdvKzkwY0VwckowNE5obFg3WXZqMFRacEx5eVlXb2U5?=
 =?utf-8?B?c05UcmFSSmR6MmlJeUlqWU9pd29lRC9hbnJxNFM4K0JoRm5Jd3VTQ05uNUlM?=
 =?utf-8?B?aVllVFRBR3V0UDNHWVc4SlhqN1JyeUlyTktpMWRmQ3lBNENkNitLNi8vS01t?=
 =?utf-8?B?RU5wdGIyMmI1cStCN2tVQU9ES3V5NlZpMmh0cUFySUxzYkJsUTA5djJsQzI3?=
 =?utf-8?B?QUdnQ09oVVB6L0lKanRKQzB4RGNTWElpaGtVUzk0b0FSTmF6NjlROHpLS3NP?=
 =?utf-8?B?MERNVjFxL28ySG11azBOS3RYNG55RDYzcHV5WGliZjVOL1BneVh5S2pEem5Z?=
 =?utf-8?B?cmNpbDZIZHkxWlNJcDRuaHVETXZQVTA3SlRjdHF4UHFaS0FsR0NrZFNMRGtG?=
 =?utf-8?B?czcwR3c2c0ZJb1c2MHNHR1VUbVVmUU5kUExPT0VZS1VWVVlRMEMvTDNhb2pO?=
 =?utf-8?B?SHg3WUM5eUtQVWdUSzNhdmV4YXlXTDU4TlFkcTN1VTdXaVJuNW1WNi8yQU5l?=
 =?utf-8?B?dldYNmYyd3NyeTRHUGl4ZENZTnpId2ozb0RvajA3bGNXdVVYUnlSbW92R28w?=
 =?utf-8?B?VlM4REEvRW1MdytvWW9Sa05ka0xYTEw2YitrL0tIYzlRRkpEd241RVlseHZ3?=
 =?utf-8?B?SlpQOFRDR3hVWWI0dkJFak1GWEZVNjNDQXpnczZPaUVpUUppcjFiQmtFWGFo?=
 =?utf-8?B?blU5RW1DNFdzZkwxeEpNUE56a3NDTHI4THBUUlBzcTFYNzFGNmgxU1ZMMU5G?=
 =?utf-8?B?eWhpVm5lRDZyWDNITUxrUGMrN3JZWjlSOVRsWEdlS3BsLytaY3V3Y3FsbGJs?=
 =?utf-8?B?OTRDL2RVVktQbkg4Q2pMOWxmbGtEc1NpdHQ0QzFISmRyRiswRzZSQWFhSnVH?=
 =?utf-8?B?QXZ5VGlLcFR6K3ErcVZqVkRwVlhLQmM4Q3NMUUNuU1VuS3ZSZXl0cG02Q3B3?=
 =?utf-8?B?TXB5VWdrVkUwQXI1REdyVU9kM1JVWEdzZzhHR3NWYng0U2RRVVNFMmxVU3cw?=
 =?utf-8?B?cFIyRnNlUGtuSTJPMjh6bmdnc3dHK0k0ZXFFemIyTERieGdYYlI0TnNNYnJm?=
 =?utf-8?B?UTJuMHlhMVVlQTJXdHBIT1ErejA3ZDc1TnJwVVZGeDg4UllvUEVZTER2RWZr?=
 =?utf-8?B?d2lrWDhaR0VIMUFyOGtMaGhHUU9oUXF2eHJkVXdoZWNidS8vdXNFV3BPZWdu?=
 =?utf-8?B?bVFKWUVtdFJocDMwL1ZYVWZVT1JUQllSclVGZlhNYVQvak5pdjZFbDBVUmM5?=
 =?utf-8?B?cGw5RXRCR29SVjZ6akhIck11WmVsa016WUFydnVYRGtyc0ZUdFJhQlM2U0V3?=
 =?utf-8?B?bGc5TnNTTmlzVU1ETXhJSzl5b24rb0pVbUNoTmtwcTgzWEowM2hYUmlPb1V0?=
 =?utf-8?B?QkFzSXlEMTk2RmJkN0JkMEpkWkNmVmo4a2Nyd09Bc0tvSjB0MTFhRzFNbm53?=
 =?utf-8?B?VjdTNTFtekpQRzducVdITlVhU1g5Vi92RDZ4WFJMWFVZUXlGUkhmZ3NYV2JL?=
 =?utf-8?B?aGNsZFd2RGJRakRaSENwWWlGYjdVK1pIVUtGcmhFemlYa1lFbXNGRldGL1o4?=
 =?utf-8?B?VTcyak5GYklkeUpPR1RtTGZDbzF4WS92LzhxWG1McGFsUmtTTzBOck1tU3JJ?=
 =?utf-8?B?dk5JQzlDNXg5MkduYXl0T2VlZUwrTkNURjVrUTBoM1g3U3MwNmYza2xCeVNY?=
 =?utf-8?B?a1FqQ1N1TGtPMjFZOGZyM1plSm44alZLSXlrNHFETVhhZ0N3R0ZYZUVZSE5Z?=
 =?utf-8?B?eGpZZkZCYURyN0FUMmVUM2N1M2RYaUgrbGk1b1UxdC9sNCtVUkdGS3VlT2tJ?=
 =?utf-8?B?dHpYdlhUeWZoWW83a0JkeTJLcjVxbzBqM1N4bk1MRmNITDdRZjUrM0gwMmFw?=
 =?utf-8?B?NXFicDExdTdxU0s3TGRIRzBtWWZuanNtdEo2d3NSMGY3b0JVVEhQV0pYRGhW?=
 =?utf-8?B?QlZXdDdHLzJPTkNJS2RCekhyTDZObVJZMkdjZ3ZYNWdPcjlRZjl5SUhMSHFC?=
 =?utf-8?B?ZGtTSGFhZG9BNU9XSi84d1JwT25hbU8zRnd2N0NqUVc3ZTZjWmYyeHh4b2pn?=
 =?utf-8?B?ZlhLU3pjcDVkaHFUZDNVdWNDWkJudEJvajJFSGkyS25qT0swc3dseExMd0VR?=
 =?utf-8?B?dFZ6UVVBdW1zWnVxTmxhWFgzSTQxcGFUQmFLeDhEc1g2S2pQdlMwdEhtdWta?=
 =?utf-8?B?MExRU0dMbFRuUkFlZzR5K3hKeFBsdTZCeFRFNVJPR1ZoQmkwSmRUOWVIamNr?=
 =?utf-8?Q?3x4dRsiJyRpph4tg=3D?=
X-Exchange-RoutingPolicyChecked: mmABRZsPHQSc7z80srNJ8n+5RGuRkPq8xGAlS4YFhOp5owJVLfDChwfoW0bXNCh/XWOxciIqRgAtERkB+xexEyPA/zaYxZGXGc1SUymdyhWuory5MYBWz8SLoWTm6eA5qzEra4XTJF/Lt0U2rA7iIz4cRtbwtXwK4RCoH+hNmuckSB23vEmqnGAJquN+k0YAHPCvet5INYEFkesEvZTr1MvP12s3UIUSLsHv8qoozpexujHREc6DiozLpemTAFlePUdyc/jTUNZAoTCNe6JJJGf5DmuKsmVIkqLInY8v6m/uBHBWW3997QrnZnJZ2nhkb/M+OMP+KjWnb3moE4CCqA==
X-MS-Exchange-CrossTenant-Network-Message-Id: c4f250f5-874c-4f62-ad45-08df2f5166bd
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8039.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2026 08:57:57.3145 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MIRN5USu3W3f/YOnGepSGL0EtaMzc+Q4/gfefJDzVW48Z5rN2XmBFsUN7dh/mTnUt8Jq21K1Z2wRG9jeqj7JQ39k7XtXyvxD1sdbsFXqeQo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB7078
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

Driver-owned GGTT allocations and VF provisioning currently use a single
GGTT pool. Split it into a usable pool for driver-owned allocations and a
shareable pool for VF provisioning.

The pools are separate logical ranges and may overlap, but allocations are
limited to the configured size of their corresponding pool. Allocate from
the bottom of the usable pool and from the top of the shareable pool when a
shareable pool is present.

Add separate insertion APIs for the usable and shareable pools.

v2:
 - Rename ggtt->usable_size back to ggtt->size.
 - Remove the ggtt_insert_node_in_range() helper.
v3:
 - Introduce the full_size struct field instead of the ggtt_accessible_size
   function.
v4:
 - Set the shareable pool size only for SR-IOV PF,
 - Return -ENOSPC instead of asserting when a large BO no longer fits after
   end is clamped to ggtt->size.
v5:
 - Move range initializer rename and full_size parameter here.
 - Use shareable_size and compute the shareable start on demand.
 - Constrain regular allocations to the usable pool.
v6:
 - Rename ggtt_shareable_start() to ggtt_shareable_offset(), as it returns
   an offset within the GGTT range, not a GGTT address. (Tomasz)
 - Explain why the pool sizes are checked separately. (Tomasz)
 - Drop the guard() conversion in __xe_ggtt_insert_bo_at(), so the GGTT
   lock is again released before the invalidation. (Tomasz)

Assisted-by: Claude:claude-5-sonnet
Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Cc: Maarten Lankhorst <dev@lankhorst.se>
---
 drivers/gpu/drm/xe/xe_ggtt.c | 157 ++++++++++++++++++++++++++++++-----
 drivers/gpu/drm/xe/xe_ggtt.h |   4 +
 2 files changed, 141 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
index 533c60446aebe..ad4180400a8bd 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.c
+++ b/drivers/gpu/drm/xe/xe_ggtt.c
@@ -145,8 +145,19 @@ struct xe_ggtt {
 	unsigned int access_count;
 	/** @wq: Dedicated unordered work queue to process node removals */
 	struct workqueue_struct *wq;
+#ifdef CONFIG_PCI_IOV
+	/** @shareable_size: Size of the GGTT range reserved for sharing with VFs */
+	u64 shareable_size;
+#endif
 };
 
+#ifdef CONFIG_PCI_IOV
+static inline u64 ggtt_shareable_offset(struct xe_ggtt *ggtt)
+{
+	return ggtt->full_size - ggtt->shareable_size;
+}
+#endif
+
 static u64 xelp_ggtt_pte_flags(struct xe_bo *bo, u16 pat_index)
 {
 	u64 pte = XE_PAGE_PRESENT;
@@ -360,17 +371,35 @@ static const struct xe_ggtt_pt_ops xelpg_pt_wa_ops = {
 	.ggtt_get_pte = xe_ggtt_get_pte,
 };
 
-static void __xe_ggtt_init_early(struct xe_ggtt *ggtt, u64 start, u64 size)
+static void ggtt_init_ranges(struct xe_ggtt *ggtt, u64 start, u64 full_size,
+			     u64 usable_size, u64 shareable_size)
 {
+	struct xe_gt *gt = ggtt->tile->primary_gt;
+
+	xe_gt_assert(gt, full_size);
+	xe_gt_assert(gt, usable_size);
+	/*
+	 * The usable and shareable pools are separate logical ranges within the
+	 * full range and may overlap, so each is checked against the full size
+	 * on its own. drm_mm keeps the allocations from both pools apart.
+	 */
+	xe_gt_assert(gt, usable_size <= full_size);
+	xe_gt_assert(gt, shareable_size <= full_size);
+
 	ggtt->start = start;
-	ggtt->full_size = size;
-	ggtt->size = size;
-	drm_mm_init(&ggtt->mm, 0, size);
+	ggtt->full_size = full_size;
+	ggtt->size = usable_size;
+
+#ifdef CONFIG_PCI_IOV
+	if (shareable_size)
+		ggtt->shareable_size = shareable_size;
+#endif
+	drm_mm_init(&ggtt->mm, 0, ggtt->full_size);
 }
 
 int xe_ggtt_init_kunit(struct xe_ggtt *ggtt, u32 start, u32 size)
 {
-	__xe_ggtt_init_early(ggtt, start, size);
+	ggtt_init_ranges(ggtt, start, size, size, 0);
 	return 0;
 }
 EXPORT_SYMBOL_IF_KUNIT(xe_ggtt_init_kunit);
@@ -447,7 +476,8 @@ int xe_ggtt_init_early(struct xe_ggtt *ggtt)
 	if (!ggtt->wq)
 		return -ENOMEM;
 
-	__xe_ggtt_init_early(ggtt, ggtt_start, ggtt_size);
+	ggtt_init_ranges(ggtt, ggtt_start, ggtt_size, ggtt_size,
+			 IS_SRIOV_PF(xe) ? ggtt_size : 0);
 
 	err = drmm_add_action_or_reset(&xe->drm, ggtt_fini_early, ggtt);
 	if (err)
@@ -641,6 +671,11 @@ static void xe_ggtt_invalidate_engine(struct xe_ggtt *ggtt)
 	ggtt_invalidate_gt_engine_tlb(ggtt->tile->media_gt);
 }
 
+static inline u64 xe_ggtt_bottom(struct xe_ggtt *ggtt)
+{
+	return xe_wopcm_size(tile_to_xe(ggtt->tile));
+}
+
 /**
  * xe_ggtt_shift_nodes() - Shift GGTT nodes to adjust for a change in usable address range.
  * @ggtt: the &xe_ggtt struct instance
@@ -652,24 +687,63 @@ static void xe_ggtt_invalidate_engine(struct xe_ggtt *ggtt)
  * This function may be called multiple times during recovery, but if
  * @new_start is unchanged from the current base, it's a noop.
  *
- * @new_start should be a value between xe_wopcm_size() and #GUC_GGTT_TOP.
+ * @new_start should be a value between the GGTT bottom and #GUC_GGTT_TOP.
  */
 void xe_ggtt_shift_nodes(struct xe_ggtt *ggtt, u64 new_start)
 {
 	guard(mutex)(&ggtt->lock);
 
-	xe_tile_assert(ggtt->tile, new_start >= xe_wopcm_size(tile_to_xe(ggtt->tile)));
+	xe_tile_assert(ggtt->tile, new_start >= xe_ggtt_bottom(ggtt));
 	xe_tile_assert(ggtt->tile, new_start + ggtt->size <= GUC_GGTT_TOP);
+#ifdef CONFIG_PCI_IOV
+	xe_tile_assert(ggtt->tile, ggtt->shareable_size == 0);
+#endif
 
 	/* pairs with READ_ONCE in xe_ggtt_node_addr() */
 	WRITE_ONCE(ggtt->start, new_start);
 }
 
-static int xe_ggtt_insert_node_locked(struct xe_ggtt_node *node,
-				      u32 size, u32 align, u32 mm_flags)
+static int ggtt_insert_node_in_range_locked(struct xe_ggtt_node *node, u32 size,
+					    u32 align, u64 range_start,
+					    u64 range_size, u32 mm_flags)
 {
-	return drm_mm_insert_node_generic(&node->ggtt->mm, &node->base, size, align, 0,
-					  mm_flags);
+	struct xe_ggtt *ggtt = node->ggtt;
+	u64 range_end = range_start + range_size;
+
+	lockdep_assert_held(&ggtt->lock);
+
+	if (!range_size || range_end <= range_start)
+		return -EINVAL;
+
+	if (range_end > ggtt->full_size)
+		return -ERANGE;
+
+	if (size > range_size)
+		return -ENOSPC;
+
+	return drm_mm_insert_node_in_range(&ggtt->mm, &node->base, size, align, 0,
+					  range_start, range_end, mm_flags);
+}
+
+/*
+ * When the shareable range is present, allocations start from the bottom
+ * to leave space at the top; otherwise they start from the top.
+ */
+static u32 ggtt_usable_insert_flags(struct xe_ggtt *ggtt)
+{
+#ifdef CONFIG_PCI_IOV
+	if (ggtt->shareable_size > 0)
+		return DRM_MM_INSERT_LOW;
+#endif
+	return DRM_MM_INSERT_HIGH;
+}
+
+static int xe_ggtt_insert_node_locked(struct xe_ggtt_node *node, u32 size, u32 align)
+{
+	struct xe_ggtt *ggtt = node->ggtt;
+
+	return ggtt_insert_node_in_range_locked(node, size, align, 0,
+						ggtt->size, ggtt_usable_insert_flags(ggtt));
 }
 
 static struct xe_ggtt_node *ggtt_node_init(struct xe_ggtt *ggtt)
@@ -686,12 +760,12 @@ static struct xe_ggtt_node *ggtt_node_init(struct xe_ggtt *ggtt)
 }
 
 /**
- * xe_ggtt_insert_node - Insert a &xe_ggtt_node into the GGTT
+ * xe_ggtt_insert_node() - Insert a &xe_ggtt_node into the GGTT
  * @ggtt: the &xe_ggtt into which the node should be inserted.
  * @size: size of the node
  * @align: alignment constrain of the node
  *
- * Return: &xe_ggtt_node on success or a ERR_PTR on failure.
+ * Return: &xe_ggtt_node on success or an ERR_PTR on failure.
  */
 struct xe_ggtt_node *xe_ggtt_insert_node(struct xe_ggtt *ggtt, u32 size, u32 align)
 {
@@ -703,8 +777,45 @@ struct xe_ggtt_node *xe_ggtt_insert_node(struct xe_ggtt *ggtt, u32 size, u32 ali
 		return node;
 
 	guard(mutex)(&ggtt->lock);
-	ret = xe_ggtt_insert_node_locked(node, size, align,
-					 DRM_MM_INSERT_HIGH);
+
+	ret = xe_ggtt_insert_node_locked(node, size, align);
+	if (ret) {
+		ggtt_node_fini(node);
+		return ERR_PTR(ret);
+	}
+
+	return node;
+}
+
+#ifdef CONFIG_PCI_IOV
+/**
+ * xe_ggtt_insert_node_shareable() - Insert a new node in the shareable GGTT range
+ * @ggtt: the &xe_ggtt into which the node should be inserted.
+ * @size: size of the node
+ * @align: alignment constrain of the node
+ *
+ * Allocations always start from the top (DRM_MM_INSERT_HIGH).
+ *
+ * Return: &xe_ggtt_node on success or an ERR_PTR on failure.
+ */
+struct xe_ggtt_node *xe_ggtt_insert_node_shareable(struct xe_ggtt *ggtt, u32 size, u32 align)
+{
+	struct xe_ggtt_node *node;
+	int ret;
+
+	if (!ggtt->shareable_size)
+		return ERR_PTR(-ENOSPC);
+
+	node = ggtt_node_init(ggtt);
+	if (IS_ERR(node))
+		return node;
+
+	guard(mutex)(&ggtt->lock);
+
+	ret = ggtt_insert_node_in_range_locked(node, size, align,
+					       ggtt_shareable_offset(ggtt),
+					       ggtt->shareable_size,
+					       DRM_MM_INSERT_HIGH);
 	if (ret) {
 		ggtt_node_fini(node);
 		return ERR_PTR(ret);
@@ -712,6 +823,7 @@ struct xe_ggtt_node *xe_ggtt_insert_node(struct xe_ggtt *ggtt, u32 size, u32 ali
 
 	return node;
 }
+#endif
 
 /**
  * xe_ggtt_node_pt_size() - Get the size of page table entries needed to map a GGTT node.
@@ -795,6 +907,7 @@ void xe_ggtt_map_bo_unlocked(struct xe_ggtt *ggtt, struct xe_bo *bo)
  *
  * This function allows inserting a GGTT node with a custom transformation function.
  * This is useful for display to allow inserting rotated framebuffers to GGTT.
+ * Allocates from the usable range only.
  *
  * Return: A pointer to %xe_ggtt_node struct on success. An ERR_PTR otherwise.
  */
@@ -815,7 +928,7 @@ struct xe_ggtt_node *xe_ggtt_insert_node_transform(struct xe_ggtt *ggtt,
 		goto err;
 	}
 
-	ret = xe_ggtt_insert_node_locked(node, size, align, 0);
+	ret = xe_ggtt_insert_node_locked(node, size, align);
 	if (ret)
 		goto err_unlock;
 
@@ -882,10 +995,14 @@ static int __xe_ggtt_insert_bo_at(struct xe_ggtt *ggtt, struct xe_bo *bo,
 	else
 		end = 0;
 
-	xe_tile_assert(ggtt->tile, end >= start + xe_bo_size(bo));
+	end = min(end, ggtt->size);
 
-	err = drm_mm_insert_node_in_range(&ggtt->mm, &bo->ggtt_node[tile_id]->base,
-					  xe_bo_size(bo), alignment, 0, start, end, 0);
+	if (end < start + xe_bo_size(bo))
+		err = -ENOSPC;
+	else
+		err = drm_mm_insert_node_in_range(&ggtt->mm, &bo->ggtt_node[tile_id]->base,
+						  xe_bo_size(bo), alignment, 0, start, end,
+						  ggtt_usable_insert_flags(ggtt));
 	if (err) {
 		ggtt_node_fini(bo->ggtt_node[tile_id]);
 		bo->ggtt_node[tile_id] = NULL;
diff --git a/drivers/gpu/drm/xe/xe_ggtt.h b/drivers/gpu/drm/xe/xe_ggtt.h
index c864cc975a695..59b2f02870195 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.h
+++ b/drivers/gpu/drm/xe/xe_ggtt.h
@@ -24,6 +24,10 @@ u64 xe_ggtt_size(struct xe_ggtt *ggtt);
 
 struct xe_ggtt_node *
 xe_ggtt_insert_node(struct xe_ggtt *ggtt, u32 size, u32 align);
+#ifdef CONFIG_PCI_IOV
+struct xe_ggtt_node *
+xe_ggtt_insert_node_shareable(struct xe_ggtt *ggtt, u32 size, u32 align);
+#endif
 struct xe_ggtt_node *
 xe_ggtt_insert_node_transform(struct xe_ggtt *ggtt,
 			      struct xe_bo *bo, u64 pte,
-- 
2.34.1

