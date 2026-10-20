Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BE18606A319
	for <intel-xe@archiver.kernel.org>; Tue, 20 Oct 2026 08:43:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=NEECi3YY
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3518C10F3D5;
	Tue, 20 Oct 2026 08:43:34 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 255EC10F3D5
 for <intel-xe@lists.freedesktop.org>; Tue, 20 Oct 2026 08:43:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792485808; x=1824021808;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=2CVd0jLH9+lIhBfkHveIg/XB2K41fbWCTt5Spmg7ZrI=;
 b=NEECi3YYGcf2olKtuvFV6WYQkTL9uv7BE4NddxuCqW7jaPTjwcXqbqSN
 8sXLb6khU1gfvaEvi2QpVtdvKPQyBPNptUjnL09SxeapRdq59xXyXd9FG
 fBSI3x7BOn9RxmgPs3J0NpatBS+ng75QZankIwtg06G026ppVYNhozB9V
 lnJgCVaIUkLlNdwdO/GcgMJ8VziprWcHgUROjEIIjlTmyORrTZs426iF3
 sh/Y5Px60vb8abMTWN1KpHQs4lH2+YMce4hP+DTFpMOYSXZgrIVz3KHdE
 STxvnYbD9oZwDNeqLA20gaV8reCxEltvw0RI2VzI0ouWGMos/WmT6uc8J g==;
X-CSE-ConnectionGUID: oasOgid3TCW8GZ92rSqOcA==
X-CSE-MsgGUID: aJiJ6QTJQpuD9MoJnm5yhQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11940"; a="1072115"
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="1072115"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2026 01:43:28 -0700
X-CSE-ConnectionGUID: 29k/bszYQamh6sIPUiCKFw==
X-CSE-MsgGUID: 7P7FwZhvQz2AsnYg+6BifQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="3221589"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2026 01:43:28 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 20 Oct 2026 01:43:27 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Tue, 20 Oct 2026 01:43:27 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.2) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 20 Oct 2026 01:43:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FrgcenVaTlf8It+BGlycZ6SBfHBeaLHx5tivJRYkpGyvEYu6RykdV2gFACxDB0Ox71R5K0e7SQhjZotPEfPzuoVYecW6O5CZ9zNK7G5t46M2DQlCTEScxv7mLJ2XQAnrYqQwvIeKI1iVC4Tqfh5KU5FlWbpnGG/uCARE3Fkfa2cjEDrPSqZl6XrA2GH6Pt3+xprwRNmuyLH2mf00UoOTeBEsnj+q5kepEoulmC2cZug47N0X3zd9foKyz1RQ/ofDnr9WJDaiKjReLIDe8ZV6MtzHgQqCJcUVp5RzT1ynDzZFCz0EMPkO7LdbjIo/+qSDXIjQ+X4eoxYk9wciwO/ugA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+FSEObzXf0NOD9weqNXDdL4ChkoKbfjHTtyGCZw+xTo=;
 b=RXYnrQBkSVqiH7IU7ck2bWf1ejyXPeOy7R7xvQQlTTYM29LcX0vbcOlIFc8F2PMCggQDvBxHP+iIeterTBUvmBohCy2qe7084b7e2AqoGdyGEYpmmIwzo1VQ9UlWamLf+16IJV0+bSpftMTCkYw3buEGdWLxYZbpp+f2HGJzCsMsuVuZri7BXQHZHtJTCQMwtiZXSIFReZIN6SGoc3EQXlnaLxd5X0LIHwcYn3gRHekMwJb1F4H2J7u7pUwdhGba3A0DfALB8lYOtMGOrBL1Um+f0Ntc7EWEPQ0Zj669//DJ9+KH4kfRJfcDnbcy9WufmEpwspGuENtN0W1rohTGhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8039.namprd11.prod.outlook.com (2603:10b6:510:25f::18)
 by DSWPR11MB9581.namprd11.prod.outlook.com (2603:10b6:8:36e::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Tue, 20 Oct
 2026 08:43:25 +0000
Received: from PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92]) by PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92%2]) with mapi id 15.21.0546.012; Tue, 20 Oct 2026
 08:43:25 +0000
From: =?UTF-8?q?Pi=C3=B3rkowski=2C=20Piotr?= <piotr.piorkowski@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
Subject: [PATCH v3 5/7] drm/xe/vram: Allow splitting a region into pools
Date: Tue, 20 Oct 2026 10:42:56 +0200
Message-ID: <20261020084258.443645-6-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261020084258.443645-1-piotr.piorkowski@intel.com>
References: <20261020084258.443645-1-piotr.piorkowski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DUZP191CA0047.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:10:4f8::14) To PH8PR11MB8039.namprd11.prod.outlook.com
 (2603:10b6:510:25f::18)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8039:EE_|DSWPR11MB9581:EE_
