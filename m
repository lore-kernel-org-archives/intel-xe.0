Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27C4B606A31A
	for <intel-xe@archiver.kernel.org>; Mon, 26 Oct 2026 10:43:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Zhb70tHF
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD74710EDED;
	Mon, 26 Oct 2026 10:42:55 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3389110EDD8
 for <intel-xe@lists.freedesktop.org>; Mon, 26 Oct 2026 10:42:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793011371; x=1824547371;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=bRlPiZjKyCEK5t/ZPcvec7bcMZWXntrYcbYkNJCjs7Y=;
 b=Zhb70tHFpIk4Vv+OXbzWCQMCnSO/Kliu8wSgPeYl1T6JRNgLD28FrYun
 3TM4m1Uw5lhTW9BshmOahEXzUqQEy88RuegiHgTZTEX4ergP7WiEc7/7c
 oDembxinwfMJCek4EMVGb9IpQsDSHeAYn8gkcTmQeAe1+Fc7Gke7jYggc
 TXg+8yiTSWGKLTSMkftprd5TW2KsG4hz+utYjTFgeTFf1cI9noTC7FukI
 X+6U2RC2CjFIQeguGL9qZPOsFps4QBfT//2DNj1tdFZ3m97SXUt2b6/Oi
 HWdqaXxG2YtfUGtgYyQz/KcgJn+QYXrMAlYm3Cgib/s0MXEareJnQ4wCP Q==;
X-CSE-ConnectionGUID: aXFtYeGUQbqz0O4H3+k0JA==
X-CSE-MsgGUID: f2zQr28MTZq1apP9XK7ZGA==
X-IronPort-AV: E=McAfee;i="6800,10657,11946"; a="1695057"
X-IronPort-AV: E=Sophos;i="6.27,179,1787036400"; 
   d="scan'208";a="1695057"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2026 03:42:50 -0700
X-CSE-ConnectionGUID: SudU7thmTTCk/DBosa1sGg==
X-CSE-MsgGUID: U1l/+zLuS7OcNXfn3uJGqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,179,1787036400"; 
   d="scan'208";a="4245596"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2026 03:42:49 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Mon, 26 Oct 2026 03:42:49 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Mon, 26 Oct 2026 03:42:49 -0700
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.11) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Mon, 26 Oct 2026 03:42:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LtsorLfGj4NIOIPslbxS7ztPt1gj1wOcazNasLfThYkBCN6+mc6CyXR23dTR7VJySjzPVS9rF/ndcEWph4nq60twlPOhWWU95BO/DBs6pk//KCJa5F09yIGuU4/v0iPD5U84CmK596k9SegYl6b9yQGP5wREMmS1ns3Fo2gcTYgu+19smdaSRylzLngZHebt0SUvXVfEQHpmTFRw9CRsdwSaciPhIb9qlVk6c1HEA+ahJxc6g8ajfHZAPih5JtAQLN4kb+GrgeliBIllIOI2zTTByXLOfjoFFcNwHUYX7Pz/n4M0oRMzWdufmBucETCx+YwYXM3XrByy1Unj3xNZ0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/37MkG2MHFVXtwDSfiMynjV+koODJzqe2QU+GGCO7hA=;
 b=wZLbhrpQsGtbFpGoVLzRnbIs9VoIojIkvIRGzhWsVOHdSEX6E1EvJdEScaB1ThaRp11d7znHvf+sGF84OlrrXalnxDPN4PLUGtGbV866y8/J+1h3mT3FMGwha7+V3Np98UOenseDgSeQ5TI+s+J5pbh3NpufCPBMMvSZkQFsQ/AeBxzbFFR5IsA6xsvuTw3CFC2x81tkxiNgxHUOW2oM5VQ5nBcl/USmcC4AUfDEt+OBnKQ/e0Oz6sIlA4m8SDYTzbFkA+EfJtUrMQ7/lxXX8qaXmOOVQZFKd5vY6L4gIqof9iarRFXPSX7iz1DMnLaqrTzMeRhfPV4bDEAxCvaGVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8039.namprd11.prod.outlook.com (2603:10b6:510:25f::18)
 by DS7PR11MB6016.namprd11.prod.outlook.com (2603:10b6:8:75::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Mon, 26 Oct
 2026 10:42:45 +0000
Received: from PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92]) by PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92%2]) with mapi id 15.21.0546.021; Mon, 26 Oct 2026
 10:42:43 +0000
From: =?UTF-8?q?Pi=C3=B3rkowski=2C=20Piotr?= <piotr.piorkowski@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
Subject: [PATCH v1 2/4] drm/xe/kunit: Extend GuC doorbells manager split-pool
 coverage
Date: Mon, 26 Oct 2026 11:42:22 +0100
Message-ID: <20261026104224.1018993-3-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261026104224.1018993-1-piotr.piorkowski@intel.com>
References: <20261026104224.1018993-1-piotr.piorkowski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: TL2P290CA0021.ISRP290.PROD.OUTLOOK.COM
 (2603:1096:950:3::15) To PH8PR11MB8039.namprd11.prod.outlook.com
 (2603:10b6:510:25f::18)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8039:EE_|DS7PR11MB6016:EE_
