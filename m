Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 453BDC44515
	for <intel-xe@archiver.kernel.org>; Mon, 20 Jul 2026 17:33:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E375910E9FC;
	Mon, 20 Jul 2026 17:33:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EPyYGp+i";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E431310E9FC
 for <intel-xe@lists.freedesktop.org>; Mon, 20 Jul 2026 17:33:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784568836; x=1816104836;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=34pDMcfRYDIVE98xYm9ylk12X7qKOKhUfxaj7cBbG/o=;
 b=EPyYGp+iZCH8fazN04zxLw3CWfTWmYgpCUe1UIQy/Qa9VG2/IERhkOHo
 +Lh5RToXC9AbfcGVUT/nnOjy8GJrjyRY8gM8zoiu04BKAClSB9Yvm5unM
 e5fg6N1HLeBkJYMDOZeHbimSyIBTluPUzlMo4z5j0h+YZrNC7wmvOePwN
 Er6AS5ra7OK+XYF0Y65ug7A4aiMT5MPGR3rtn/sqkPEKakrRIqHe9+JhX
 s9EVmIFZYYuYEMSzC1w4I8I3Bqt9FWEjaueRC4/y/lfIVvtV33N1ljwlH
 C8kbkr+/1AKhs74Ggn3uLd7SWrqJ+lJtYrI3geTbsrWzcRi8VxbE2ZWj0 A==;
X-CSE-ConnectionGUID: mM9Wm0pdSQyRyRyiTPE9Rg==
X-CSE-MsgGUID: kAIOLJFDRWqQCJLfXOwQNQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11852"; a="85276094"
X-IronPort-AV: E=Sophos;i="6.25,175,1779174000"; d="scan'208";a="85276094"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2026 10:33:55 -0700
X-CSE-ConnectionGUID: Y6z63BX8QI64SuxM6oRtNA==
X-CSE-MsgGUID: cdfSWLGmRXKPNPwfw+5TNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,175,1779174000"; d="scan'208";a="254890051"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2026 10:33:55 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Mon, 20 Jul 2026 10:33:54 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Mon, 20 Jul 2026 10:33:54 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.52) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Mon, 20 Jul 2026 10:33:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H2/dTDqI0KlOlEoA622ByoM7ORZVA1/8GRE4U3ce8GBhsajRNs5gRW130KDHLVxoF4ou0yPNeg1PJsswrxh6PEsjNHkUkf/4BSs4qnlf4IN9eTwXU1n7fkQycuGW+RcVwxmGR3+WiKE244cNr4ISPL7aZt9vEy5QpXOQfm5NvTpnyvPCq1dAhmGvGTlX+Ifhde4QUXP+Q9IjYS0NmwA6Y0eRN5kywFbeC2Y1SkbiTuPvACjmwXY4ciuyNHBnn/qkIiPlu50A0B49wkC3PTrwi58ZedjSem0jeshVgnYhRVgQ3uE8HY0iR3pR9LAUkOtVBmNrTxfsKVRL1CdEQJdylA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aKZT+7GN6uNsOeoOnwiTW8fbpA0P7RQXMwd2ugam8Qc=;
 b=fCeAAoE1CS2tpwacxmIBBn6zS1RtFIHLwX4bUltrkEmebxJihhz2DQAhDP/P6uEF3IF0AUExmxdltCGkwOF9SNeghu8PrMx0XVuGHUb7sLA292ZHfzEpX/w0SlIC+CPevGqbHWwCEqDA1Ebxg6TCiyBeyp6plcToelYAzgbeVVvIUkCNpWiOBJDBs5dpisuBXKpRy7oW31bnLuZ2BtTDs3DDpEQJ+Eq0OSNTytlwDAjTdnHyexcHx234clegaTtiTv2Eo1Gnz9jCflMazhgC7gHOk46LAomT+ljJblDPLBRa59rzNrm+sdL06pqAiQZ5b1pLtWRjwcQFR120Jgsx2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8039.namprd11.prod.outlook.com (2603:10b6:510:25f::18)
 by PH8PR11MB8286.namprd11.prod.outlook.com (2603:10b6:510:1c6::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.18; Mon, 20 Jul
 2026 17:33:52 +0000
Received: from PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92]) by PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92%2]) with mapi id 15.21.0223.017; Mon, 20 Jul 2026
 17:33:52 +0000