X-MS-Office365-Filtering-Correlation-Id: 03ea0aa1-2ca3-4f4f-40c9-08df2e8634c5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|23010399003|56012099006|5023799004|11063799006|261009223027099003|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: cKdVu21Vs3vD9GiMPKXrP4xmBPRgYWYNQB3T/kTFfLCyh8ZKwyqtVGfgEkbZZTWciUPdAhfxro5XbP+LOa0yzlOBuS+dn8uVMP57A3Zkpud3s1vMvkN/XhxWHMBxO6c2lD8DBAmXO2P69bpCu1/ej5aPbGgEKK74PjdHINu/aEIz20/Ogf+aZkAug4Ij7O9GOdohH1xTFoKBK7fPw1pXTjUh7nZTklwjQ1/RRm8oqkL7VaKx1UsaFStRlCv0fiThOxrufN567pJkNoIlPW5XqQmH9L1a4nXTI962aa723rqTcp3uLHLHc4XcjDcyAxp63QTlfRNsBfzO3U8fjjBbJP2ZmPXXZQst5Pupbj7tEJpmiy7OrUiQSuWNgVWepovfjNX8/KK0Tnwtsr9VoXqeA2asLogHP+nJ7rV1u5ldDAZ7sS8SdCb1EtE6JDfxirn5i6zGQxZ66q8/JFYtqmlPl9zblFcgInDALZxsdt6FQlx1JBDl9IhIWRj00X/zw15F/rX+TtQFF6z7QZ/kc5hK2ouLYXY4+GPptWnuvoARgRJANCPr5jS0frHJvmkW9VSgJzsCghRolK7UllFDxDcumg0FbIK2UGlyG18jl23c1tr1RnBoVTcgzGdb/j2fClCW/Q9+Dl2CsPdEewfuwk5C/O0Se7Np9qY6kRzoRu9dwxo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8039.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(56012099006)(5023799004)(11063799006)(261009223027099003)(10067099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bHV5eTJnelZ5c1RKZCtWN3ZPUFZTbHNWMTVweTJKN0NUai9aQlpjd1h0cjJh?=
 =?utf-8?B?dzNvQzc4SnlIcjhHMG0rNmpJMGtqR3lPZ0Y2NkluOVZrbHBTNERtMUFJcTE5?=
 =?utf-8?B?Tk9MQ1E5YWpVTFJWQjUycDJXQVJtaGVYQm9UaU0yb0hnVDltY0FTdUNoVWNI?=
 =?utf-8?B?NEI1ZG5XUjZYMDMyb051d1RaN0Z5UkFpTkQ3dDRmVUVKSEozVjlBeEg3a0ox?=
 =?utf-8?B?b3hOODQ2K3hDNHdUU2JCaVlORlRWcE1YWTlNS2xUUUFWNjk5T0trRnk5R3NO?=
 =?utf-8?B?VE1VSW9Pay8xV1RBL0VTVTlnR21mRHViQ3grNjBacEF4bStMZWQ3MXJDbklN?=
 =?utf-8?B?TmMyWUxNUkhrdHd1Y01lUFlFRDFMVW1GWVVGTk1RV2dmUU9DcHk1aHJWb2Nz?=
 =?utf-8?B?MjBPdWUvL21jaHFmMG5QY2FmWWJzMDhhR3hUcHNBY25IVE1WWmJsQjk1dGpS?=
 =?utf-8?B?akh4TXBZRyt6VXFPY3VKT0ZsN3UveTl2OWpoU2FWeFdnWkdMZHNjSnFIV1hv?=
 =?utf-8?B?Y1BJcmg5dFZWUVEzZGJsYUxhMmhDTU1qdmxWaFJoZGdUNFdQZE5odWFCYjAw?=
 =?utf-8?B?RUxHTGppTUVMbXhmUWZ1WlZiWVpVZUkrSUdEektjbkozeHBsM2VweFhwZzRz?=
 =?utf-8?B?TGgwcmN3WWZmaDNBVnpIdFQ5WWFSV2JYeTQrdjQ5U1VyRXpiNU5OM1Fmamhw?=
 =?utf-8?B?YXhuSmFCTXV5dGZ2R1Z4bk8wUklHRG5jSUdFUVFORFNFM0ZGVG1td0c0SEJm?=
 =?utf-8?B?NjFRTzhpNHl5NGpSWW9ybTI1M0RIOHl2NFFLeW5FdHFIY1ZLZUhOSnhIUUJN?=
 =?utf-8?B?cmRXVFk1dFV2WUdrbEhPTk0vd3lHSWJKZXE3TUx6SXZ3OXBld09hT0xTZlla?=
 =?utf-8?B?VFJqUG9hQTU1ODk1QmZRaGFMOGZ5Rk1ybEpRVEtzZnQ0dFRFL1I0b1oxS0ly?=
 =?utf-8?B?WFd2SE9DdTZQWStjcFVrNTVFa0gxOU42SEZSSGUxWW1IQmJzb0JvMHB6TDZ5?=
 =?utf-8?B?bnVzVG1BYnk0VHYvd0NEM0I1NCtBQk9pclRjSnJQMWthMnFGQlA2emZHUmlL?=
 =?utf-8?B?QndmUWl3UlNFNGc2OGwwMjI1WExybTUyQWo1bHFhOE1EVk9mSHp6T0NsUi9B?=
 =?utf-8?B?R3VhNndFUC9PM0dpVEwwZ0pLSG1SeWRFMHZEZXhRamN0WThFZ2krb2w1cFdk?=
 =?utf-8?B?VGk1YmdkNFBJZEdRanBKREJnQ2VzbTVzZkE4QXdxeTQxd3dscURDd09PanhG?=
 =?utf-8?B?cldwWE50cWV4eU9nTnh6ZU1NUjh0QTdEVW50Ty8wblBQMWU3Mk5SZlNnU2tS?=
 =?utf-8?B?Y3RjbWVod1RJeVpFVFlPc09WTDFhRmF6TGorMXR5WUR3SCt2K1dnbmF2WFBN?=
 =?utf-8?B?eHlTQ09UeWpzc3hVSjVESHI0RGlNUERQbkNQblg3RHNJZG9kYkdMTkc0N3lT?=
 =?utf-8?B?ckx3VHk1L2FnR2V0bmxJTDZLWndKYlJTMWVhQlUrTVk5dGNacDJlK05IVnhT?=
 =?utf-8?B?OUhYRWFGbTZwV2ZlbW5VVE1PY05WOEd1MmE1ZW13WHFNSzhtMjF6UFRsaERM?=
 =?utf-8?B?WFRKRmFQbytPdU4xbmtVb2hzcEJYUDJhWXp3WjVhZUJ1TkY3Q0tCeG54NUVo?=
 =?utf-8?B?TWY1a29jeEtTdUk5TUxSdk9ucFkzM3J2dnN2RHZBb2ZsbFVyR2NIWm1naldR?=
 =?utf-8?B?MmxFdzBickVJaTNINHVWcjJsQUM0TFBMNG9QZFBuQ3ZMNW11dmlaL3ZBK2hj?=
 =?utf-8?B?MEVLVWVlYjQwd3R1QmtHVDEzTUNVbTBGd243Sk1HSk9qYWx1d0U5UmpCS3Yw?=
 =?utf-8?B?NVpTR1hSUDlMWDZkYjAwUUxGWU5Dc0t1Y2dQMVNFWlNwVHZMR0Z0Z2FVRDh6?=
 =?utf-8?B?QVFJSlZ3WDUzeUlLeWVkTGwzL1FuQzlYanF4aHozWnI0cUVHSmhMeVJXRSs3?=
 =?utf-8?B?Z3l5cnRhL095RjNMYUk4TFJFSWNJaHo1eDFIRTUwS0FIVm4wWkRZYkZ3dDM0?=
 =?utf-8?B?SUJod2ZvTVMrTkg3WmFXTkhzbmhLL2tJVDhTeERUbklrZTdIbzFrK01ZQlVn?=
 =?utf-8?B?TUQvVTE5TGRBZy9kN1pqTE9Ic2tTNU1ZeHhhN2lLRHpHc29hclozUlJhQ1l3?=
 =?utf-8?B?bGZnSWhlbktjOHJXQWVjLzlkR3pjOElqTklQVzZQK0N0ZGxSVGZCcUpraFhD?=
 =?utf-8?B?T2oyOTNIbktBdHpRMWFUUVBaT1ZuZkt4MThXQS9oS3dWTUJqTjNHRGZsRWMw?=
 =?utf-8?B?MGFRN0dYZk9ZUkkreWVUOEtKd2FWYmFSVXQ1MVM2UWtEM2RrRWdXaFJjMGZ4?=
 =?utf-8?B?a3QwdXhzeHQ5cDRFTVZ6U2VvNjVNdlhmWkowN0ZwOWo2dzc5QnI5SmJjSDl3?=
 =?utf-8?Q?bgZkIdxB/FAbyiQQ=3D?=
X-Exchange-RoutingPolicyChecked: QnONeofjsSfnV4SPJMrsbxWCm4CzUVp3sZPwMets4vUgZyFDGDtcJqwqPJouSMF07wReJlU/y7snPX4r8qYFnKXd/ZTs7bbbO6PibHP8tTre1ADbmQYmDKX+Xf+RIphLWkZBbjc5YrErctk2Crm9RnM04mgNHBsKXq0pUPJ/kqePpOtcFHy3lgRp/sY/3K2ElXCidPpSR4ncYe2SE/I3EGrPGcofPDYlAp1pF9vJenrWcM2y7yw+GBbqkZMxNejWsJDBLm6xbqmaAFngAtYPj6ZciegVDfF6BH4rF0WfwJPPZEZZhWPPfoX+nmviQYIPz/UFdGWwLle9jpbo+8YSjQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 03ea0aa1-2ca3-4f4f-40c9-08df2e8634c5
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8039.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2026 08:43:25.6809 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KFbLdFjTGH/Q0mi9zRHZOWUxDFrgZCRJCX6nn/QD4q89TlLrP9DZv/+i6Onb4YSKQdenJD/3Zc+urVkokJ2lt666EvZKVmaUjCb7hiFgnGw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSWPR11MB9581
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

Add xe_vram_pool_create(), which carves a pool with a dedicated purpose
out of the low addresses of a region and shrinks the default pool
accordingly. This is the building block for reserving a range of a
tile's VRAM exclusively for a given purpose, e.g. the lowest chunk for
kernel allocations. Placement of such a pool is narrowed to the page
range it covers, and the VRAM manager backs it with a buddy allocator
of its own.

BO placement resolves pools through the tile, so creating a pool does not
by itself redirect any allocation, the caller has to publish the new pool
in the tile.

Nothing creates a second pool yet, so there is still no functional
change.

Assisted-by: Claude Opus 5.5
Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
---
 drivers/gpu/drm/xe/xe_vram.c | 88 ++++++++++++++++++++++++++++++++++--
 drivers/gpu/drm/xe/xe_vram.h |  2 +
 2 files changed, 87 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vram.c b/drivers/gpu/drm/xe/xe_vram.c
index 583906f93bc43..6e0f5c4660e4e 100644
--- a/drivers/gpu/drm/xe/xe_vram.c
+++ b/drivers/gpu/drm/xe/xe_vram.c
@@ -42,6 +42,18 @@ static const char *stringify_vram_binding(enum xe_vram_binding binding)
 	return "Unknown";
 }
 
