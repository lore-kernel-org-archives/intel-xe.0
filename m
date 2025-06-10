Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CD29C5B552
	for <intel-xe@archiver.kernel.org>; Tue, 10 Jun 2025 14:19:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7DDE10E573;
	Tue, 10 Jun 2025 14:19:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eqO48sHa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D570410E579
 for <intel-xe@lists.freedesktop.org>; Tue, 10 Jun 2025 14:19:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749565172; x=1781101172;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=OyP7d89tz9Lf0xchldri37X6/hpD68Clxe8m9mEZsDs=;
 b=eqO48sHahrKJT6Uasd+OehisVeo0Nxc6jYadJMyHwxMGkgnNm4yTavZm
 HW/5QtsZanj7VaCTJwnN3YP8fwOxoyX+uSmx7NVGSn5d8XoNUxv9jm03d
 uRsBu3s27zZNK+bQocLmvradwALn162El1Py6mje1jgklwj23LoRUkjTv
 uYocyeeui/lyH6X06Z/tNvGfmb7O0yWdbJHS+FWDWdFDOwR0G4WzWLpgv
 U0uJcDjHlCPLFXHDrXu6eg4UB1x6w+kcK63Z8yR+PL4w9BMSKBtqGfNdf
 6B3MG6HQRnwT1t259k7XwoxCTaag23zVHHaQNM8VlRYCA8SIpSJgyTWOs Q==;
X-CSE-ConnectionGUID: YJmTVlGeSby30QNm6OME4g==
X-CSE-MsgGUID: OgavcTCbTeGVnUojw16KDw==
X-IronPort-AV: E=McAfee;i="6800,10657,11460"; a="63082259"
X-IronPort-AV: E=Sophos;i="6.16,225,1744095600"; d="scan'208";a="63082259"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2025 07:19:32 -0700
X-CSE-ConnectionGUID: U/ew+3CDQPmh+j2mxEP+hA==
X-CSE-MsgGUID: aw/mfhtgQ8qwNH7xDK9jzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,225,1744095600"; d="scan'208";a="177777398"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2025 07:19:33 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 10 Jun 2025 07:19:31 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 10 Jun 2025 07:19:31 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (40.107.100.89)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Tue, 10 Jun 2025 07:19:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VPCCDaq3N02v8pWm8gHnA0eyDZn5jzTjIdjDog9jsmtedujfvqd9lRkst+Q0xVXBoi6/Dsjkdj1lcrrwyTWdkKcjNjBsrZOkA1UkBs5lL/8VT/Fh8P6h94flKxrymbeJEs4GtnZi8eRnECXuwusi533kYnpTHyT3Tm09msWA2+v+anU2q7vl/fP1RO8NcDeZWSu/rD2Sp62dM9DR8qDAqpntpzoLxJQiILu/W/lWeH7Qw8n4sZz0cq6Cepxt9zqP5Wso//dQN+mS800PsL+oMo9IYsfKdOLBPZOKsZHItzVoD0R0xX9mI6LWXFBAhnZr2ZTwBR19x5eYNJBhV8/C5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fWkoMEu33625hknzjsSdGUxf/8E22652z8pzV5AfVKs=;
 b=t8z7y3H2QgHhxOLgBeJv5b7KdLEYmHh3B3qe4yp9WmwSp0bRc/vQG9gliZRoTW8mSbnS+L3q8gaIptoC4tUM/VCSIikdnOwjpgEHjPaDkf34s++q3oZ3fO+/B/xbFte6C4XJo6YwhYD4kVzItEiCtm/aTsb5TpF8pD0XLj7yStolggp/RyjUMv8DZ1op3N+bkbcmrf5WhvJyMgcCADTFSO3/EmZutduDb4cq/omhmId2O5CpBpZgUCIq9ANbhEbixhJOuZfmKVjadooKllYKxoKFTzo5a8kViUhe6WsUM0odA/68tjBmwDbfF/jLUQ00nIyTwSu1umwEbBjVr/VHLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SN7PR11MB7509.namprd11.prod.outlook.com (2603:10b6:806:346::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.22; Tue, 10 Jun
 2025 14:19:28 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%5]) with mapi id 15.20.8835.018; Tue, 10 Jun 2025
 14:19:28 +0000
