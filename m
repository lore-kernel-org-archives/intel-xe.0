Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD166CD98F2
	for <intel-xe@archiver.kernel.org>; Fri, 19 Jun 2026 20:29:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5ACF6895B9;
	Fri, 19 Jun 2026 20:29:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AGe2S7im";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 256ED895B9
 for <intel-xe@lists.freedesktop.org>; Fri, 19 Jun 2026 20:29:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781900985; x=1813436985;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=rBcolFpEhs6gxj5bjoip8F0i3Mw1URHwBYTY02GsQ9o=;
 b=AGe2S7im+mjm4ftLigaiJml9+2FcENzsqmYSQGL27cVdrtcGwRJyGtOp
 QNmEMzP+To9UOmIiZMr0TaRk/UKXvZUhq/eQmGwqKcZBppQ4YN1B8vv6L
 A/xjT6wCxtkc363P34uhhDamu/isBg83La6nsY3IOhGQlKOfzhICynSJk
 UrvEgncW8E8cMVHISHxqPBhHpA7zdfUExlvj3U0VNv/G+TKIMZGnfwNTu
 2aXZLAp52EQibLynP+IwEPkTov0vVR/p2Tlx+8MUVaQ4Va+vkKlnZJwq/
 GwRQcKBBnzxkpaZ+7dyG1j+L5AtpT4syGeq8rjbXqz0MGQSC0LY41KNlG A==;
X-CSE-ConnectionGUID: 61HCK7FrR+mEiJakTNfyJw==
X-CSE-MsgGUID: WoM5ciP0SBuXUIuf7IIN+g==
X-IronPort-AV: E=McAfee;i="6800,10657,11822"; a="82837376"
X-IronPort-AV: E=Sophos;i="6.24,214,1774335600"; d="scan'208";a="82837376"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2026 13:29:45 -0700
X-CSE-ConnectionGUID: tP1RSlZQTyC8tElYMVxsTg==
X-CSE-MsgGUID: yvMy+iCFR8SDw5sZgsRFZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,214,1774335600"; d="scan'208";a="248764073"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2026 13:29:45 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 19 Jun 2026 13:29:44 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 19 Jun 2026 13:29:44 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.22) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 19 Jun 2026 13:29:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gZ1qHfYLjeZALcs1a478UWcvmjffA3pWefiyAnDUQWJvIqlGeKP8QTfhx7KNDqf8iDJygZ8Tyl8rREHARt8z34082IIt3iZuABGR6zCOcYjK7IKoM6eD9UTlsLBPfi89iRLlMifdj2YtWC4bpP9gCp3HDfUthkSPuWlZc34jllD9rbCdqhAGjHbj8ovJef8N7BigpiTA+PhpWb7pev9Vig2NPfBiUeMVc36h9liL+w9hwb70TxYPsGB0tRA5Y5D1CbuuZugazfsSkd7cF5dUHc57GLacWZa+27ssgreTAGj22l9KY3gvlET45YYECSFc5FeXBu5UBfEpkTnoyynZcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B4zJBui6k6HF3SVDyaCZGHl7LN2aMMslz6QAXyo1sN4=;
 b=Vs3yvC/SsZMr2n3QXU/BNBoqq2lloFdJ429QWxGqSc76CwMR8yKyc9ZXCNLkO1yIb84SHaZEB7CpGSKpZigj1GsJ+cLRF9E7zJJ3P1A9ED5OHIcf/KmFXHIhpqy3lBapCLPoKxIATEraIqIJKSvX1vt0OkqwAnbd9TqqiX87R7HQrtvYIqyMhVmbja5NLTOlNWm5k9YyXY+ubwQCIG9nozE8TrcqcbIW66RTbN8ZrSGCbHfbH5dfxsprFEPBrK3HrnlAqNbO4psaiAh6LbLpvq6x2j1JabSC5KvKiqUqpOHvzIBg8wpyGjRgdhZVJl4JFnvWN+Sr1HUZKZe+tdQGDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8039.namprd11.prod.outlook.com (2603:10b6:510:25f::18)
 by DS0PR11MB6375.namprd11.prod.outlook.com (2603:10b6:8:c9::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.18; Fri, 19 Jun
 2026 20:29:41 +0000
Received: from PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92]) by PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92%6]) with mapi id 15.21.0113.015; Fri, 19 Jun 2026
 20:29:41 +0000