X-MS-Office365-Filtering-Correlation-Id: 68f54be4-0d27-43e3-64ae-08df334ddd72
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|23010399003|376014|1800799024|11063799006|56012099006|261021121427099003|261021123027099003|261022113327099003|261022105027099003|261022075727099003|261009223027099003|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: VvRV7cRdOIc6iEvkcvl6fN3QjiLBADXePljjMRv8rDL1yTHY5M3xnqLwUnHRdO358CpoMJm7gRWxfiFuMQ7ZnY8ww7gwUseJET2APkYDTXeT2uTf/KZanb/664NgiNCKcT0zSyc2s0mM+DWA5gLJWYKrX2xhh2EgVC1LsePVrlQF3qmy3Q17mkurBSQuxxlUfFY51HPULy/NlMEUTxXnQ5H24T7DCKZoa/RCrAE1Sznu1J1oqR8oCwwZ561AulOEkaqvh2qYA5owZTgAsPmizrXMhD2b+OMypxUF9aBkF9o/6B2etc8L+Tup09fRAxLLYCMM1z+QTOhjUmEGPFOOE+eYiISdHTulgyP/7BEEpAq478JrGgYl0Nlh5MYO9Xzo7AiRLDPoP+pi8SGrqP4uKVFoM+MjiZI8rtXxLHBB97Cll8vMGAbWLZKpMN7NVy129aLfMtesZVH4suoS13PfApLAnniM8aw6hYIDeV9v1H3H959xk+2IGJ6mhkwDA45243QoVCrKvYYWcs3PspN8Yba9DYRO6DFTYl+MGZdO0svdRDDBV60Nw2KvzZmuxUU9oJ5XUaioXVBJhx0vukybM/3nu/4dz2KESJCRe1t4qTBZMcmFUHY6+6lpCgUM5ScJGMM9C+crZBiGiWM/D61WicSZ1nZ3UV3EDg+F2xAaelA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8039.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(11063799006)(56012099006)(261021121427099003)(261021123027099003)(261022113327099003)(261022105027099003)(261022075727099003)(261009223027099003)(10067099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N2k5Tk5TZkJJY0tESlQzOEhTYVoyT0lPdG14eHhPR2Vlc1ZSdUt6RzdtaVU2?=
 =?utf-8?B?M0tlSHFNTDREcXdmYkRpdnYxS0VJQURzdVczRk55Wm85a3JiS3ZGbUw1aGgy?=
 =?utf-8?B?WDMzdFNPRzREMlBoaGRYVStmWGpqZzgzV3RVSTk4M003VGpuZ2FRWjRtWEZV?=
 =?utf-8?B?RUExd2NPQnhBZjFOeEdxSVVvS0QyMEtQd1B4cnpMTVNnRWJDUUowRUVIZGNQ?=
 =?utf-8?B?cjU0dk82UDZmZWgxanNUb2FCL2NwbGVpZEtzMm9BNlNWSW1RcVhSenozUnBt?=
 =?utf-8?B?MEtMTTA3YlZhRUZ3YXE0OUM5TmtsLzVkbzdrWWFDQ29vZlF0MnUyU3ZNbU1m?=
 =?utf-8?B?ekI2a0ZNbldPaTNPN2liM2VXT2o2SVgzRXA2WGF3cDZDL283VFQwdU1GOStw?=
 =?utf-8?B?cG9EL2R2dlc0aE9jbElkeWNIeUJ6dVc3MDVTeWkzQlBXVzdYUXFoakJkU2lZ?=
 =?utf-8?B?cm5KUm5hTmkraXN0U1F3VDlaeStpY0pOK3RuQktCVTdzREVOeGdzVFptTTVi?=
 =?utf-8?B?YXRuL2lHRlJwUklEa2NCL29MRkZuM2V3bm1YNFRqeUNyRXJMc2F1Ry80L0hW?=
 =?utf-8?B?MHFTbWYwQ3ZpOGZnZUZuaGhodVNQWXBFdkFvdG4xMFMrVXBLcGxwSnFHKy9T?=
 =?utf-8?B?V1dqVW9HV2Rzelp5Z2d2aytXNjBQWURzNkFHNzE1czh4U1BoeDk2d3ZZWTdB?=
 =?utf-8?B?cFdnYVZPc05wQmMwMDVDR1M2Zk40V0RnZEdiekJxZ3NqaGpZd242T2pXWFdI?=
 =?utf-8?B?ODVQVnJtL3lpZm5obWllWkdYZk14SFBBNzFlWWRoOWIrZVVKNTQ2YTVuaDY0?=
 =?utf-8?B?NGlINjJpSjIxZjhYbEczUldWNkYxWEZ2SWZ6K0lrcFJJeWNJRkg0MzQyc3lo?=
 =?utf-8?B?SjhoeUF5NkxwcFVFS05BTjNDWkx4clV5Mk85N0JKVWdxaXZkWHhDaFo2VXQ5?=
 =?utf-8?B?S2R6dXd0bTZGZ0RTM1BNaE91enpObm50bjdna296NG1RTUFsd1F4TFpmV1Nt?=
 =?utf-8?B?SHhyTHhNNnRPb0FMYUxzVWFOaGlpQTFYdFJMU2NxdTY4UnJXVEEyT3VEVnVH?=
 =?utf-8?B?cXhXK1RqREwyVGVSeWt5czczcGJtNG0xdzRjWUZCUitsQUN1angwTUE1TytH?=
 =?utf-8?B?cS9sTUVFQ21XOXdWT0F0bC9SemR1UGorTmV5UnBRNTh6QzY5V2xjYTR0aWs4?=
 =?utf-8?B?bHNZU2UzNmpHUlZTaC9WQkZRQ0RVZUlrRFFhUGlqcStZMWZMWXhESDlzNU5q?=
 =?utf-8?B?cDA5V2FSUXlCaWhFd1NtS1A3bGE1ZUwyckZYdHQ1dERWNkFaMkI5Z0lRTHBh?=
 =?utf-8?B?YXljRzNzNkpKODVGWjJPSHAzRjJuRGc1ZkxiM3pwYW1HNG1UbjIrM3VYenRy?=
 =?utf-8?B?Q2VXdERGZGtRUlVReStvZTNVMk5pajhhd2Z4aGVBQ0VYVXZSakdhbFlhZUtv?=
 =?utf-8?B?ekZJRWtQY29GalJCc0tHczhkSmczaDk0bzh0Nm9kZ2txVU1KVjJSQXRXc3pi?=
 =?utf-8?B?S1hrck5JSDNUSkNTbFlQSFJ2M2hkaG44NHdjajJqSEp3UG5rTEEvM3l2RVZm?=
 =?utf-8?B?MVdmdHhDVjNFSFdlTXZzU095RmRuU3ZGMmtBQkFDaU4xK2FjSVdYcHE5dGgv?=
 =?utf-8?B?c3h0dGNWWks2VE41YU41bnJkbUxCYjlHMG5SVkhDckxOenY2UFllVGx6NVdq?=
 =?utf-8?B?L1BYTloyQnZZbzBuby83WTZPQUplRTViMW9HTW5NV0Nud1B0N2oxTkZObFJk?=
 =?utf-8?B?bk9ySkRRVUNVTlNUbVY5ZldUN3JOWTVuN0hpVXQ5MWJLeUMvZXQ3YTVzdVdP?=
 =?utf-8?B?Q1haTjJndUhheFF6WFZGZy95RFBvdVNXQUQzQVNCbkpDVWZOcnA2LzJENzFl?=
 =?utf-8?B?c2JFQWxKY2h0Z0p2M3JpSk8veEF2WEhUQlkvczNOSWsrRDNMd09iREZjOE9N?=
 =?utf-8?B?MGNzaFNvbVFlTnp2R3JOSDdWbnV1VjFBMjVMcFA5cSs3RGxZVVR1WUNxRHRj?=
 =?utf-8?B?ajZ2T2UrVHFhTm1XUXg0S0V5MFd5aXZzcktrVGR2SFNSMVBOZEt3OU5Helly?=
 =?utf-8?B?MnN2VEdGOFhvcGdSbC9NRXpMdU1PaXJZZTJ2amY5WUU3UnZEdFVMaXlXbytU?=
 =?utf-8?B?cnhMQmtrZEhnWVFVdWo4VkFqaHQvTjFLR0hpbHJjYUJDSkxhMEs2bWN1Q1N1?=
 =?utf-8?B?QnpRZm0zLzEybFRzamQyS2FzOXQxVGxaVnJRMkhENnNkYXl0eE9DeHhGT0ZR?=
 =?utf-8?B?ZW1nWityd1JtcHVrRjN4VS9rMjBLOTh4WWV5TDJPd2svR2h1K1BZdDBDVkJ3?=
 =?utf-8?B?Znd3c2w5T3dvKzBwNWNwOW5LSlJ1cUg2Ujl2UWZpMkMzSUx2QUt4YlNmWTJk?=
 =?utf-8?Q?w7jEfYPFu7eAwiOE=3D?=
X-Exchange-RoutingPolicyChecked: YElP7OOBP/Duttg5nGafqnSbvayceCaNRKDX+Obp8cf/sJKjOxxNKRkELr9uNATpJrj1vRXq7j/8OxLU8pCgsFdZaGFsF5hILnvtVxw+1bUUpa0HkGOCeifPWqEmreI2RavH7mFZuvUFOl5qGF29huGWr57rsBihUDwM9i9OBwUMz+KJNSHRrpgq3FtgzedrbHV1TgR44KIeBtE+16rVs4sgAgkrxQK/N7ihfOQvwfvJTmUV6IRWujDQC6DQeM1ZwOgJFptswukM1r0P2dvNM6daCAvWVkqlJ0y/DVCNem8zuJCxitHFpiQDr/o/7djDC4WMKErs1OvqVkmvg75cbQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 68f54be4-0d27-43e3-64ae-08df334ddd72
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8039.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2026 10:42:43.3517 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bdNElcUYtmazneVo82Bv5Tz86qOrDTuJjKuaZx4DKB2qA0IHVKCfRGIvQqQibZtTNBc44OzwLuIl7FIX7c/j8g2DIH44Gq9hArKYcp+84kI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6016
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

Expand the GuC doorbells manager KUnit coverage to exercise the new
usable/shareable pool model.

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
---
 drivers/gpu/drm/xe/tests/xe_guc_db_mgr_test.c | 773 ++++++++++++++++--
 1 file changed, 720 insertions(+), 53 deletions(-)

diff --git a/drivers/gpu/drm/xe/tests/xe_guc_db_mgr_test.c b/drivers/gpu/drm/xe/tests/xe_guc_db_mgr_test.c
index 014f2dd6f3cc3..df882c5b4e698 100644
--- a/drivers/gpu/drm/xe/tests/xe_guc_db_mgr_test.c
+++ b/drivers/gpu/drm/xe/tests/xe_guc_db_mgr_test.c
@@ -7,31 +7,116 @@
 
 #include "xe_device.h"
 #include "xe_kunit_helpers.h"
+#include "xe_pci_test.h"
+
+#define DBM_TEST_POOL_SIZE		8
+#define DBM_TEST_PARTIAL_POOL_SIZE	((GUC_NUM_DOORBELLS / 4) * 3)
 
 static int guc_dbm_test_init(struct kunit *test)
 {
+	struct xe_pci_fake_data *fake;
 	struct xe_guc_db_mgr *dbm;
 
+	/* Use PF fixture, so the shareable pool can be tested. */
+	fake = kunit_kzalloc(test, sizeof(*fake), GFP_KERNEL);
+	if (!fake)
+		return -ENOMEM;
+
+	*fake = (struct xe_pci_fake_data) {
+		.sriov_mode = XE_SRIOV_MODE_PF,
+		.platform = XE_TIGERLAKE, /* some random platform */
+		.subplatform = XE_SUBPLATFORM_NONE,
+	};
+	test->priv = fake;
+
 	xe_kunit_helper_xe_device_test_init(test);
-	dbm = &xe_device_get_gt(test->priv, 0)->uc.guc.dbm;
+	dbm = &xe_root_mmio_gt(test->priv)->uc.guc.dbm;
 
 	mutex_init(dbm_mutex(dbm));
 	test->priv = dbm;
 	return 0;
 }
 
+static void require_iov_config_or_skip(struct kunit *test)
+{
+	if (!IS_ENABLED(CONFIG_PCI_IOV))
+		kunit_skip(test, "requires CONFIG_PCI_IOV");
+}
+
+static unsigned int test_dbm_used_total(struct xe_guc_db_mgr *dbm)
+{
+	lockdep_assert_held(dbm_mutex(dbm));
+
+	return bitmap_weight(dbm->bitmap, dbm_total(dbm));
+}
+
+/* There is no allocator for usable doorbells yet, simulate PF use of them. */
+static int test_dbm_reserve_usable_locked(struct xe_guc_db_mgr *dbm, unsigned int count)
+{
+	int id;
+
+	lockdep_assert_held(dbm_mutex(dbm));
+
+	if (!dbm->usable)
+		return -ENODATA;
+
+	id = bitmap_find_next_zero_area(dbm->bitmap, dbm->usable, 0, count, 0);
+	if (id >= dbm->usable)
+		return -ENOSPC;
+
+	bitmap_set(dbm->bitmap, id, count);
+
+	return id;
+}
+
+static int test_dbm_reserve_usable(struct xe_guc_db_mgr *dbm, unsigned int count)
+{
+	guard(mutex)(dbm_mutex(dbm));
+
+	return test_dbm_reserve_usable_locked(dbm, count);
+}
+
+static int test_dbm_release_usable_locked(struct xe_guc_db_mgr *dbm, unsigned int id,
+					  unsigned int count)
+{
+	return dbm_release_chunk_in_range_locked(dbm, id, count, 0, dbm->usable);
+}
+
+static int test_dbm_release_usable(struct xe_guc_db_mgr *dbm, unsigned int id,
+				   unsigned int count)
+{
+	guard(mutex)(dbm_mutex(dbm));
+
+	return test_dbm_release_usable_locked(dbm, id, count);
+}
+
+static int test_dbm_release_shareable_locked(struct xe_guc_db_mgr *dbm, unsigned int id,
+					     unsigned int count)
+{
+	return dbm_release_chunk_in_range_locked(dbm, id, count,
+						 dbm_shareable_start(dbm), dbm_total(dbm));
+}
+
+static void test_bad_init(struct kunit *test)
+{
+	struct xe_guc_db_mgr *dbm = test->priv;
+
+	KUNIT_EXPECT_EQ(test, dbm_init(dbm, GUC_NUM_DOORBELLS + 1, 0), -ERANGE);
+	KUNIT_EXPECT_EQ(test, dbm_init(dbm, 0, GUC_NUM_DOORBELLS + 1), -ERANGE);
+	KUNIT_EXPECT_NULL(test, dbm->bitmap);
+}
+
 static void test_empty(struct kunit *test)
 {
 	struct xe_guc_db_mgr *dbm = test->priv;
 
-	KUNIT_ASSERT_EQ(test, xe_guc_db_mgr_init(dbm, 0), 0);
+	KUNIT_ASSERT_EQ(test, dbm_init(dbm, 0, 0), 0);
 	KUNIT_ASSERT_EQ(test, dbm_total(dbm), 0);
 
-	mutex_lock(dbm_mutex(dbm));
-	KUNIT_EXPECT_LT(test, xe_guc_db_mgr_reserve_id_locked(dbm), 0);
-	mutex_unlock(dbm_mutex(dbm));
+	scoped_guard(mutex, dbm_mutex(dbm))
+		KUNIT_EXPECT_EQ(test, test_dbm_reserve_usable_locked(dbm, 1), -ENODATA);
 
-	KUNIT_EXPECT_LT(test, xe_guc_db_mgr_reserve_range(dbm, 1, 0), 0);
+	KUNIT_EXPECT_EQ(test, xe_guc_db_mgr_reserve_shareable(dbm, 1, 0), -ENODATA);
 }
 
 static void test_default(struct kunit *test)
@@ -39,7 +124,9 @@ static void test_default(struct kunit *test)
 	struct xe_guc_db_mgr *dbm = test->priv;
 
 	KUNIT_ASSERT_EQ(test, xe_guc_db_mgr_init(dbm, ~0), 0);
-	KUNIT_ASSERT_EQ(test, dbm_total(dbm), GUC_NUM_DOORBELLS);
+	KUNIT_EXPECT_EQ(test, dbm->usable, GUC_NUM_DOORBELLS);
+	KUNIT_EXPECT_EQ(test, xe_guc_db_mgr_max_shareable(dbm), 0);
+	KUNIT_EXPECT_EQ(test, dbm_total(dbm), GUC_NUM_DOORBELLS);
 }
 
 static const unsigned int guc_dbm_params[] = {
@@ -63,21 +150,23 @@ static void test_size(struct kunit *test)
 	unsigned int n;
 	int id;
 
-	KUNIT_ASSERT_EQ(test, xe_guc_db_mgr_init(dbm, *p), 0);
+	KUNIT_ASSERT_EQ(test, dbm_init(dbm, *p, 0), 0);
 	KUNIT_ASSERT_EQ(test, dbm_total(dbm), *p);
 
-	mutex_lock(dbm_mutex(dbm));
+	guard(mutex)(dbm_mutex(dbm));
+
 	for (n = 0; n < *p; n++) {
-		KUNIT_EXPECT_GE(test, id = xe_guc_db_mgr_reserve_id_locked(dbm), 0);
+		id = test_dbm_reserve_usable_locked(dbm, 1);
+		KUNIT_EXPECT_GE(test, id, 0);
+		if (id < 0)
+			break;
 		KUNIT_EXPECT_LT(test, id, dbm_total(dbm));
 	}
-	KUNIT_EXPECT_LT(test, xe_guc_db_mgr_reserve_id_locked(dbm), 0);
-	mutex_unlock(dbm_mutex(dbm));
+	if (n == *p)
+		KUNIT_EXPECT_EQ(test, test_dbm_reserve_usable_locked(dbm, 1), -ENOSPC);
 
-	mutex_lock(dbm_mutex(dbm));
-	for (n = 0; n < *p; n++)
-		xe_guc_db_mgr_release_id_locked(dbm, n);
-	mutex_unlock(dbm_mutex(dbm));
+	if (n)
+		KUNIT_EXPECT_EQ(test, test_dbm_release_usable_locked(dbm, 0, n), 0);
 }
 
 static void test_reuse(struct kunit *test)