Date: Tue, 10 Jun 2025 07:21:03 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: "Levi, Ilia" <ilia.levi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <koby.elbaz@intel.com>,
 <konstantin.sinyuk@intel.com>, <yaron.avizrat@intel.com>,
 <moti.haimovski@intel.com>, <didi.freiman@intel.com>
Subject: Re: [PATCH v2] drm/xe: Support for mmap-ing mmio regions
Message-ID: <aEg/T1kv2/lJliuh@lstrano-desk.jf.intel.com>
References: <20250609095938.16782-1-ilia.levi@intel.com>
 <aEcByyaKe82P91RT@lstrano-desk.jf.intel.com>
 <fd377581-4013-4139-aea2-9fb2578d2773@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <fd377581-4013-4139-aea2-9fb2578d2773@intel.com>
X-ClientProxiedBy: MW4P221CA0002.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:303:8b::7) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SN7PR11MB7509:EE_
X-MS-Office365-Filtering-Correlation-Id: 1bbb69fd-1aa3-40f5-2a35-08dda829cf8a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?Iwx1Mq/uC0PmVayadn1Z0iYgMgbcxLhewZi9l4vMKvom8948WYOwMCYbja?=
 =?iso-8859-1?Q?mB0gu0diJ+s+qPS3MAuNu9oPK2yg2aklVYaNo+E9Cv9cAbdizwMjsuQyAR?=
 =?iso-8859-1?Q?rMsFAWr51VFpNv8SKymR9NK8nH1bPZXSYuWmBeGLMjKW0HAn8QRbETqy7V?=
 =?iso-8859-1?Q?SdNB/noFOIGtWkDsiMLB/5a7H+KtB682thkX0az1A6XFi5SgIGuVnB7cZU?=
 =?iso-8859-1?Q?4NKZW4Bbsnlw3jwBcw1O7fr2XG2mpn5u1gS7bwwKI0zM4pCSQ5EQwyj8dE?=
 =?iso-8859-1?Q?jeXYn1lG2+Tt5Npw9d0e5nRLRfyEqzou/212jDvSYqobrS013bH6/yrrqO?=
 =?iso-8859-1?Q?krdWBRJbPmEtvpVnkS5ePWYyExl83ob9k7mmnXnBJ9aCo7/vIIqnYfeGf5?=
 =?iso-8859-1?Q?I5LTHWDXDTi0+s4DnrkIRj79PvqTEuK5Zs1R+aJ5MzvBPBtiQjQ4Rj8gq6?=
 =?iso-8859-1?Q?mXD15kPeuuGt/V8uXTnMDk9tXlCeYjZcbX8AnDCCxemPYGZmt/CnwiMh5Y?=
 =?iso-8859-1?Q?E/lwtMN83+HJQ+u0cZIPv7LM+U5DGRgZUjsj14US3R1b5BCc2ZYK9AIP/K?=
 =?iso-8859-1?Q?W10KOw6mamgfjTjnvUAGRG7fT9fDXc9AiyHvcOFvpX2I82qvYHpENPbBcg?=
 =?iso-8859-1?Q?3yXUxCj7aiivKPmdW4pOuLtCpSVcZsJuDB/WZOC0aTk4g5MpnMThqMYMFU?=
 =?iso-8859-1?Q?BXzZCQjdDtSozRIScZRGPe81MY03FefsNAtyk2zxgOvaz9/COOs+lLRjOd?=
 =?iso-8859-1?Q?6+11uUw9W5Oa/77rwIjCmkRJ8okaA3n4TkgviDdMFUAr0vk95cq1yazRXT?=
 =?iso-8859-1?Q?deoUFUlmc60sBi2AjdsW1TYVhASC99cr08rM9adf6MFVYClKISWJyluBJm?=
 =?iso-8859-1?Q?+2tiTHNu5P+Z0euyjqEg6pZcCFANXX3qfQ2GfugTiANrktwwS74P+LpLg0?=
 =?iso-8859-1?Q?pGmKtef5PEMnn03dSRBRewj3BM8IDfhkX3icAz8KnRV0qmu9NNhFXksqMf?=
 =?iso-8859-1?Q?pvhNWbWoN1J2zdrjSbgtdfzM6brI1+FPPiWto00OSyyxLZhoTTzCxNoJK7?=
 =?iso-8859-1?Q?XG3q+Lf+HumkTYgzR768/fOq9YB+aMNTWT68S31NF4NBLL6DPgAQFGARK2?=
 =?iso-8859-1?Q?OXF19OhoxI9htFoJ39mOE8WtBAs+tA6ecMj+hopzs7f2IGrfgSaohCVUvR?=
 =?iso-8859-1?Q?8LA5n+B2qIeUzCGp1cf+d0XWZHYfapQu7RNCuEev7cWXL59qlJ2FcdhE7k?=
 =?iso-8859-1?Q?ptr6Gv0Iekggnli0yK7wh3JeGxBefuSwmyLJ2GIw10jgn7PvrjaD9bdeMP?=
 =?iso-8859-1?Q?CjpPF1m4DANGXFmU9rgKDVEs0t3IUv80n8TuMeq4AZqAkW6osb5Ooo2qy9?=
 =?iso-8859-1?Q?n+V4RPCHsSgnRm9SBpRT7ikf51Fpy2Q3daKiCN11IjVSYo887+2fWonUUz?=
 =?iso-8859-1?Q?qKiF2K13M+mIazGbSjrxFYSjSOF2cZZpkVBjY37p0N397kx1DW2bU6QMdM?=
 =?iso-8859-1?Q?Y=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?aj1oIcQ7tyMcJ2r6agq8rotrAHZvOga83jApFyc8XkzstVggihaa4Q4dyE?=
 =?iso-8859-1?Q?7+uQpdPoLdNzT+9g05m65rbP6vE6hom6Zd3JBcuT+OJKkeCzFoQUjzTWPA?=
 =?iso-8859-1?Q?qGifKpeLeXQdUkLXNcuZB/xOpR7NpZ3/iFjRZOSjYuzmZ5uK+/ujFgaYi/?=
 =?iso-8859-1?Q?o5LT3yRJm/qYCw2y0ZLrlLYi9fAxQ6HYp964Q1DiDy2oL3JljOS8mEX7k0?=
 =?iso-8859-1?Q?77+R0JfsbAGelvKcEIXPjrF86+cSJcAKwckg4KSfskJLt9pcqTij7d4IkT?=
 =?iso-8859-1?Q?PArC1gCHUadhTQe7TZjzABxMYvsJ5/WDmMDYcUKx04LNIv4qD6EfLTsFkb?=
 =?iso-8859-1?Q?nd8oUye8LxKftcCN062Sdk0Hp7H510JSyM1mrCEeba8ei64sPoouY4rUhi?=
 =?iso-8859-1?Q?Ujk4UY2kiaYIq/bb5sNaSPNZHLFzeagGt1l6wcRJglrNu8IjWc8tS8FrHM?=
 =?iso-8859-1?Q?LQKx+cXMbyZ2JyiMuoCf+BpwAtpk+nK2OgUzQnI0f2LeDXbRptVtuElBrB?=
 =?iso-8859-1?Q?SJiLuC2tHDXxwfcf+YBkv9iSLqC9WEraszwj02opwD5nICDbk9E4Hp1jmO?=
 =?iso-8859-1?Q?SltLk9IbeQdc/s0pPdMkgzQdoS5GTtRL+rNx3qxRKJcMiWsPwWhw9Th915?=
 =?iso-8859-1?Q?PAInCUh5rlTkpNAl4BxUXm0+YS3dyOMJs15iPToEgcszcfSf0b2dKTKADO?=
 =?iso-8859-1?Q?x5KLHc8vrkvSpeYP1+C0yMMxPpjTqhCKY40sBlnaC6+spJwa2tKdPVsjxe?=
 =?iso-8859-1?Q?ei/csJSL7djOFxBnG2RCqLESBLIwl9BPnn6D/i7MXDwLQbNX3hf2RKqmAN?=
 =?iso-8859-1?Q?JIlpuSmOKDyFLR3ijpmrAKQwX92ZfIZV0IrTgIPQweCx5ZTF7dZdgfgq6Q?=
 =?iso-8859-1?Q?hNz/XF2EUVhfVih6LlykxybR0tooDNPEpehrL0rMQnDpIBdOJgaZbYgOZM?=
 =?iso-8859-1?Q?6sQaNB4fNx/SdCYu4nkCb7EFYMvNvIjywEr6BnoJxGM/x+QmEI8Gh4De+J?=
 =?iso-8859-1?Q?9OJpTTFWbxkZzb5j7lSscLmtuIxK3aV/bUykUNUegeT4MNCu65/BgToN5G?=
 =?iso-8859-1?Q?V3qQ/F05i/DLrYhJoAkJwLAVCApflCmp2SdxOcXDfn/EiwOsi1VLH0qnOg?=
 =?iso-8859-1?Q?RN/ppARqCRQctT36OZJtVyLO9/2cCdk6nj0Ae/2alUBiR1KhQK8oE0hcul?=
 =?iso-8859-1?Q?yiixbvpL4qyu7jznq1WJ/L/qZJ/Nzaoy+k5uv63SxvQYd3MKZST8oTxn0L?=
 =?iso-8859-1?Q?ruO9tFDjJnPgoopvkVBkuHhcsalWZSTRVjBpqB21dMKzoWaP0iMf1t8Ccw?=
 =?iso-8859-1?Q?kowy9pQeE007Xscl+EtFGvvmI1h97jpuAYiMEEFDGUzb4YJ7g+d6DQNBBY?=
 =?iso-8859-1?Q?S5uUWiDSBHWG1XKKpO4cYGb/h0qdsOal9YiIM1DMeUaRrPzDtdWQeYqCW9?=
 =?iso-8859-1?Q?yX42nCkzpf985IIltI5hp4OW4QlLXocaRbioygG5w9u+3wQfLqPTUmQMIl?=
 =?iso-8859-1?Q?GxhahlfbyY7vYcKU5qu53NEfLbtl1iBAu26EwU4n0K3fIcWfWDZIts1jVD?=
 =?iso-8859-1?Q?jFyFdA0BoeRmzb6P54h5YI1oqX2/upsHPv/yR52NO/P8+hx4OrUmlzfUHn?=
 =?iso-8859-1?Q?C4nQBys7ILbjy0YhRq3KTcmiiijGM6RL7IwC5At8n/6iNDPJew6iGj6A?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1bbb69fd-1aa3-40f5-2a35-08dda829cf8a
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2025 14:19:28.7270 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c+A0uOiPqHD1byu/Zywtf5sUXWarEqxL8wfyeoyuKCcSKvV0CoaMRrlD+Tis4Kp98tXE65bzn6+1xd7PM9l32Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7509
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