+static const char *stringify_vram_pool_purpose(enum xe_vram_pool_purpose purpose)
+{
+	switch (purpose) {
+	case XE_VRAM_POOL_GENERAL:
+		return "General";
+	case XE_VRAM_POOL_KERNEL:
+		return "Kernel";
+	}
+
+	return "Unknown";
+}
+
 static bool resource_is_valid(struct pci_dev *pdev, int bar)
 {
 	if (!pci_resource_flags(pdev, bar))
@@ -299,7 +311,8 @@ struct xe_vram_pool *xe_vram_region_default_pool(struct xe_vram_region *vram)
  * xe_vram_tile_alloc_kernel - Initialize the kernel VRAM pool of a tile
  * @tile: the &xe_tile, with its general purpose VRAM pool already allocated
  *
- * Kernel allocations use the general-purpose pool by default.
+ * Kernel allocations use the general-purpose pool by default. A separate
+ * kernel-only pool can be created explicitly with xe_vram_pool_create().
  *
  * Return: 0 on success, negative error code on failure.
  */
@@ -364,19 +377,88 @@ static int vram_region_init(struct xe_device *xe, struct xe_vram_region *vram,
 	vram->dpa_base = lmem_bar->dpa_base + offset;
 	vram->usable_size = usable_size;
 
+	print_vram_region_info(xe, vram);
+
 	/* The device aggregate only reports sizes, nothing is allocated from it */
 	if (vram->binding != XE_VRAM_BINDING_DEVICE) {
 		/* Until split, partitions[0] spans the whole usable range */
 		vram->partitions[0].offset = 0;
 		vram->partitions[0].size = usable_size;
 		vram->num_partitions = 1;
+		drm_info(&xe->drm,
+			 "Created %s[%u] VRAM pool[%u]: purpose=%s offset=0x%llx size=0x%llx\n",
+			 stringify_vram_binding(vram->binding), vram->id, 0,
+			 stringify_vram_pool_purpose(vram->partitions[0].purpose),
+			 vram->partitions[0].offset, vram->partitions[0].size);
 	}
 
-	print_vram_region_info(xe, vram);
-
 	return 0;
 }
 
+/**
+ * xe_vram_pool_create - Add a pool to a VRAM region
+ * @vram: the VRAM region
+ * @purpose: the purpose served by the new pool
+ * @size: the size of the new pool
+ *
+ * Add a pool at the bottom of @vram and shrink the default pool accordingly.
+ * Existing non-default pools stay at the bottom in creation order. All pools
+ * share the region, the TTM manager and the placement, while the VRAM manager
+ * backs each of them with a buddy allocator of its own.
+ *
+ * The bottom of a region is also where its CPU visible window starts, so on
+ * a small BAR device the new pool takes CPU visible memory away from the
+ * default pool.
+ *
+ * Creating a pool does not make allocations use it. BO placement resolves
+ * pools through the tile, so the caller has to publish the new pool there,
+ * e.g. in &xe_tile.mem.kernel_vram for a kernel-only pool.
+ *
+ * Return: the new pool, or NULL if the pool cannot be created, in particular
+ * once the TTM manager of @vram is initialized.
+ */
+struct xe_vram_pool *xe_vram_pool_create(struct xe_vram_region *vram,
+					 enum xe_vram_pool_purpose purpose, u64 size)
+{
+	struct xe_device *xe = vram->xe;
+	struct xe_vram_pool *pool;
+	u64 offset;
+
+	/* Splitting is only safe while no memory has been handed out yet */
+	if (ttm_resource_manager_used(&vram->ttm.manager))
+		return NULL;
+
+	/* A region without partitions, e.g. the device aggregate, cannot split */
+	if (!vram->num_partitions ||
+	    vram->num_partitions >= XE_VRAM_MAX_PARTITIONS)
+		return NULL;
+
+	if (!size || !IS_ALIGNED(size, XE_TTM_VRAM_MGR_PART_ALIGN))
+		return NULL;
+
+	if (size >= vram->partitions[0].size)
+		return NULL;
+
+	offset = vram->partitions[0].offset;
+	pool = &vram->partitions[vram->num_partitions];
+	*pool = (struct xe_vram_pool) {
+		.region = vram,
+		.offset = offset,
+		.size = size,
+		.purpose = purpose,
+	};
+	vram->partitions[0].offset += size;
+	vram->partitions[0].size -= size;
+	vram->num_partitions++;
+	drm_info(&xe->drm,
+		 "Created %s[%u] VRAM pool[%u]: purpose=%s offset=0x%llx size=0x%llx\n",
+		 stringify_vram_binding(vram->binding), vram->id,
+		 vram->num_partitions - 1,
+		 stringify_vram_pool_purpose(pool->purpose), pool->offset, pool->size);
+
+	return pool;
+}
+
 /**
  * xe_vram_pool_place - Fill in the TTM placement of a pool
  * @pool: the VRAM pool to place in
diff --git a/drivers/gpu/drm/xe/xe_vram.h b/drivers/gpu/drm/xe/xe_vram.h
index 1f15ca456f191..23283cfe5fed7 100644
--- a/drivers/gpu/drm/xe/xe_vram.h
+++ b/drivers/gpu/drm/xe/xe_vram.h
@@ -21,6 +21,8 @@ int xe_vram_probe(struct xe_device *xe);
 struct xe_vram_region *xe_vram_region_alloc_device(struct xe_device *xe);
 struct xe_vram_region *xe_vram_region_alloc_tile(struct xe_device *xe, u8 id);
 struct xe_vram_pool *xe_vram_region_default_pool(struct xe_vram_region *vram);
+struct xe_vram_pool *xe_vram_pool_create(struct xe_vram_region *vram,
+					 enum xe_vram_pool_purpose purpose, u64 size);
 int xe_vram_tile_alloc_kernel(struct xe_tile *tile);
 
 void xe_vram_pool_place(const struct xe_vram_pool *pool, struct ttm_place *place);
-- 
2.34.1