@@ -85,27 +174,40 @@ static void test_reuse(struct kunit *test)
 	const unsigned int *p = test->param_value;
 	struct xe_guc_db_mgr *dbm = test->priv;
 	unsigned int n;
+	int id;
 
-	KUNIT_ASSERT_EQ(test, xe_guc_db_mgr_init(dbm, *p), 0);
+	KUNIT_ASSERT_EQ(test, dbm_init(dbm, *p, 0), 0);
 
-	mutex_lock(dbm_mutex(dbm));
-	for (n = 0; n < *p; n++)
-		KUNIT_EXPECT_GE(test, xe_guc_db_mgr_reserve_id_locked(dbm), 0);
-	KUNIT_EXPECT_LT(test, xe_guc_db_mgr_reserve_id_locked(dbm), 0);
-	mutex_unlock(dbm_mutex(dbm));
+	guard(mutex)(dbm_mutex(dbm));
 
-	mutex_lock(dbm_mutex(dbm));
 	for (n = 0; n < *p; n++) {
-		xe_guc_db_mgr_release_id_locked(dbm, n);
-		KUNIT_EXPECT_EQ(test, xe_guc_db_mgr_reserve_id_locked(dbm), n);
+		id = test_dbm_reserve_usable_locked(dbm, 1);
+		KUNIT_EXPECT_EQ(test, id, n);
+		if (id < 0)
+			break;
+	}
+	if (n < *p) {
+		if (n)
+			dbm_release_chunk_locked(dbm, 0, n);
+		return;
 	}
