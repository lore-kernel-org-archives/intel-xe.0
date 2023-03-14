Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3040AC6FD1C
	for <intel-xe@archiver.kernel.org>; Tue, 14 Mar 2023 15:51:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF5E810E81A;
	Tue, 14 Mar 2023 15:51:49 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FEDB10EA90
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Mar 2023 15:51:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678809108; x=1710345108;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=7xbfo4E855jlR894nG0wZTeyIJcRXeVGN2nRUe1l4rY=;
 b=Poc3X+2sf8isaYqH1tjUg/IyF0rHOR8nvObi+BttbCMYbpymiPC2nQi2
 SIlk+QTYLNeRslKJJ0lcwi++E7NSWhLLqfayzCl7H4f9tjnBnMTfLW6in
 R8qXed/MbxZRlDGexwVt3AkxKw2EBbXoYuxR0mxOe9sLPDrzU7Gp6WF4n
 4OQIvJrLEZXaB/OV5fYrnoVeSo2CempaiEwrafjq4gs8beoXNpcjnVseX
 tCf1V5SL45rRK/EucrmTecqi6Bve5R3FiIZc5GgwehATZ/DPnIV22eWDb
 XR73sFMPRowGz3Rjsz6sDn21SAvmV88tKV4nnykdxcW4cWkMtdESFRlzb A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10649"; a="317859164"