From: =?UTF-8?q?Pi=C3=B3rkowski=2C=20Piotr?= <piotr.piorkowski@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
Subject: [PATCH v1 0/4] Split GuC ID space into usable and shareable pools
Date: Mon, 20 Jul 2026 19:32:40 +0200
Message-ID: <20260720173244.3935848-1-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: TL0P290CA0007.ISRP290.PROD.OUTLOOK.COM
 (2603:1096:950:5::11) To PH8PR11MB8039.namprd11.prod.outlook.com
 (2603:10b6:510:25f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8039:EE_|PH8PR11MB8286:EE_
X-MS-Office365-Filtering-Correlation-Id: 98a2409a-d580-4af8-dd27-08dee68510a9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|23010399003|376014|18002099003|10067099003|56012099006|11063799006|6133799003;
X-Microsoft-Antispam-Message-Info: fbKglta6Rg4n1XhwCfAjBLKVfUyR0nbHFtFYBF02qC9cwPrFVcq/4rh9A+J9cogA8BoDj1rbOXwS0hm2zb61curf+rTgiEM0DpcfvZuvLE6yj4Y5S28wjClgDoWaYAXhPNoK8sfhi+XT8csDEq18nbJMV79CjgBLj8ixOqj+Vpgw6+1QHBwMGPMjusr59/QZKyUrRduvaBUxFIUSJQpiyaPPSxc8r6bNha1987QcbYn3+hYZn1g0H8t7P8gDMQ6KbtWzMI8Y3MC0P3/yVA87WMkE5hJ/eBgQmq4vyn8I7h0iBlslA2m1zH4lPMWig4A/bXXkvCw8AsZBTyBDabDlf1jleKT2loVJ0AMBAYRmVpMYjT87P2EcAey/VS+PbCXnJzFtqz2TDHoLSORvUSzJYAfulBuHz7vJCwkkGEDBjMjlBge/hAcPOaPYfQOftbZlDXxpRl7VVIgq5yRII9fa9ONdzwQ6rtanG1Dfwey1MU3bd3uA9uwsZmHK8NOYmBOJlNWLsI51Ortm+xwkoEG/F7DzFWiki6o6MGBkbvdBdwNk2S+h9k88WHAHu7UN5SAZU35GSWJ+GMtb5rxnqOIo2ZpL1N3x8jWbyyDpSX9u+p7iqTq6uO1SmD+w2UAvU78C0DqrNjwPoy6mgqXbN2diu/fkWkyQ26icdPfMzn3MX6I=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8039.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(18002099003)(10067099003)(56012099006)(11063799006)(6133799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MStaaVRmUDVWNjRmc2orSitiQWt2VFhUVlllY2M2bUt4YjkwQitrTGxPUmFx?=
 =?utf-8?B?U2VtRGhMcDd3Y1pxOVpjV2F0UmpmK0FiOXRwbEswcTkrdG5ZS3c4V3dLVkwy?=
 =?utf-8?B?c2lHbTJROE1SSUFXalZpbHNjWjlCR1NzN0RFMFAvTWdCcS9pY290RDJHOXJI?=
 =?utf-8?B?N005VEpTM1c2NlZWalowbHZiZ1M0NVNSZEJTWlh2U2Q1d0wvWFgrdURWaklI?=
 =?utf-8?B?QWhtdzJRNHI2WTZ3dHJnODBqSTBEWFBnNFRTZmVaL29MdldkUEhYM1FOeVFp?=
 =?utf-8?B?YnJCbDY2Z1VNSmQ5NjhpczArYjQ3czFLc2dJYUFnUmo0akgzNXZpRHJnN0NC?=
 =?utf-8?B?SytJVTVUS0Yvc0d6WHc1cWN0bWxiUGNucjgxWlA4YUZGR2R6cHdOY09pRTV2?=
 =?utf-8?B?MmJWRzg3YUlrenZibWZBVytDMkJYb21tSys3eHMxYkpQcTRxdHlEVFVmOE1v?=
 =?utf-8?B?ZXhpSXRVdkJ5L0R4NERjTDVOa3RsZ0xGaWxpK0tLc3V6dHlTeXNnTjk3Z1ZJ?=
 =?utf-8?B?cEtLOG4xZTZJdS9MYWRwQUIyR2dhL1pySHhMYXdQbitpcllEVlNIaDMva0tV?=
 =?utf-8?B?MHpzaXVnTFlDU3BMc2hSQWFQQ1RmUWFkQUg1RHlVeGd0VXJqZ0NoTC8yam00?=
 =?utf-8?B?bXhMTkYyZnBVbEU5KzY1L2FFTER6dE9CYnZWZGNkOUxCSldqdXZzWldGUlRu?=
 =?utf-8?B?VHRpcjd6RkFzTjNrUDN3T3dvbGNvNnEwWDBiODQxaWdjN1FIbU5KM2xzQ2xD?=
 =?utf-8?B?dkVCdTdRR01HcngyQ0xHQlRmMzdpM0hVUTdWSXBpOU9hRGc0Q1EraXRzY0No?=
 =?utf-8?B?eWkrS0JVSEhMQW5hdWJxZU5mRjczK3FlUS91NFJDcVN2djZtcCtvaFBFcFd1?=
 =?utf-8?B?b0dna2FyMGRnVm1qbWdkVGg5Y1cyQkVUM1R1MFlaUkcwdVNyUUwzMEVZaTkz?=
 =?utf-8?B?Ry9ra3BpSU1WdHBEb09zMEF5ZjljTTd3TjZWbmp3bSt5cXJQUS9MUkZpR3JO?=
 =?utf-8?B?QjluQzIxWUUyOU40T3h1Ykt6TnJxMXR5Z1dLZEFBdzEwdkhwM1o4OGRMb0My?=
 =?utf-8?B?MW90dStkdmtnQnB3c3NLZU5nS0lCSzRSQ2s1UE01NW9XOU5peXFVaWFsaFk4?=
 =?utf-8?B?dHl2MHE1NWFneXNNemJqZERCSjAxTkJZcnBkeUdDejMzcGdmMkxkbjhWYkp5?=
 =?utf-8?B?eU1zUTcrc3BSdklpSDlQVmxsMlVwME5tdy9YR2hFNU1wMllFdjlkdkNGd3E4?=
 =?utf-8?B?UERZY2g0VUh3akZlNEY3czZMS3ppa1JyZldsUDlLb0NOMWRUdzQ4VmpZd0dF?=
 =?utf-8?B?YzhVN0w1NE1BNFZka1UyRXlKRm45bWp4aXBySkhnWjdMejVuK21HU2VpUUY3?=
 =?utf-8?B?cTB5VERGNzZHY0tVYkk3YWt6QU8vWnZ2bWtMTEQvRTFQR1J0S2ljQ085S3Zk?=
 =?utf-8?B?RE1KZ0ZNVlR3MFRvc2FQMTh2VWk2dFhHdlFscnM4TlQ5U2MxTDRpeEExNVR3?=
 =?utf-8?B?aUhxWDVhalFGWG5uU3lOYjJqU0w0bjRBSWk3VHYrZVI5NFd5aXd0bDh4c2Jz?=
 =?utf-8?B?SHlnZkVEMWZ4RDFPNnF2Umc0b0ttTHVXK3VSc0NmZUVTN1Zkam9taGxQRUxK?=
 =?utf-8?B?bk5HZTVScWsvVW9RZlA5UXphYnhsVVFHK2lxRnVxMndTVFJ2WmJySnBMeGhN?=
 =?utf-8?B?d1UvM3NIMmRNQ3RCaFQ0RG5XZWVvVUt0OFJtMkJxNEJ2OHgyQjZ6L0g0SVNo?=
 =?utf-8?B?b2J3UTVKYTRyY3V1WVdDZnVaci9QeUJRL2dHdXZ6emp0QjYzcFdrSllBQzYw?=
 =?utf-8?B?SjMwMW5ETStsSitvNHlRU3pWc2s4OFdhU01DTTNDN2U4bkZUVnZOMFZGSFBs?=
 =?utf-8?B?RlRrV2piN292dDlkdmJraGdXYnNCSjBFM3BFUGRUUUJzOU5wSkozKzR0eVl4?=
 =?utf-8?B?cmU0ejI4RDhwa2xsL3ZFSFRmTEZNSFEvWXdvNkc2ai9maFp6RVpzUHR3WHRq?=
 =?utf-8?B?cWZwbm11MEluMGdnWEg0TnNIR2lnS09iMlJHdVpyVk9yd0MyMVY2Q1BMOWRN?=
 =?utf-8?B?SFBPWXFVR1JBQmJjT1RlWCs2V1k5RXZkclh6T3MyYkpMVTY1M0VBeG41anJU?=
 =?utf-8?B?SG1nS2NPT3R6dGNDRlpxbW5TWFNCcXBVdGkvTlFUb1loTVdiNHJKSElDSjNw?=
 =?utf-8?B?ZmNHUmd2R2l2YkZhd2JodlFETzh2N3VLNy9pZVBDUmhJNGdBbkVlbG5TVFlr?=
 =?utf-8?B?YnB4Tktya3U3NVo0U2RDZmFFRkxWMDY0LzdNNWdIQVR5bjRYdjBRb1ZqT1ho?=
 =?utf-8?B?MUJoNGNKc0tRV2RSQmxRa1F1bUphUyt6ZGk1NmVxRy9jUVRxUU9zSHM4K3ls?=
 =?utf-8?Q?h3tjM5WFhhMs0FP0=3D?=
X-Exchange-RoutingPolicyChecked: sjhXQe2LSNB+Zkg18DNwawGZIicL31wYO/ylKolgVeY8ijq2p+cWc0OxGE1ykpixW+eiw3ZGktacLw1I2YHgKaw9F6eYlG6JOz044gBSpbHYOPog1k7bmB3U3xLYCX/khdeMJ0b5ZiSOZUzL1GDgljiZEGbfjeLj0GEUzQZVRSn0TLMDbFphk5reylaNYHrgs1vy9KvnOR/q2cmvgeeoSRC+Ux5Avmsao/KJIG7BudBc6AEI2vsRRR+a/me/UOPfXmPLmwHs2IwPV/+hXJvlkwGp+ZvKX256dw3VT/zuIj2oH/ZjHGtKdiK5KbjyU+pRQY9ce0xdif2WVSei5XK85g==
X-MS-Exchange-CrossTenant-Network-Message-Id: 98a2409a-d580-4af8-dd27-08dee68510a9
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8039.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2026 17:33:52.0311 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hh3rn1fbwCPjUrYFyguFCadnS3LH4Zb1SurplRNoaI4CjOH3diCBwFGNKPAh49qzznqXSTZy8VuoWWhN2KTG3xN86QOzshsOBmKAmxcLeIE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB8286
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

The GuC ID manager currently treats all GuC IDs as a single pool shared
between GuC submission and SR-IOV related allocations.

This series introduces explicit separation between IDs that can be used
for GuC submission and IDs that can be shared with VFs. The ID manager
gains support for independent usable and shareable pools, dedicated
allocation interfaces, pool-specific accounting and validation, and
extended test coverage.

To preserve existing behaviour, both pools continue to map onto the same
GuC ID space where appropriate. GuC submission is updated to explicitly
allocate IDs from the usable pool, while ID manager initialization is
adapted to expose the correct ID ranges for native, PF and VF operating
modes.

Piotr Piórkowski (4):
  drm/xe/guc: Split GuC ID manager into usable and shareable pools
  drm/xe/kunit: Extend GuC ID manager split-pool coverage
  drm/xe/guc: Start use explicitly usable GuC IDs for for submission
  drm/xe/pf: Explicitly use shareable GuC IDs for VFs provisioning

 .../xe/tests/xe_gt_sriov_pf_config_kunit.c    |   5 +
 drivers/gpu/drm/xe/tests/xe_guc_id_mgr_test.c | 555 +++++++++++++++++-
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c    |  16 +-
 drivers/gpu/drm/xe/xe_guc.c                   |   4 +-
 drivers/gpu/drm/xe/xe_guc_id_mgr.c            | 448 +++++++++++---
 drivers/gpu/drm/xe/xe_guc_id_mgr.h            |  31 +-
 drivers/gpu/drm/xe/xe_guc_submit.c            |  27 +-
 drivers/gpu/drm/xe/xe_guc_submit.h            |   2 +-
 drivers/gpu/drm/xe/xe_guc_types.h             |   8 +-
 9 files changed, 952 insertions(+), 144 deletions(-)

-- 
2.34.1