On Tue, Jun 10, 2025 at 04:57:51PM +0300, Levi, Ilia wrote:
> On 09/06/2025 18:46, Matthew Brost wrote:
> > On Mon, Jun 09, 2025 at 12:59:38PM +0300, Ilia Levi wrote:
> >> Allow the driver to expose hardware register spaces to userspace
> >> through GEM objects with fake mmap offsets. This can be useful
> >> for userspace-firmware communication, debugging, etc.
> >>
> >> v2: Minor doc fix (CI)
> >>
> >> Signed-off-by: Ilia Levi <ilia.levi@intel.com>
> >> ---
> >>  drivers/gpu/drm/xe/xe_device_types.h |  14 +++
> >>  drivers/gpu/drm/xe/xe_mmio.c         | 142 +++++++++++++++++++++++++++
> >>  drivers/gpu/drm/xe/xe_mmio.h         |   4 +
> >>  3 files changed, 160 insertions(+)
> >>
> >> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> >> index ac27389ccb8b..78542de0d48d 100644
> >> --- a/drivers/gpu/drm/xe/xe_device_types.h
> >> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> >> @@ -10,6 +10,7 @@
> >>  
> >>  #include <drm/drm_device.h>
> >>  #include <drm/drm_file.h>
> >> +#include <drm/drm_gem.h>
> >>  #include <drm/drm_pagemap.h>
> >>  #include <drm/ttm/ttm_device.h>
> >>  
> >> @@ -161,6 +162,19 @@ struct xe_mmio {
> >>  	u32 adj_offset;
> >>  };
> >>  
> >> +/**
> >> + * struct xe_mmio_gem - GEM wrapper for xe_mmio
> >> + *
> >> + * A GEM object for exposing xe_mmio instance to userspace via mmap.
> >> + */
> >> +struct xe_mmio_gem {
> >> +	/** @base: GEM object base */
> >> +	struct drm_gem_object base;
> >> +
> >> +	/** @mmio: The MMIO region to expose */
> >> +	struct xe_mmio mmio;
> > Any reason not this is not a pointer to xe_mmio?
> 
> 
> Yes, I'd like to keep xe_mmio a lightweight object that could even be defined on the stack.
> Here's an example of how this could be used:
> 
> int foo_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
> {
>     struct xe_mmio mmio = {0};
>     struct xe_mmio_gem *gem;
> 
>     xe_mmio_init(&mmio, xe_device_get_root_tile(xe), xe->mmio.regs +
>                               SOME_HW_BLOCK_PCI_OFFSET, SOME_HW_BLOCK_SIZE);
> 
>     gem = xe_mmio_gem_create(&mmio, file);
>     / * store the gem somewhere, return drm_vma_node_offset_addr(&gem->base.vma_node) to the user */
> }
> 
> - Ilia
> 
> 
> >
> >> +};
> >> +
> >>  /**
> >>   * struct xe_tile - hardware tile structure
> >>   *
> >> diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
> >> index 7357458bc0d2..6bfa915a9602 100644
> >> --- a/drivers/gpu/drm/xe/xe_mmio.c
> >> +++ b/drivers/gpu/drm/xe/xe_mmio.c
> >> @@ -408,3 +408,145 @@ int xe_mmio_wait32_not(struct xe_mmio *mmio, struct xe_reg reg, u32 mask, u32 va
> >>  {
> >>  	return __xe_mmio_wait32(mmio, reg, mask, val, timeout_us, out_val, atomic, false);
> >>  }
> >> +
> >> +/**
> >> + * DOC: Exposing MMIO regions to userspace
> >> + *
> >> + * In certain cases, the driver may allow userspace to mmap a portion of the hardware registers.
> >> + *
> >> + * This can be done as follows:
> >> + * 1. Define an xe_mmio instance that represents this portion.
> >> + * 2. Call xe_mmio_gem_create() to create a GEM object with an mmap-able fake offset.
> >> + * 3. Use drm_vma_node_offset_addr() on the created GEM object to retrieve the fake offset.
> >> + * 4. Provide the fake offset to userspace.
> >> + * 5. Userspace can call mmap with the fake offset. The length provided to mmap
> >> + *    must match the size of the xe_mmio instance.
> >> + * 6. When the region is no longer needed, call xe_mmio_gem_destroy() to release the GEM object.
> >> + *
> >> + * Limitations: The exposed xe_mmio must be page-aligned with regards to its BAR offset and size.
> >> + *
> >> + * WARNING: Exposing MMIO regions to userspace can have security and stability implications.
> >> + * Make sure not to expose any sensitive registers.
> > This is no secondary issue, it is a primary one. There is no way we can
> > expose entire PCIe MMIO register space to a non-root user (a root user
> > itself can just mmap the PCIe MMIO bar bypassing the XeKMD if it wants
> > btw).
> >
> > What is the requirement for this patch? I know on other PCIe devices
> > I've worked on we had similar issues where we needed to expose a subset
> > of the PCIe MMIO register space to user space for kernel bypass
> > submission - everything we needed to expose in that case was 4k aligned
> > + tied to a single process via a KMD config before mapping to user
> > space. I suspect to do anything safely here, somethine similar needs to
> > be done.
> >
> > Matt
> 
> 
> As you've figured out -  the idea is of course to expose small chunks (say 1 page)
> that are allocated solely to a specific user. One use-case is direct submission in
> upcoming platforms. I am checking 4K alignment in the patch. Not sure what
> you mean about KMD config - xe_mmio_gem_create accepts a drm_file *.

On the previous device I worked on we'd config some non-user exposed
MMIO registers to tie the exposed user registers to specifc user process
(e.g. we'd setup the PASID of the exposed submission queue). Not sure if
something like is required on the upcoming device(s).

> So the driver performs exposure of an MMIO region on behalf of the user and
> only this user will be able to perform mmap. Do you think anything else is required
> here?

No, I think it makes sense now but personally I'd drop the reuse of
xe_mmio and keep that as a heavy weight kernel object only used in
xe_device, xe_tile, xe_gt, etc...

Can you just pass in size / MMIO address (result of xe_mmio_phys_addr)
to xe_mmio_gem_create? I think that would avoid a bit confusion.

Matt

> - Ilia
> 
> >
> >> + */
> >> +
> >> +static void xe_mmio_gem_free(struct drm_gem_object *);
> >> +static int xe_mmio_gem_mmap(struct drm_gem_object *, struct vm_area_struct *);
> >> +
> >> +static const struct vm_operations_struct vm_ops = {
> >> +	.open = drm_gem_vm_open,
> >> +	.close = drm_gem_vm_close,
> >> +};
> >> +
> >> +static const struct drm_gem_object_funcs xe_mmio_gem_funcs = {
> >> +	.free = xe_mmio_gem_free,
> >> +	.mmap = xe_mmio_gem_mmap,
> >> +	.vm_ops = &vm_ops,
> >> +};
> >> +
> >> +static inline struct xe_mmio_gem *to_xe_mmio_gem(struct drm_gem_object *obj)
> >> +{
> >> +	return container_of(obj, struct xe_mmio_gem, base);
> >> +}
> >> +
> >> +static inline phys_addr_t xe_mmio_phys_addr(struct xe_mmio *mmio)
> >> +{
> >> +	struct xe_device *xe = tile_to_xe(mmio->tile);
> >> +
> >> +	/*
> >> +	 * All MMIO instances are currently on PCI BAR 0, so we can do the trick below.
> >> +	 * In the future we may want to store the physical address in struct xe_mmio.
> >> +	 */
> >> +	return pci_resource_start(to_pci_dev(xe->drm.dev), GTTMMADR_BAR) +
> >> +		(uintptr_t)(mmio->regs - xe->mmio.regs);
> >> +}
> >> +
> >> +/**
> >> + * xe_mmio_gem_create - Expose an MMIO region to userspace
> >> + * @mmio: xe_mmio instance
> >> + * @file: DRM file descriptor
> >> + *
> >> + * This function creates a GEM object with an mmap-able fake offset that wraps
> >> + * the provided xe_mmio instance.
> >> + *
> >> + * See: "Exposing MMIO regions to userspace"
> >> + */
> >> +struct xe_mmio_gem *
> >> +xe_mmio_gem_create(struct xe_mmio *mmio, struct drm_file *file)
> >> +{
> >> +	struct xe_device *xe = tile_to_xe(mmio->tile);
> >> +	size_t size = mmio->regs_size;
> >> +	struct xe_mmio_gem *obj;
> >> +	struct drm_gem_object *base;
> >> +	int err;
> >> +
> >> +	if ((xe_mmio_phys_addr(mmio) % PAGE_SIZE != 0) || (size % PAGE_SIZE != 0))
> >> +		return ERR_PTR(-EINVAL);
> >> +
> >> +	obj = kzalloc(sizeof(*obj), GFP_KERNEL);
> >> +	if (!obj)
> >> +		return ERR_PTR(-ENOMEM);
> >> +
> >> +	base = &obj->base;
> >> +	base->funcs = &xe_mmio_gem_funcs;
> >> +	obj->mmio = *mmio;
> >> +
> >> +	drm_gem_private_object_init(&xe->drm, base, size);
> >> +
> >> +	err = drm_gem_create_mmap_offset(base);
> >> +	if (err)
> >> +		goto free_gem;
> >> +
> >> +	err = drm_vma_node_allow(&base->vma_node, file);
> >> +	if (err)
> >> +		goto free_gem;
> >> +
> >> +	return obj;
> >> +
> >> +free_gem:
> >> +	xe_mmio_gem_free(base);
> >> +	return ERR_PTR(err);
> >> +}
> >> +
> >> +static void xe_mmio_gem_free(struct drm_gem_object *base)
> >> +{
> >> +	struct xe_mmio_gem *obj = to_xe_mmio_gem(base);
> >> +
> >> +	drm_gem_object_release(base);
> >> +	kfree(obj);
> >> +}
> >> +
> >> +/**
> >> + * xe_mmio_gem_destroy - Destroy the GEM object wrapping xe_mmio
> >> + * @gem: the GEM object to destroy
> >> + *
> >> + * This function releases resources associated with the GEM object created by
> >> + * xe_mmio_gem_create().
> >> + *
> >> + * See: "Exposing MMIO regions to userspace"
> >> + */
> >> +void xe_mmio_gem_destroy(struct xe_mmio_gem *gem)
> >> +{
> >> +	xe_mmio_gem_free(&gem->base);
> >> +}
> >> +
> >> +static int xe_mmio_gem_mmap(struct drm_gem_object *base, struct vm_area_struct *vma)
> >> +{
> >> +	struct xe_mmio_gem *obj = to_xe_mmio_gem(base);
> >> +	struct xe_mmio *mmio = &obj->mmio;
> >> +
> >> +	if (vma->vm_end - vma->vm_start != base->size)
> >> +		return -EINVAL;
> >> +
> >> +	/*
> >> +	 * Set vm_pgoff (used as a fake buffer offset by DRM) to 0 and map the
> >> +	 * whole buffer from the start.
> >> +	 */
> >> +	vma->vm_pgoff = 0;
> >> +	vma->vm_page_prot = pgprot_noncached(vma->vm_page_prot);
> >> +
> >> +	vm_flags_set(vma, VM_IO | VM_PFNMAP | VM_DONTEXPAND | VM_DONTDUMP |
> >> +		     VM_DONTCOPY | VM_NORESERVE);
> >> +
> >> +	return remap_pfn_range(vma, vma->vm_start, xe_mmio_phys_addr(mmio) >> PAGE_SHIFT,
> >> +			       base->size, vma->vm_page_prot);
> >> +}
> >> diff --git a/drivers/gpu/drm/xe/xe_mmio.h b/drivers/gpu/drm/xe/xe_mmio.h
> >> index c151ba569003..2990bbcef24d 100644
> >> --- a/drivers/gpu/drm/xe/xe_mmio.h
> >> +++ b/drivers/gpu/drm/xe/xe_mmio.h
> >> @@ -8,6 +8,7 @@
> >>  
> >>  #include "xe_gt_types.h"
> >>  
> >> +struct drm_file;
> >>  struct xe_device;
> >>  struct xe_reg;
> >>  
> >> @@ -42,4 +43,7 @@ static inline struct xe_mmio *xe_root_tile_mmio(struct xe_device *xe)
> >>  	return &xe->tiles[0].mmio;
> >>  }
> >>  
> >> +struct xe_mmio_gem *xe_mmio_gem_create(struct xe_mmio *mmio, struct drm_file *file);
> >> +void xe_mmio_gem_destroy(struct xe_mmio_gem *gem);
> >> +
> >>  #endif
> >> -- 
> >> 2.43.0
> >>
> 