X-IronPort-AV: E=Sophos;i="5.98,260,1673942400"; d="scan'208";a="317859164"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2023 08:51:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10649"; a="822418150"
X-IronPort-AV: E=Sophos;i="5.98,260,1673942400"; d="scan'208";a="822418150"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga001.fm.intel.com with ESMTP; 14 Mar 2023 08:51:40 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Tue, 14 Mar 2023 08:51:40 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Tue, 14 Mar 2023 08:51:39 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Tue, 14 Mar 2023 08:51:39 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.177)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Tue, 14 Mar 2023 08:51:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HDdBAyOQYmD23/Gal7AL74BKGtib1Yd7B4cmpRqZUnpFHlmVv77SVrHXKxxJ/QZBcUhAp4Tx9X2cxucr9bfKEUS1AeCxFr0H4GUqgyR215EoLkWEr9QQaXlth6BmqceRbYF6LpS/AuU/AmKVoXqdlITOADV7H/BJoeVskXFH5xqKFkx83wl7z1iUG280Bpma6sV+vxfqU+gvnuNBjhSlgCRpIapWKrm3iUdUWLUycTpDWSIAp77PbzGNXTzpps5RBkrnxhBswRsYd84exyWJf+ulxsBPY8dhcyRPaJMvYLhTJVBYcb8scK/Uu7DZZGoZOlsI68xjFWfXnLlBsuwbGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=77goipuPs7GfxdN0nPxw64EAOH4hFnMcxk9HRmecFv0=;
 b=h6XhwbqzDB9QgJjqJnGG5RO0aN/pz3xOmPtBfdNzXJkNh8ajNMTGz1ZFCRsyeIJG0d1NMQFdcSMR3sXUxyKHMx0pdr8mQkvpd8ht91aaUaunMl2YkfdJ6cympRn9KiLAQGzR6M4giS6tSgUgBZfHkgoXMcCyUQaiYD4H1o8ahrdp24NTAw9bqOKKsqUJl/yQoDjeUO40MF5mnjBJbiUP63pL3l3lLyAimphZOBIkJ20EAgGlQo5n3a6kBB6Ik96LC/B4etOr663IbXkcou0FNzVJxCC2SIMI0VrkfTnOg1qXayMOoQFQrR8byUqtn6beWPFJ2kUvM4crZD65aC/dlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5389.namprd11.prod.outlook.com (2603:10b6:5:394::17)
 by MN2PR11MB4533.namprd11.prod.outlook.com (2603:10b6:208:264::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.26; Tue, 14 Mar
 2023 15:51:38 +0000
Received: from DM4PR11MB5389.namprd11.prod.outlook.com
 ([fe80::efa4:91b6:58e9:a831]) by DM4PR11MB5389.namprd11.prod.outlook.com
 ([fe80::efa4:91b6:58e9:a831%6]) with mapi id 15.20.6178.026; Tue, 14 Mar 2023
 15:51:37 +0000
From: Francois Dugast <francois.dugast@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Tue, 14 Mar 2023 16:51:08 +0100
Message-ID: <20230314155111.1546283-1-francois.dugast@intel.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0318.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:197::17) To DM4PR11MB5389.namprd11.prod.outlook.com
 (2603:10b6:5:394::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5389:EE_|MN2PR11MB4533:EE_
X-MS-Office365-Filtering-Correlation-Id: 52667351-4cff-4e56-36f2-08db24a3feda
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RoKJNx3tKY0sTJxS8mN3B2EoOpEmyX0Zfin7hsyP756YDz4uHebWl2dorBzetlyuNqEZiaFdsseZ9DNNN6lJ9yXbTAZM7cxyEbpqOpunFVVFPPEabZmBZ3rG2ASMdivMJuhSHbcSRh6wXT7OSSACEvl4WXpWX8XP0rnFDJ0aF371+BPs9pv7JG8j/b3wRQr4vM+QhQ4A/zhyLYW3V3yXQkItCxe1ut/77x9s70KQCtydH6MYT3NaB6XaPWZ0na2vuWOOx4DWcJZli1la45Mn/EIKds7KZg4btKqZhDuK1Cmc7vE7OPBwCW+WlNbqsbB5Z7X+7n79KvIYR1OSxiKX5AvsfS69XCWpIYgJF8pZuu26lWlClEfciKQ5QfuAAKyWV3fLHI2PKW7hw6jZC4vj0A8XSmf1xgNaTeDIZcRfTYG4P5V2mBgsikZDYUJtxJDMqRN0XLf1CFRvrK3rbNCJDv0MCsgyNljrABPg8wGdHwP0twp4tOjEd86TxUT4lh8fvWg6tqmZxdrxHukWMxO8HKyoZfyC/2nIniE+njJ2J4vlhp2zUzS04kMluneAt6+l9eS9y52Jj0zR2LX+35Gw/Os7Je7J9fOyASUL6cC4GVEcHl6hphagw0dZMS1vV9GABuEOVI78581UyynTTIw5Ng==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5389.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(136003)(366004)(376002)(39860400002)(346002)(396003)(451199018)(6666004)(38100700002)(316002)(36756003)(86362001)(82960400001)(83380400001)(186003)(1076003)(6512007)(6506007)(26005)(2616005)(5660300002)(6486002)(478600001)(41300700001)(107886003)(44832011)(8936002)(2906002)(66556008)(8676002)(6916009)(4326008)(66946007)(66476007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?QAX3yrWmbz1QOYK8AW8+205LG5vCawW17aKd/TITggD0XdSp3Bwrvh36/9A/?=
 =?us-ascii?Q?tTEXl9y51RY4QEx0Mc3Tikzjms/uUN78RoHHthRZHMszNlSBu8IyeWn+FW2n?=
 =?us-ascii?Q?Vy8QB0aRjuQOjUCOiVO19WMQVIerq1uvD18u/uErQhqQ+xbCtjcHxhEYkrnT?=
 =?us-ascii?Q?180Drr6p9II9WkTsOX3DXYc//6w7O04B8WFgsHlAiEXpZ4SOmm3rPHMBsHG4?=
 =?us-ascii?Q?4W8caR0ijKVxogit7L+YN2jIU/2p5Ii93I+Kogb8+MyyKSJnupc3qBZhTELk?=
 =?us-ascii?Q?bYSQVw3KQ8dwrcJzBKTu1qiv1kujd4Aa3AJWDTZf0lwI4uedcoh73C67YB1I?=
 =?us-ascii?Q?nrPd4VS7Ht5SG+uyG4BZl1FmT87B8cxzOHCBK2cGuuiJpb8Wgtwmuzjo0Q37?=
 =?us-ascii?Q?MIvvLXRnIyjgBHF4G4KY/P2j0umLaBBlIRDQBCKskZHLHnAYMKfO3Ef36SDR?=
 =?us-ascii?Q?tBg68OnGt6ufxN8MYn+VykMxfpifQllLRCeOuDk4h4XHe3/k2PYAxdoHPn9X?=
 =?us-ascii?Q?GnYm5QkSHtGqNhUMQkIxpPSGgb8jMts4H7TfAOl8c6ZYlkp+51TJ7+YjPFBt?=
 =?us-ascii?Q?Wxb3JdgmRRWO830T9VykM6TH1B+KGS4fjsl36UGjSiqfzhQTptvitj4nodT7?=
 =?us-ascii?Q?E62zKCwSg46I1yGQTbJU7AJPY72VGi8D9RoFIje90RRFHYjK/UmbSX5NBS4P?=
 =?us-ascii?Q?BtED7N17NayxTY9R0hpzSulf72bbDu2DDmXBGN9wv7SFmPjz1qgXODgb98sy?=
 =?us-ascii?Q?pNIiVsIYPkqW43dKp85qDBbkdXSBfdFfyh4qzF0jh4Z1ug4B9D2qeG2s8Ihq?=
 =?us-ascii?Q?/k7EPLIGv1jMeXfT1ZpPGXzezHtD+Jd3nYAsIXp6v+7A8i7FiN4urBNoWN7t?=
 =?us-ascii?Q?daL3hah8G8lkPCG9qfZ7sIZ+8F91lUWI/RTIkfp4xZSI/wXbeGEmz5jqkNGg?=
 =?us-ascii?Q?dBXu7vKsWCZvEKQclG79IKy0Vv9HFb+oj1ycUSq/06557YoomDjNi9Lyz6Rz?=
 =?us-ascii?Q?eY7p/7aGwl0W7NPTcC4xT8cDiUTrgwqlLGfanwR8mKXqz9jz+wn4vitZcs5p?=
 =?us-ascii?Q?KgrwzrumNGa0CC5M06R2MomicB6wKDAtv/2KTIi78WjUdUqAmUS44kVY2RXQ?=
 =?us-ascii?Q?g8dCzMmG5WPtbnbp4fVMHwF0n4wWT1zUANUJj8fiDvH6LR00sRXZdRsF+sfu?=
 =?us-ascii?Q?6C9VUDOQ8zsiK5NTZqscoBjC1xxhl/aIKH3p9UIKTWQrkN3EyG6MipURtb8m?=
 =?us-ascii?Q?aHABtl77YBijqie1d5WnRwrm4buDnpIwymbHZUOffgWdmTo88kG92gIlFqA1?=
 =?us-ascii?Q?b8m2xpIxwFRSh6PmXfMX9O2zDPBm0E5J1myxyJ3sOR+jEFvK/YmwXijk7tDz?=
 =?us-ascii?Q?8v5/O2p01bSheIGpXHTuBMZwj2T1zySeEYCmvwPz4He6cjOd/v27D7/DRq2d?=
 =?us-ascii?Q?knnfYeR4woQ9Lc0PKUeek8CcZMLr6Eh42iUwjLcljx6uYVUFaEi1iVoIMq4e?=
 =?us-ascii?Q?135fKDv+91ilIxSo4BTVUal3y5v/3MsLx3BOcB5sRumdFhC0BvcI1rF+b8j4?=
 =?us-ascii?Q?NdjMbQARglrw5VnnKT75B9CxIktLquwyl2a0K9vWqriM/cmH2aWdb2KqvSjG?=
 =?us-ascii?Q?Cw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 52667351-4cff-4e56-36f2-08db24a3feda
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5389.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2023 15:51:37.8602 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ilCXud6eAuIPsPJaf0qaCJN20UTgyam2aTexS3iA5SJoXugF/WWDcKSPfXRVyEWsgxNFZgO7AGJlEZNyt96jNSVo72l+qRyRjS3BFB083/Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4533
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [RFC PATCH v2 0/3] Split code between common and
 platform specific
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

This patch series explores a code split between common code and
platform specific code. The minimal hardware abstraction layer is
implemented with a structure of function pointers, similarly to what
is done in accel/habanalabs and in drm/amd/amdgpu.

The objective is to ease the addition of new platforms by limiting
the need to modify the common code and centralizing specific code in
separate functions, potentially in their own file.

v2:
  - Remove platform files and leave platform specific code along common
    code to ease the use of helpers
  - Break down global function pointer structure into smaller
    structures defined and initialized locally per area / compilation unit
    in order to limit exposure of inner details
  - Refactor functions in xe_guc_pc.c to provide more examples
  - Add fake new platform to show impact on code

Francois Dugast (3):
  drm/xe: Introduce function pointers in xe_gt.c with local structure
  drm/xe: Introduce function pointers in xe_guc_pc.c with local
    structure
  drm/xe: Add platform specific functions for a new platform

 drivers/gpu/drm/xe/Makefile            |  1 +
 drivers/gpu/drm/xe/xe_device_types.h   |  2 ++
 drivers/gpu/drm/xe/xe_gt.c             | 50 ++++++++++++++++++--------
 drivers/gpu/drm/xe/xe_guc_pc.c         | 48 ++++++++++++++++++++-----
 drivers/gpu/drm/xe/xe_newplatform.c    | 21 +++++++++++
 drivers/gpu/drm/xe/xe_newplatform.h    | 15 ++++++++
 drivers/gpu/drm/xe/xe_platform_types.h |  1 +
 7 files changed, 115 insertions(+), 23 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_newplatform.c
 create mode 100644 drivers/gpu/drm/xe/xe_newplatform.h

-- 
2.25.1