-	KUNIT_EXPECT_LT(test, xe_guc_db_mgr_reserve_id_locked(dbm), 0);
-	mutex_unlock(dbm_mutex(dbm));
+	KUNIT_EXPECT_EQ(test, test_dbm_reserve_usable_locked(dbm, 1), -ENOSPC);
 
-	mutex_lock(dbm_mutex(dbm));
-	for (n = 0; n < *p; n++)
-		xe_guc_db_mgr_release_id_locked(dbm, n);
-	mutex_unlock(dbm_mutex(dbm));
+	for (n = 0; n < *p; n++) {
+		KUNIT_EXPECT_EQ(test, test_dbm_release_usable_locked(dbm, n, 1), 0);
+		id = test_dbm_reserve_usable_locked(dbm, 1);
+		KUNIT_EXPECT_EQ(test, id, n);
+		if (id < 0) {
+			if (n)
+				dbm_release_chunk_locked(dbm, 0, n);
+			if (n + 1 < *p)
+				dbm_release_chunk_locked(dbm, n + 1, *p - n - 1);
+			return;
+		}
+	}
+	KUNIT_EXPECT_EQ(test, test_dbm_reserve_usable_locked(dbm, 1), -ENOSPC);
+
+	KUNIT_EXPECT_EQ(test, test_dbm_release_usable_locked(dbm, 0, *p), 0);
 }
 
 static void test_range_overlap(struct kunit *test)
@@ -115,34 +217,34 @@ static void test_range_overlap(struct kunit *test)
 	int id1, id2, id3;
 	unsigned int n;
 
-	KUNIT_ASSERT_EQ(test, xe_guc_db_mgr_init(dbm, ~0), 0);
+	KUNIT_ASSERT_EQ(test, dbm_init(dbm, GUC_NUM_DOORBELLS, 0), 0);
 	KUNIT_ASSERT_LE(test, *p, dbm_total(dbm));
 
-	KUNIT_ASSERT_GE(test, id1 = xe_guc_db_mgr_reserve_range(dbm, *p, 0), 0);
+	KUNIT_ASSERT_GE(test, id1 = test_dbm_reserve_usable(dbm, *p), 0);
 	for (n = 0; n < dbm_total(dbm) - *p; n++) {
-		KUNIT_ASSERT_GE(test, id2 = xe_guc_db_mgr_reserve_range(dbm, 1, 0), 0);
+		KUNIT_ASSERT_GE(test, id2 = test_dbm_reserve_usable(dbm, 1), 0);
 		KUNIT_ASSERT_NE(test, id2, id1);
 		KUNIT_ASSERT_NE_MSG(test, id2 < id1, id2 > id1 + *p - 1,
 				    "id1=%d id2=%d", id1, id2);
 	}
-	KUNIT_ASSERT_LT(test, xe_guc_db_mgr_reserve_range(dbm, 1, 0), 0);
-	xe_guc_db_mgr_release_range(dbm, 0, dbm_total(dbm));
+	KUNIT_ASSERT_LT(test, test_dbm_reserve_usable(dbm, 1), 0);
+	KUNIT_ASSERT_EQ(test, test_dbm_release_usable(dbm, 0, dbm_total(dbm)), 0);
 
 	if (*p >= 1) {
-		KUNIT_ASSERT_GE(test, id1 = xe_guc_db_mgr_reserve_range(dbm, 1, 0), 0);
-		KUNIT_ASSERT_GE(test, id2 = xe_guc_db_mgr_reserve_range(dbm, *p - 1, 0), 0);
+		KUNIT_ASSERT_GE(test, id1 = test_dbm_reserve_usable(dbm, 1), 0);
+		KUNIT_ASSERT_GE(test, id2 = test_dbm_reserve_usable(dbm, *p - 1), 0);
 		KUNIT_ASSERT_NE(test, id2, id1);
 		KUNIT_ASSERT_NE_MSG(test, id1 < id2, id1 > id2 + *p - 2,
 				    "id1=%d id2=%d", id1, id2);
 		for (n = 0; n < dbm_total(dbm) - *p; n++) {
-			KUNIT_ASSERT_GE(test, id3 = xe_guc_db_mgr_reserve_range(dbm, 1, 0), 0);
+			KUNIT_ASSERT_GE(test, id3 = test_dbm_reserve_usable(dbm, 1), 0);
 			KUNIT_ASSERT_NE(test, id3, id1);
 			KUNIT_ASSERT_NE(test, id3, id2);
 			KUNIT_ASSERT_NE_MSG(test, id3 < id2, id3 > id2 + *p - 2,
 					    "id3=%d id2=%d", id3, id2);
 		}
-		KUNIT_ASSERT_LT(test, xe_guc_db_mgr_reserve_range(dbm, 1, 0), 0);
-		xe_guc_db_mgr_release_range(dbm, 0, dbm_total(dbm));
+		KUNIT_ASSERT_LT(test, test_dbm_reserve_usable(dbm, 1), 0);
+		KUNIT_ASSERT_EQ(test, test_dbm_release_usable(dbm, 0, dbm_total(dbm)), 0);
 	}
 }
 
@@ -152,36 +254,586 @@ static void test_range_compact(struct kunit *test)
 	struct xe_guc_db_mgr *dbm = test->priv;
 	unsigned int n;
 
-	KUNIT_ASSERT_EQ(test, xe_guc_db_mgr_init(dbm, ~0), 0);
+	KUNIT_ASSERT_EQ(test, dbm_init(dbm, GUC_NUM_DOORBELLS, 0), 0);
 	KUNIT_ASSERT_NE(test, *p, 0);
 	KUNIT_ASSERT_LE(test, *p, dbm_total(dbm));
 	if (dbm_total(dbm) % *p)
 		kunit_skip(test, "must be divisible");
 