From: =?UTF-8?q?Pi=C3=B3rkowski=2C=20Piotr?= <piotr.piorkowski@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
Subject: [PATCH v2 0/7] Prepare GuC resource managers for VFs provisioning in
 PF admin only mode
Date: Fri, 19 Jun 2026 22:29:28 +0200
Message-ID: <20260619202935.2701499-1-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DU7P189CA0004.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:10:552::20) To PH8PR11MB8039.namprd11.prod.outlook.com
 (2603:10b6:510:25f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8039:EE_|DS0PR11MB6375:EE_
X-MS-Office365-Filtering-Correlation-Id: 20ac9231-8e0e-48dc-6273-08dece417e07
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|23010399003|376014|18092099006|18002099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: YGoiEZLDceI37OhmfoVRzKrYLB9vy4P0A1aI4m5Fd7SZxNWZldki4bU9R3f15iEf5lChege6ZZd4RvthigoJP4z/ndsbg72H/G/xjiwiJhCYXvXQY9U6u8XTZtr+D1x+9wPagxp0YH5dMaRY9Zx/1t7iEPLp+qcHVvPf35VpvIdmiGWD+EGBHsnMIEdmjA581CISyxKn4Ljy3h5Vm57FEDo3r5xLkoIQm2qdKqG3Wdr9FzcZILbJK1qeL+kTOWVqr63DVJJpQERfSiM3afps+D3CBCx68t5gK812NpFS1lolWDB52Dw/AYNHj71eA+3d5iEloU76XX2NyCr6ZveM3ur8v8LfaDeNcKgijAG9ui+reDMFDGR8hLLqymKtw7Yw/YQy287omMlJ7c6a6loQ+CvK0tE93frmoGcVO5174jOuR4/hk2vQj0G9Ukk5gsVskgvodUhW3qodOJmoGr1x2Kx2EKZYAGEh6abr8pwqO7nCihnlQE9unwV6E/lo4Ol23FPa+w8OiKNi/3V8EhJGTd6mEmJ+vBiygIcPJwk59aMwH/6XE/vj/9oeK5hmtknaSJeCysC4aJLrOmydwJjnUirJAlL/g5x9ffdj6gS33rAi78kv5YRo4nv2op9QTO9zEhERadkRcu9rZo4Bo1peiVpGUWyjblB/LQdUwf8KYt8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8039.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(18092099006)(18002099003)(11063799006)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TGFrTWc4cXZlaWJxcGNrRmt0TzY5YlhTbjg1enMzQldnZ1lsMGx5UFZWRE9Z?=
 =?utf-8?B?dkt4MHZPRFlFN3RsZEFDbUxqd09qMlpqcXVpZ3QrbGlSODYrWE14Ym5kWjM3?=
 =?utf-8?B?UHFoWlJvRWNJTjZBNjRoeitjS1U2clhMOTVPb2pISEpkVk40YWw4aWRBQkVC?=
 =?utf-8?B?aFRsaXhOUkZaOURKSUNhU1MzbWl3K3NYcWlCcFlCNHMyVC9GWmE3eUg3a0dU?=
 =?utf-8?B?K0xrV0lsaGpYcDc5eGFLZlZEL1piRE9uOXpOWmxvSFJTbkQ0N3hsZm5CMDVk?=
 =?utf-8?B?ZXpvZW0vRVhhRGNoelJhQ2RmKzMvWmFqSEFkTXNYK1lXOXNpZk1lNHhuUkxl?=
 =?utf-8?B?NlEvbFp4dXdjQzU5RWFobDBrNjk3cEtrS0kzdHUzOVl5SlJ1VDgzalZpYjFk?=
 =?utf-8?B?Mm54MGJ4bkl3eVhPV2tNLytLMFRZekRmdHpIbW1IdHVLZmhJNEZQV3NEMTJh?=
 =?utf-8?B?elh5V093NnlYMkJYWHMvZUJXOWY3eU1pRjFDc09pK3FPdnJHaThjK3M2M3Zz?=
 =?utf-8?B?NDJ5OXZzUzU1b1ZTYnNPVUFiTXRtTHhyYjJ2clpHSGRmTHNva21zSDZPeGdI?=
 =?utf-8?B?Y1A4elJwWjFzWVRkbDljd1MrNEsvNTJmV2U0clk3c29rU2diK2dzWnVsakIw?=
 =?utf-8?B?ZWVIbm12T0pJZXhZc052SmNnZzlDRFpBOXd0SGFDaFlXaVVESGc2dncwR0d4?=
 =?utf-8?B?L1VJd0w2SldtZUVPMWdwTTFlZVovTndodFRwMVRyMVRvOXczQ3AwbVhma0JS?=
 =?utf-8?B?WlRuQkJLSzNxQlFsZG9VRUdvalpLVzk3SGlwaVlPUENXZ21Gck52Q2Z6V3Zq?=
 =?utf-8?B?M3BZTDVVSnE0OWgrMVR0S3FCSC9MQ2ZLK1l0YkVQVWcwUEV2cDNlQ1FteEkx?=
 =?utf-8?B?dHJBSU5aclBuUXY0Unc3WXh1a2kxZ2FqUzczZTdRLzFYbkpPajN5SlorY1hz?=
 =?utf-8?B?clF5YTZvbTVuajR2VEhBMGVHeXg2SVRCeFlTYkRiK00xYUlOdHhjYmdpS3Zt?=
 =?utf-8?B?amNiMkJycWVqNW9PbTBwbVlNaGhFR0RlTksveTFlN3YrWGVadTVaTjd2eC9o?=
 =?utf-8?B?Q3B4OUd2d0ZHOFd3VGRrc0dkY1Nnb0dudFVCSjBhRmFtWWprcjl2Wkt6dXNm?=
 =?utf-8?B?SmdMVm14QjhGaWdiajdhZjR0a0phQmtpWUluNEI5YkR4T0NmWXVrN0x3Qnkz?=
 =?utf-8?B?cFhSZ1I3aVhBWkpVYmRhWDZTUTVXeWtaQjd0eG9Md2FiQVppeFQ5N1JOQm1w?=
 =?utf-8?B?OU5zdTJNZmVBMnpHR24wSTNSQWYzV3FNUy9yL2tmY1hCTUc2ZlUxVHB5YXFh?=
 =?utf-8?B?VEtFRWZ3b1plck9LNklOeDBEbDA0aFczY3hybVp0bnRFNWJxbHQ1d3RHbUFk?=
 =?utf-8?B?YXE1TlNpVUswblJjVTB0NXpBZ2JEOGdGbk5wZWhIZmVyNnRIaDhCaitSd3Vj?=
 =?utf-8?B?Ukdham9EZzdyV0l2UlRwejJ3cldSMmRuamF5em43MUpWSE80bml1cmlHL1Zl?=
 =?utf-8?B?cnhMWkJNbmZMZCtUM3crZlkwZTBZb3BmazlZSlJNaVN6MXBGaExxKzAyR040?=
 =?utf-8?B?bHV4VHVRdnhHeXlxTlgvQmdzZitZSEl1WVB6bWcyNDV0dnlOTy9yd3YrQ2NI?=
 =?utf-8?B?V3NmU2tsZ3JrdERyd3BBalZyekNOT3FGYWVnZ0lCSTFGZlVETHZxSU8wdVBE?=
 =?utf-8?B?SnU2di83TWlvTUxMQ3lLZlpPMlI2SkVaSFBhWGx0TTFUYmhQcmh3aU1hc0NQ?=
 =?utf-8?B?L0o2V21sZ1RkNUFtdjBrMTBWUGIwN3diV2lGR0REUU01K1VQU2YwaW56V1pw?=
 =?utf-8?B?LzJmRXBCQ3lUZnROc0pST3dFTCsyZ1FBb1p5YWxVLzFtWngrbnN4a1ZaS1dH?=
 =?utf-8?B?Qjc3MVJHdzZORFVUMWN1dHFPekRDenR4VGIxNWxEaXZSUnN3UGs2Z1RxZndQ?=
 =?utf-8?B?TUNpOWtGREZLSm4rUjNEQ2dNNk5yd29ndy91OXNRa0NjU2phZEwwQkxHekFP?=
 =?utf-8?B?Ym8zR2F6MHNJTjUwM3U1NEUrSkhzYjhyb1Qrc2xFenJPblU4NHFuVjJWWDFa?=
 =?utf-8?B?M25RMXBPUllJYzR2RFlTTU1PMk9WQmVhWG9GR2pIdTQrZURtMXZic08yY2p5?=
 =?utf-8?B?aWpGKzllbEs0WFVQQkxiZzlLKzBOK3N6OS83VUcrMmpjSkl2RllIcEVkV3hU?=
 =?utf-8?B?cXlmdXd4MDFIT2dMUzBlVFpFb3RRQWk2SGlFNC9jOU5pTXdpNkZraVdwWGhY?=
 =?utf-8?B?N1MybXU2NWNabUJ6OVBXdnlJYk81dzJ0b0IxUlhpbGVIWDlrYW41KysyK1Vh?=
 =?utf-8?B?VUFIdkc0dzRsdVo0VEZoYWhmMy9HOUZXaTM3R3c1Wno1Zi9sQmxjNkVmTFk1?=
 =?utf-8?Q?0oXXZZ8ZsYEod5+Q=3D?=
X-Exchange-RoutingPolicyChecked: PNFHoh9ArJpDii+wz1oB5LPQs0uOcAG0LdttWtLMPOcErSFKEjsphb9SzGx4MfDZPsPYY3D0nsNJyiTTVdFbmyOgRoesL5u+LVP0bsi+mcIwnkwgYNJuOdKsNcDKaKzovkaCITMb6NsOKN0Zla+hrIbAncE3SAeBbeVrBE7RJTQdV03oxx4VtvdnZQelYX3vRI1e9DQJBXbsle8zk6PH6n9HsQOtjB+w4YZ6aE6DXlQO+TgYNbttlhJMhVaGbabMUGTWycSMJ7sjObZ+3Jnp+3G2VTnIHVy5Ljr2Oc3wRonP4saVbKfXH/8h+7mmVUrTyJmhvjsD5800CIj735z6+g==
X-MS-Exchange-CrossTenant-Network-Message-Id: 20ac9231-8e0e-48dc-6273-08dece417e07
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8039.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2026 20:29:41.7610 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Qr0j6rOM0HPfsaJY/h/p3BsWum0i8ByjUqDRXV6H1BhW6crqw2cASRL6Jxd3EyUVsb5MTgte6UJ8yh+6FNdGmhj+qoX1ubqg4rrcJ1qwcus=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6375
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

This series prepares the GuC context ID and doorbell resource managers
for upcoming SR-IOV support that will introduce dedicated resource
pools for VF provisioning in PF Admin Only mode.

Currently, both managers are tightly coupled to the GuC submission
infrastructure and operate on full resource spaces starting at ID 0.
The planned VF provisioning support requires the PF driver to manage
independent subsets of GuC resources and reserve dedicated ranges for
VFs without exposing them to the PF submission path.

v2: fix kunit tests

Piotr Piórkowski (7):
  drm/xe/guc: Use ID manager to get total number of contexts
  drm/xe/guc: Use DB manager to get total number of doorbells
  drm/xe/guc: Decouple the GuC ID manager from the submission state
  drm/xe/guc: Decouple the GuC DB manager from the submission state
  drm/xe/guc: Add start offset support to GuC ID manager
  drm/xe/guc: Add start offset support to GuC doorbell manager
  drm/xe/guc: Allow reserving GuC context IDs without retained range

 .../xe/tests/xe_gt_sriov_pf_config_kunit.c    |  7 ++
 drivers/gpu/drm/xe/tests/xe_guc_db_mgr_test.c | 49 ++++++++++--
 drivers/gpu/drm/xe/tests/xe_guc_id_mgr_test.c | 51 ++++++++++--
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c    | 21 ++---
 drivers/gpu/drm/xe/xe_guc.c                   |  2 +-
 drivers/gpu/drm/xe/xe_guc_db_mgr.c            | 72 +++++++++++++----
 drivers/gpu/drm/xe/xe_guc_db_mgr.h            |  7 +-
 drivers/gpu/drm/xe/xe_guc_id_mgr.c            | 80 ++++++++++++++-----
 drivers/gpu/drm/xe/xe_guc_id_mgr.h            |  7 +-
 drivers/gpu/drm/xe/xe_guc_submit.c            |  5 +-
 drivers/gpu/drm/xe/xe_guc_types.h             | 45 ++++++++++-
 11 files changed, 278 insertions(+), 68 deletions(-)

-- 
2.34.1