-	KUNIT_ASSERT_GE(test, xe_guc_db_mgr_reserve_range(dbm, *p, 0), 0);
+	KUNIT_ASSERT_GE(test, test_dbm_reserve_usable(dbm, *p), 0);
 	for (n = 1; n < dbm_total(dbm) / *p; n++)
-		KUNIT_ASSERT_GE(test, xe_guc_db_mgr_reserve_range(dbm, *p, 0), 0);
-	KUNIT_ASSERT_LT(test, xe_guc_db_mgr_reserve_range(dbm, 1, 0), 0);
-	xe_guc_db_mgr_release_range(dbm, 0, dbm_total(dbm));
+		KUNIT_ASSERT_GE(test, test_dbm_reserve_usable(dbm, *p), 0);
+	KUNIT_ASSERT_LT(test, test_dbm_reserve_usable(dbm, 1), 0);
+	KUNIT_ASSERT_EQ(test, test_dbm_release_usable(dbm, 0, dbm_total(dbm)), 0);
 }
 
 static void test_range_spare(struct kunit *test)
 {
 	const unsigned int *p = test->param_value;
 	struct xe_guc_db_mgr *dbm = test->priv;
+	unsigned int total;
 	int id;
 
-	KUNIT_ASSERT_EQ(test, xe_guc_db_mgr_init(dbm, ~0), 0);
-	KUNIT_ASSERT_LE(test, *p, dbm_total(dbm));
+	require_iov_config_or_skip(test);
+
+	KUNIT_ASSERT_EQ(test, dbm_init(dbm, GUC_NUM_DOORBELLS, GUC_NUM_DOORBELLS), 0);
+	total = dbm_total(dbm);
+	KUNIT_ASSERT_LE(test, *p, total);
+
+	KUNIT_ASSERT_EQ(test, xe_guc_db_mgr_reserve_shareable(dbm, *p, total), -EDQUOT);
+	KUNIT_ASSERT_EQ(test, xe_guc_db_mgr_reserve_shareable(dbm, *p, total - *p + 1), -EDQUOT);
+	KUNIT_ASSERT_EQ(test, id = xe_guc_db_mgr_reserve_shareable(dbm, *p, total - *p),
+			total - *p);
+	KUNIT_ASSERT_LT(test, xe_guc_db_mgr_reserve_shareable(dbm, 1, total - *p), 0);
+	KUNIT_ASSERT_EQ(test, xe_guc_db_mgr_release_shareable(dbm, id, *p), 0);
+}
+
+static void test_limits(struct kunit *test)
+{
+	struct xe_guc_db_mgr *dbm = test->priv;
+	const unsigned int usable = 10;
+	const unsigned int shareable = 20;
+
+	require_iov_config_or_skip(test);
+
+	KUNIT_ASSERT_EQ(test, dbm_init(dbm, usable, shareable), 0);
+
+	KUNIT_EXPECT_EQ(test, dbm->usable, usable);
+	KUNIT_EXPECT_EQ(test, xe_guc_db_mgr_max_shareable(dbm), shareable);
+	KUNIT_EXPECT_EQ(test, dbm_total(dbm), usable + shareable);
+	KUNIT_EXPECT_EQ(test, dbm_shareable_start(dbm), usable);
+}
+
+static void test_overlap(struct kunit *test)
+{
+	struct xe_guc_db_mgr *dbm = test->priv;
+
+	require_iov_config_or_skip(test);
+
+	KUNIT_ASSERT_EQ(test, dbm_init(dbm, GUC_NUM_DOORBELLS, GUC_NUM_DOORBELLS), 0);
+
+	KUNIT_EXPECT_EQ(test, dbm->usable, GUC_NUM_DOORBELLS);
+	KUNIT_EXPECT_EQ(test, xe_guc_db_mgr_max_shareable(dbm), GUC_NUM_DOORBELLS);
+	KUNIT_EXPECT_EQ(test, dbm_total(dbm), GUC_NUM_DOORBELLS);
+	KUNIT_EXPECT_EQ(test, dbm_shareable_start(dbm), 0);
+}
+
+static void test_overlap_alloc(struct kunit *test)
+{
+	struct xe_guc_db_mgr *dbm = test->priv;
+	const unsigned int usable_count = 2;
+	const unsigned int shareable_count = 3;
+	int usable_id, shareable_id;
+	unsigned int total;
+
+	require_iov_config_or_skip(test);
+
+	KUNIT_ASSERT_EQ(test, dbm_init(dbm, GUC_NUM_DOORBELLS, GUC_NUM_DOORBELLS), 0);
+
+	guard(mutex)(dbm_mutex(dbm));
+	total = dbm_total(dbm);
+
+	usable_id = test_dbm_reserve_usable_locked(dbm, usable_count);
+	KUNIT_EXPECT_EQ(test, usable_id, 0);
+	if (usable_id < 0)
+		return;
+
+	shareable_id = dbm_reserve_chunk_shareable_locked(dbm, shareable_count, 0);
+	KUNIT_EXPECT_EQ(test, shareable_id, total - shareable_count);
+	if (shareable_id < 0) {
+		dbm_release_chunk_locked(dbm, usable_id, usable_count);
+		return;
+	}
+
+	KUNIT_EXPECT_EQ(test, test_dbm_used_total(dbm), usable_count + shareable_count);
+	KUNIT_EXPECT_EQ(test, dbm_used_usable(dbm), usable_count + shareable_count);
+	KUNIT_EXPECT_EQ(test, dbm_used_shareable(dbm), usable_count + shareable_count);
+
+	KUNIT_EXPECT_EQ(test,
+			test_dbm_release_usable_locked(dbm, usable_id, usable_count), 0);
+	KUNIT_EXPECT_EQ(test,
+			test_dbm_release_shareable_locked(dbm, shareable_id,
+							  shareable_count), 0);
+	KUNIT_EXPECT_EQ(test, test_dbm_used_total(dbm), 0);
+}
+
+static void test_overlap_release(struct kunit *test)
+{
+	struct xe_guc_db_mgr *dbm = test->priv;
+	const unsigned int count = 4;
+	unsigned int total;
+	int id;
+
+	require_iov_config_or_skip(test);
+
+	KUNIT_ASSERT_EQ(test, dbm_init(dbm, GUC_NUM_DOORBELLS, GUC_NUM_DOORBELLS), 0);
+
+	guard(mutex)(dbm_mutex(dbm));
+	total = dbm_total(dbm);
+
+	id = test_dbm_reserve_usable_locked(dbm, count);
+	KUNIT_EXPECT_EQ(test, id, 0);
+	if (id < 0)
+		return;
+
+	KUNIT_EXPECT_EQ(test, test_dbm_release_shareable_locked(dbm, id, count), 0);
+	KUNIT_EXPECT_EQ(test, test_dbm_used_total(dbm), 0);
+
+	id = dbm_reserve_chunk_shareable_locked(dbm, count, 0);
+	KUNIT_EXPECT_EQ(test, id, total - count);
+	if (id < 0)
+		return;
+
+	KUNIT_EXPECT_EQ(test, test_dbm_release_usable_locked(dbm, id, count), 0);
+	KUNIT_EXPECT_EQ(test, test_dbm_used_total(dbm), 0);
+
+	KUNIT_EXPECT_EQ(test, test_dbm_release_usable_locked(dbm, 0, 0), -EINVAL);
+	KUNIT_EXPECT_EQ(test, test_dbm_release_shareable_locked(dbm, 0, 0), -EINVAL);
+}
+
+static void test_overlap_partial_init(struct kunit *test)
+{
+	struct xe_guc_db_mgr *dbm = test->priv;
+	const unsigned int pools_size = DBM_TEST_PARTIAL_POOL_SIZE;
+	unsigned int shareable_start;
+	int usable_id, shareable_id;
+	unsigned int rest;
+
+	require_iov_config_or_skip(test);
+
+	KUNIT_ASSERT_EQ(test, dbm_init(dbm, pools_size, pools_size), 0);
+
+	guard(mutex)(dbm_mutex(dbm));
+
+	shareable_start = dbm_shareable_start(dbm);
+	rest = dbm_total(dbm) - pools_size;
+
+	KUNIT_EXPECT_EQ(test, dbm_total(dbm), GUC_NUM_DOORBELLS);
+	KUNIT_EXPECT_EQ(test, dbm->usable, pools_size);
+	KUNIT_EXPECT_EQ(test, xe_guc_db_mgr_max_shareable(dbm), pools_size);
+	KUNIT_EXPECT_EQ(test, shareable_start, GUC_NUM_DOORBELLS - pools_size);
+
+	usable_id = test_dbm_reserve_usable_locked(dbm, pools_size);
+	KUNIT_EXPECT_EQ(test, usable_id, 0);
+	if (usable_id < 0)
+		return;
+
+	shareable_id = dbm_reserve_chunk_shareable_locked(dbm, rest, 0);
+	KUNIT_EXPECT_EQ(test, shareable_id, pools_size);
+	if (shareable_id < 0) {
+		dbm_release_chunk_locked(dbm, usable_id, pools_size);
+		return;
+	}
+
+	KUNIT_EXPECT_EQ(test, test_dbm_used_total(dbm), GUC_NUM_DOORBELLS);
+	KUNIT_EXPECT_EQ(test, dbm_used_usable(dbm), pools_size);
+	KUNIT_EXPECT_EQ(test, dbm_used_shareable(dbm), pools_size);
+
+	KUNIT_EXPECT_EQ(test,
+			test_dbm_release_usable_locked(dbm, usable_id, pools_size), 0);
+	KUNIT_EXPECT_EQ(test,
+			test_dbm_release_shareable_locked(dbm, shareable_id, rest), 0);
+	KUNIT_EXPECT_EQ(test, test_dbm_used_total(dbm), 0);
+}
+
+static void test_overlap_partial_shared_range_blocking(struct kunit *test)
+{
+	struct xe_guc_db_mgr *dbm = test->priv;
+	const unsigned int pools_size = DBM_TEST_PARTIAL_POOL_SIZE;
+	int usable_id, shareable_range_id, shareable_overlap_id;
+	unsigned int shareable_start;
+	unsigned int nonoverlap_size;
+	unsigned int overlap_size;
+	unsigned int total;
+
+	require_iov_config_or_skip(test);
+
+	KUNIT_ASSERT_EQ(test, dbm_init(dbm, pools_size, pools_size), 0);
+
+	guard(mutex)(dbm_mutex(dbm));
+
+	total = dbm_total(dbm);
+	shareable_start = dbm_shareable_start(dbm);
+	nonoverlap_size = total - pools_size;
+	overlap_size = pools_size - shareable_start;
+
+	KUNIT_EXPECT_GT(test, nonoverlap_size, 0);
+	KUNIT_EXPECT_GT(test, overlap_size, 0);
+
+	shareable_range_id = dbm_reserve_chunk_shareable_locked(dbm, nonoverlap_size, 0);
+	KUNIT_EXPECT_EQ(test, shareable_range_id, pools_size);
+	if (shareable_range_id < 0)
+		return;
+
+	usable_id = test_dbm_reserve_usable_locked(dbm, pools_size);
+	KUNIT_EXPECT_EQ(test, usable_id, 0);
+	if (usable_id < 0) {
+		dbm_release_chunk_locked(dbm, shareable_range_id, nonoverlap_size);
+		return;
+	}
+
+	KUNIT_EXPECT_EQ(test, dbm_reserve_chunk_shareable_locked(dbm, 1, 0), -ENOSPC);
+
+	KUNIT_EXPECT_EQ(test, test_dbm_release_usable_locked(dbm, usable_id, pools_size), 0);
+
+	shareable_overlap_id = dbm_reserve_chunk_shareable_locked(dbm, overlap_size, 0);
+	KUNIT_EXPECT_EQ(test, shareable_overlap_id, shareable_start);
+	if (shareable_overlap_id < 0) {
+		dbm_release_chunk_locked(dbm, shareable_range_id, nonoverlap_size);
+		return;
+	}
+
+	usable_id = test_dbm_reserve_usable_locked(dbm, shareable_start);
+	KUNIT_EXPECT_EQ(test, usable_id, 0);
+	if (usable_id < 0) {
+		dbm_release_chunk_locked(dbm, shareable_overlap_id, overlap_size);
+		dbm_release_chunk_locked(dbm, shareable_range_id, nonoverlap_size);
+		return;
+	}
+	KUNIT_EXPECT_EQ(test, test_dbm_reserve_usable_locked(dbm, 1), -ENOSPC);
+
+	KUNIT_EXPECT_EQ(test,
+			test_dbm_release_usable_locked(dbm, usable_id, shareable_start),
+			0);
+	KUNIT_EXPECT_EQ(test,
+			test_dbm_release_shareable_locked(dbm, shareable_overlap_id,
+							  overlap_size),
+			0);
+	KUNIT_EXPECT_EQ(test,
+			test_dbm_release_shareable_locked(dbm, shareable_range_id,
+							  nonoverlap_size),
+			0);
+	KUNIT_EXPECT_EQ(test, test_dbm_used_total(dbm), 0);
+}
+
+static void test_used_usable(struct kunit *test)
+{
+	struct xe_guc_db_mgr *dbm = test->priv;
+	const unsigned int count = 2;
+	int id;
+
+	KUNIT_ASSERT_EQ(test, dbm_init(dbm, DBM_TEST_POOL_SIZE, 0), 0);
+
+	guard(mutex)(dbm_mutex(dbm));
+
+	KUNIT_EXPECT_EQ(test, dbm_used_usable(dbm), 0);
+	KUNIT_EXPECT_EQ(test, dbm_used_shareable(dbm), 0);
+
+	id = test_dbm_reserve_usable_locked(dbm, count);
+	KUNIT_EXPECT_GE(test, id, 0);
+	if (id < 0)
+		return;
+
+	KUNIT_EXPECT_EQ(test, dbm_used_usable(dbm), count);
+	KUNIT_EXPECT_EQ(test, dbm_used_shareable(dbm), 0);
+	KUNIT_EXPECT_EQ(test, test_dbm_used_total(dbm), count);
+
+	dbm_release_chunk_locked(dbm, id, count);
+	KUNIT_EXPECT_EQ(test, test_dbm_used_total(dbm), 0);
+}
+
+static void test_used_shareable(struct kunit *test)
+{
+	struct xe_guc_db_mgr *dbm = test->priv;
+	const unsigned int count = 3;
+	unsigned int shareable_start;
+	int id;
+
+	require_iov_config_or_skip(test);
+
+	KUNIT_ASSERT_EQ(test, dbm_init(dbm, DBM_TEST_POOL_SIZE, DBM_TEST_POOL_SIZE), 0);
+
+	guard(mutex)(dbm_mutex(dbm));
+	shareable_start = dbm_shareable_start(dbm);
+
+	KUNIT_EXPECT_EQ(test, dbm_used_usable(dbm), 0);
+	KUNIT_EXPECT_EQ(test, dbm_used_shareable(dbm), 0);
+
+	id = dbm_reserve_chunk_shareable_locked(dbm, count, 0);
+	KUNIT_EXPECT_EQ(test, id, shareable_start);
+	if (id < 0)
+		return;
+
+	KUNIT_EXPECT_EQ(test, dbm_used_usable(dbm), 0);
+	KUNIT_EXPECT_EQ(test, dbm_used_shareable(dbm), count);
+	KUNIT_EXPECT_EQ(test, test_dbm_used_total(dbm), count);
+
+	dbm_release_chunk_locked(dbm, id, count);
+	KUNIT_EXPECT_EQ(test, test_dbm_used_total(dbm), 0);
+}
+
+static void test_used_mixed(struct kunit *test)
+{
+	struct xe_guc_db_mgr *dbm = test->priv;
+	const unsigned int usable_count = 2;
+	const unsigned int shareable_count = 3;
+	unsigned int shareable_start;
+	int usable_id, shareable_id;
+
+	require_iov_config_or_skip(test);
+
+	KUNIT_ASSERT_EQ(test, dbm_init(dbm, DBM_TEST_POOL_SIZE, DBM_TEST_POOL_SIZE), 0);
+
+	guard(mutex)(dbm_mutex(dbm));
+	shareable_start = dbm_shareable_start(dbm);
+
+	usable_id = test_dbm_reserve_usable_locked(dbm, usable_count);
+	KUNIT_EXPECT_EQ(test, usable_id, 0);
+	if (usable_id < 0)
+		return;
+
+	shareable_id = dbm_reserve_chunk_shareable_locked(dbm, shareable_count, 0);
+	KUNIT_EXPECT_EQ(test, shareable_id, shareable_start);
+	if (shareable_id < 0) {
+		dbm_release_chunk_locked(dbm, usable_id, usable_count);
+		return;
+	}
+
+	KUNIT_EXPECT_EQ(test, dbm_used_usable(dbm), usable_count);
+	KUNIT_EXPECT_EQ(test, dbm_used_shareable(dbm), shareable_count);
+	KUNIT_EXPECT_EQ(test, test_dbm_used_total(dbm), usable_count + shareable_count);
+
+	KUNIT_EXPECT_EQ(test,
+			test_dbm_release_usable_locked(dbm, usable_id, usable_count), 0);
+	KUNIT_EXPECT_EQ(test,
+			test_dbm_release_shareable_locked(dbm, shareable_id,
+							  shareable_count), 0);
+	KUNIT_EXPECT_EQ(test, test_dbm_used_total(dbm), 0);
+}
+
+static void test_release_usable_range(struct kunit *test)
+{
+	struct xe_guc_db_mgr *dbm = test->priv;
+	const unsigned int count = 4;
+	int id;
+
+	KUNIT_ASSERT_EQ(test, dbm_init(dbm, DBM_TEST_POOL_SIZE, 0), 0);
+
+	guard(mutex)(dbm_mutex(dbm));
+
+	id = test_dbm_reserve_usable_locked(dbm, count);
+	KUNIT_EXPECT_EQ(test, id, 0);
+	if (id < 0)
+		return;
+
+	KUNIT_EXPECT_EQ(test,
+			test_dbm_release_usable_locked(dbm, count,
+						       DBM_TEST_POOL_SIZE - count + 1),
+			-ERANGE);
+	KUNIT_EXPECT_EQ(test, dbm_used_usable(dbm), count);
+
+	KUNIT_EXPECT_EQ(test, test_dbm_release_usable_locked(dbm, 0, 0), -EINVAL);
+	KUNIT_EXPECT_EQ(test, dbm_used_usable(dbm), count);
+
+	KUNIT_EXPECT_EQ(test, test_dbm_release_usable_locked(dbm, id, count), 0);
+	KUNIT_EXPECT_EQ(test, dbm_used_usable(dbm), 0);
+}
+
+static void test_release_shareable_range(struct kunit *test)
+{
+	struct xe_guc_db_mgr *dbm = test->priv;
+	const unsigned int count = 4;
+	unsigned int shareable_start;
+	int id;
+
+	require_iov_config_or_skip(test);
+
+	KUNIT_ASSERT_EQ(test, dbm_init(dbm, DBM_TEST_POOL_SIZE, DBM_TEST_POOL_SIZE), 0);
+
+	guard(mutex)(dbm_mutex(dbm));
+
+	shareable_start = dbm_shareable_start(dbm);
+	id = dbm_reserve_chunk_shareable_locked(dbm, count, 0);
+	KUNIT_EXPECT_EQ(test, id, shareable_start);
+	if (id < 0)
+		return;
+
+	KUNIT_EXPECT_EQ(test,
+			test_dbm_release_shareable_locked(dbm, shareable_start - 1, count),
+			-ERANGE);
+	KUNIT_EXPECT_EQ(test, dbm_used_shareable(dbm), count);
+
+	KUNIT_EXPECT_EQ(test,
+			test_dbm_release_shareable_locked(dbm, shareable_start, 0),
+			-EINVAL);
+	KUNIT_EXPECT_EQ(test, dbm_used_shareable(dbm), count);
+
+	KUNIT_EXPECT_EQ(test, test_dbm_release_shareable_locked(dbm, id, count), 0);
+	KUNIT_EXPECT_EQ(test, dbm_used_shareable(dbm), 0);
+}
+
+static void test_split_boundaries(struct kunit *test)
+{
+	struct xe_guc_db_mgr *dbm = test->priv;
+	const unsigned int pool_size = DBM_TEST_POOL_SIZE;
+	unsigned int shareable_start;
+	int usable_id, shareable_id;
+
+	require_iov_config_or_skip(test);
+
+	KUNIT_ASSERT_EQ(test, dbm_init(dbm, pool_size, pool_size), 0);
+
+	guard(mutex)(dbm_mutex(dbm));
+
+	shareable_start = dbm_shareable_start(dbm);
+
+	usable_id = test_dbm_reserve_usable_locked(dbm, pool_size);
+	KUNIT_EXPECT_EQ(test, usable_id, 0);
+	if (usable_id < 0)
+		return;
+	KUNIT_EXPECT_EQ(test, test_dbm_reserve_usable_locked(dbm, 1), -ENOSPC);
+
+	shareable_id = dbm_reserve_chunk_shareable_locked(dbm, pool_size, 0);
+	KUNIT_EXPECT_EQ(test, shareable_id, shareable_start);
+	if (shareable_id < 0) {
+		dbm_release_chunk_locked(dbm, usable_id, pool_size);
+		return;
+	}
+	KUNIT_EXPECT_EQ(test, dbm_reserve_chunk_shareable_locked(dbm, 1, 0), -ENOSPC);
+
+	KUNIT_EXPECT_EQ(test, dbm_used_usable(dbm), pool_size);
+	KUNIT_EXPECT_EQ(test, dbm_used_shareable(dbm), pool_size);
+
+	dbm_release_chunk_locked(dbm, usable_id, pool_size);
+	dbm_release_chunk_locked(dbm, shareable_id, pool_size);
+	KUNIT_EXPECT_EQ(test, test_dbm_used_total(dbm), 0);
+}
+
+static void test_shareable_quota(struct kunit *test)
+{
+	struct xe_guc_db_mgr *dbm = test->priv;
+	const unsigned int overlap = 10;
+	const unsigned int tail = 10;
+	const unsigned int usable = GUC_NUM_DOORBELLS - tail;
+	const unsigned int shareable = overlap + tail;
+	const unsigned int spare = overlap + 1;
+	int usable_id, tail_id;
+
+	require_iov_config_or_skip(test);
+
+	KUNIT_ASSERT_EQ(test, dbm_init(dbm, usable, shareable), 0);
+
+	guard(mutex)(dbm_mutex(dbm));
+
+	/* spare is larger than the overlap, but the VF-exclusive tail is not limited by it */
+	usable_id = test_dbm_reserve_usable_locked(dbm, usable - spare);
+	KUNIT_EXPECT_GE(test, usable_id, 0);
+	if (usable_id < 0)
+		return;
+
+	tail_id = dbm_reserve_chunk_shareable_locked(dbm, tail, spare);
+	KUNIT_EXPECT_EQ(test, tail_id, usable);
+	if (tail_id < 0) {
+		dbm_release_chunk_locked(dbm, usable_id, usable - spare);
+		return;
+	}
+
+	KUNIT_EXPECT_EQ(test,
+			dbm_reserve_chunk_shareable_locked(dbm, 1, spare), -EDQUOT);
+
+	dbm_release_chunk_locked(dbm, usable_id, usable - spare);
+	dbm_release_chunk_locked(dbm, tail_id, tail);
+	KUNIT_EXPECT_EQ(test, test_dbm_used_total(dbm), 0);
+}
+
+static void test_shareable_spare(struct kunit *test)
+{
+	struct xe_guc_db_mgr *dbm = test->priv;
+	const unsigned int pools_size = DBM_TEST_PARTIAL_POOL_SIZE;
+	unsigned int shareable_start;
+	unsigned int overlap_size;
+	unsigned int shared_tail;
+	int id_tail, id_overlap, id_extra;
+
+	require_iov_config_or_skip(test);
+
+	KUNIT_ASSERT_EQ(test, dbm_init(dbm, pools_size, pools_size), 0);
+
+	guard(mutex)(dbm_mutex(dbm));
+	shareable_start = dbm_shareable_start(dbm);
+	overlap_size = dbm->usable - shareable_start;
+	shared_tail = dbm_total(dbm) - dbm->usable;
+
+	KUNIT_EXPECT_GT(test, overlap_size, 0);
+	KUNIT_EXPECT_GT(test, shared_tail, 0);
+
+	id_tail = dbm_reserve_chunk_shareable_locked(dbm, shared_tail, 1);
+	KUNIT_EXPECT_EQ(test, id_tail, dbm->usable);
+	if (id_tail < 0)
+		return;
+	KUNIT_EXPECT_EQ(test, dbm_used_shareable(dbm), shared_tail);
+
+	id_overlap = dbm_reserve_chunk_shareable_locked(dbm, overlap_size - 1, 1);
+	KUNIT_EXPECT_EQ(test, id_overlap, shareable_start + 1);
+	if (id_overlap < 0) {
+		dbm_release_chunk_locked(dbm, id_tail, shared_tail);
+		return;
+	}
+	KUNIT_EXPECT_EQ(test, dbm_used_shareable(dbm), dbm->shareable - 1);
+
+	id_extra = dbm_reserve_chunk_shareable_locked(dbm, 1, 1);
+	KUNIT_EXPECT_EQ(test, id_extra, shareable_start);
+	if (id_extra < 0) {
+		dbm_release_chunk_locked(dbm, id_tail, shared_tail);
+		dbm_release_chunk_locked(dbm, id_overlap, overlap_size - 1);
+		return;
+	}
+	KUNIT_EXPECT_EQ(test, dbm_used_shareable(dbm), dbm->shareable);
+
+	dbm_release_chunk_locked(dbm, id_tail, shared_tail);
+	dbm_release_chunk_locked(dbm, id_overlap, overlap_size - 1);
+	dbm_release_chunk_locked(dbm, id_extra, 1);
+	KUNIT_EXPECT_EQ(test, dbm_used_shareable(dbm), 0);
+}
+
+static void test_shareable_spare_fragmented_tail(struct kunit *test)
+{
+	struct xe_guc_db_mgr *dbm = test->priv;
+	const unsigned int overlap = 40;
+	const unsigned int tail = 50;
+	const unsigned int usable = GUC_NUM_DOORBELLS - tail;
+	const unsigned int shareable = overlap + tail;
+	const unsigned int stride = 5;
+	const unsigned int count = overlap - 1;
+	const unsigned int spare = 10;
+	const unsigned int overlap_free = 30;
+	const unsigned int tail_free = 20;
+	unsigned int shareable_start;
+	unsigned int i;
+
+	require_iov_config_or_skip(test);
+
+	KUNIT_ASSERT_EQ(test, dbm_init(dbm, usable, shareable), 0);
+
+	guard(mutex)(dbm_mutex(dbm));
+	shareable_start = dbm_shareable_start(dbm);
+	KUNIT_EXPECT_EQ(test, dbm->usable - shareable_start, overlap);
+
+	/*
+	 * Fragmented tail cannot fit @count doorbells, so the request must fall
+	 * back to the overlap, where it is limited by @spare.
+	 */
+	bitmap_fill(dbm->bitmap, dbm_total(dbm));
+	bitmap_clear(dbm->bitmap, shareable_start + 1, count);
+	for (i = dbm->usable; i < dbm_total(dbm); i++) {
+		if ((i - dbm->usable) % stride)
+			bitmap_clear(dbm->bitmap, i, 1);
+	}
+
+	KUNIT_EXPECT_EQ(test, dbm_reserve_chunk_shareable_locked(dbm, count, spare),
+			-EDQUOT);
+
+	bitmap_fill(dbm->bitmap, dbm_total(dbm));
+	bitmap_clear(dbm->bitmap, shareable_start, overlap_free);
+	bitmap_clear(dbm->bitmap, dbm_total(dbm) - tail_free, tail_free);
+	KUNIT_EXPECT_EQ(test, dbm_reserve_chunk_shareable_locked(dbm, overlap_free, 1),
+			-EDQUOT);
 
-	KUNIT_ASSERT_LT(test, xe_guc_db_mgr_reserve_range(dbm, *p, dbm_total(dbm)), 0);
-	KUNIT_ASSERT_LT(test, xe_guc_db_mgr_reserve_range(dbm, *p, dbm_total(dbm) - *p + 1), 0);
-	KUNIT_ASSERT_EQ(test, id = xe_guc_db_mgr_reserve_range(dbm, *p, dbm_total(dbm) - *p), 0);
-	KUNIT_ASSERT_LT(test, xe_guc_db_mgr_reserve_range(dbm, 1, dbm_total(dbm) - *p), 0);
-	xe_guc_db_mgr_release_range(dbm, id, *p);
+	bitmap_zero(dbm->bitmap, dbm_total(dbm));
 }
 
 static struct kunit_case guc_dbm_test_cases[] = {
+	KUNIT_CASE(test_bad_init),
 	KUNIT_CASE(test_empty),
 	KUNIT_CASE(test_default),
 	KUNIT_CASE_PARAM(test_size, guc_dbm_gen_params),
@@ -189,6 +841,21 @@ static struct kunit_case guc_dbm_test_cases[] = {
 	KUNIT_CASE_PARAM(test_range_overlap, guc_dbm_gen_params),
 	KUNIT_CASE_PARAM(test_range_compact, guc_dbm_gen_params),
 	KUNIT_CASE_PARAM(test_range_spare, guc_dbm_gen_params),
+	KUNIT_CASE(test_limits),
+	KUNIT_CASE(test_overlap),
+	KUNIT_CASE(test_overlap_alloc),
+	KUNIT_CASE(test_overlap_release),
+	KUNIT_CASE(test_overlap_partial_init),
+	KUNIT_CASE(test_overlap_partial_shared_range_blocking),
+	KUNIT_CASE(test_used_usable),
+	KUNIT_CASE(test_used_shareable),
+	KUNIT_CASE(test_used_mixed),
+	KUNIT_CASE(test_release_usable_range),
+	KUNIT_CASE(test_release_shareable_range),
+	KUNIT_CASE(test_split_boundaries),
+	KUNIT_CASE(test_shareable_quota),
+	KUNIT_CASE(test_shareable_spare),
+	KUNIT_CASE(test_shareable_spare_fragmented_tail),
 	{}
 };
 
-- 
2.34.1

