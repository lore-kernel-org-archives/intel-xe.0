Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E651C05027
	for <intel-xe@archiver.kernel.org>; Fri,  3 Feb 2023 20:27:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA3EA10E08A;
	Fri,  3 Feb 2023 20:27:55 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBE8110E08A
 for <intel-xe@lists.freedesktop.org>; Fri,  3 Feb 2023 20:27:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1675456072; x=1706992072;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=JBUhYLqKB447gxgOfirzXOzYzFgE8d8WfEYDrGFg5ko=;
 b=DMlBnNFjxQuGzT6xje9IAp4ctXjfI1pg5BXkKE6cMGJXUoXTcgPADYfC
 vZqEmjYQFnYFQ1WR/sdUwuurJgF8plewosqFEChRbf+PZLmEv+DMGMcEE
 +hFdw+MW/mCjhC7GvYELwSkjhwXlR5SQiDnlMohmzG2Ug+NqO5gyZkvBD
 3uAWVElKnwX6MPh1wLVDkGsgTVZuDMQTTQtzxC3wNKCUSEDUhf0EyQYQF
 5/8MLXzT5+NIaXElOUOyrXFJT+u1JtM2Rg2oupqYF8DrldzXiVAjuGXBI
 5I0Cz3oVloGVB/COnOBbnRQZzSrSDCIWPJ+xLmjvSwaQ7esUCcOp9ckyC w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10610"; a="312503963"
X-IronPort-AV: E=Sophos;i="5.97,271,1669104000"; d="scan'208";a="312503963"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2023 12:27:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10610"; a="643371938"
X-IronPort-AV: E=Sophos;i="5.97,271,1669104000"; d="scan'208";a="643371938"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga006.jf.intel.com with ESMTP; 03 Feb 2023 12:27:51 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Fri, 3 Feb 2023 12:27:50 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Fri, 3 Feb 2023 12:27:50 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Fri, 3 Feb 2023 12:27:50 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.177)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Fri, 3 Feb 2023 12:27:49 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d2dypCfYSpq6bbStkoHj/KLc2AtdF3+XwgNkKQnHTOHymR31rK0piDeyXMifneK+/Zxhy/9dcNG9NQDn37EcnxZFXPQEWlEMEZ6RGEQnuGzoxrH2DpMmuytZbngX+ABPV7QAu2PKITJezYS/imlx/wllA2lpazgNmglo4Iy/zlHW+st4xjkBEuaBVPczYHa+1ki/GYiORszw4F8BvBa5f5d0GLBg6j9huHVwWo4Jaj3VoNAkXYNaYkY1a72sGgFq4pGTQ2YokZhUATkfhK0uwJA0zcN/1EwVSSfsPhcU3KlcPc8aFxeDOdzto//2Dd7XWy5xrsEnNBDm4rg15KcEOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7chaMA9qe5m5SaPlKLzWTT2Uz2EzVsi/SgVyOS1ZIFk=;
 b=KhtK6sSqL+e96z4x7aueccc9zyRTN7hrQDtCanfmOQP8w/QJHHSXi10o6ZjV6i9FDgDepRMoCBRMJQzENZkZ+dxgTddMd62nLiEF6UiAPATLCFzBrxQ9q2gYALaNFk7KjyLAfVvxFzT4xygL1nGOejS5nGd6gXTZRSpDyFwRLkHi114PcEohx/WXSMyMMMUZSO9icf6htiYQLvgDaM8RLnIjloO0mU5t0+37wLJjn5GLFBQEaujdjUVsHMvPZnvp5pkSw5RsnggSzQQaiZEzjAlDoTANOKS3G5LhTBL/xJwA07NWGXBK5IWjHtZimoLO5aKcdPnRV9qm3zmCkXiMGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by MW3PR11MB4586.namprd11.prod.outlook.com (2603:10b6:303:5e::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.31; Fri, 3 Feb
 2023 20:27:48 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::3bd5:710c:ebab:6158]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::3bd5:710c:ebab:6158%7]) with mapi id 15.20.6064.022; Fri, 3 Feb 2023
 20:27:48 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Fri, 3 Feb 2023 15:27:36 -0500
Message-ID: <20230203202742.577659-1-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.39.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0185.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::10) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|MW3PR11MB4586:EE_
X-MS-Office365-Filtering-Correlation-Id: d3e9828d-bcea-46d1-b421-08db06251d45
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: e/stQ9C5kTiHc8hWy+Ks3EwHVVn8rKVEPFZPx61n9fA3JUov9m2Jpz3n3TMUYg7Ae3COMXpqMyEyDINdfGjVbNPKr11v9BY5Eq+oP34DvODz3puDDYzlp9cHvuimeleV6WEc/o5Y9DNBnKLBJTPdT96uXOSrNeF/TaX8iQfJ1iaZqO9EQOpUKDSuTp8f0YoE1/ZJVOtFhCNkFBAH7O8F3eHU2k556ZFwOAhwhuLF4iF4xPl87NqKvktFay4oYx+HFnN3SNrZwCgYniFmBTCuH+SrG57IWh4JFRJ15PGQEtfP7qGjVkOYxEkth3iRNGTGX8LosL8udsW9cI5pV4rPOMJm8D/tA/9B9Ci3H6hPuwGBUn4aRSbvsZtOfYfT9yiKs4PugVWQVXbDbKHyrQAj9LIqtV5pTFnHKTFmwLl/X+y75R9CGW2DZoCsB4Ua6Og0ibcS7Tk6zUb3tvZ/zK7R6kmtmf63c0mA21Qly8mvWOdQqeWTDYZfJorGwxYYNa1NRc7mjppddV923xG6VYUoltxsdynmz53UHYWRjjWLJh5F16Lj+kAM3+6fQzh2lITEIEIivNT+70zKi8V29hyuS0wKL4eGYPXaYASRFX487jMOFt1lXsuQO+sJfL8Fq/DKXXt18gq5UZn9u2s8NtxENw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(396003)(39860400002)(376002)(366004)(346002)(136003)(451199018)(2906002)(44832011)(5660300002)(83380400001)(38100700002)(86362001)(82960400001)(8676002)(4326008)(316002)(8936002)(2616005)(41300700001)(66946007)(6916009)(66556008)(66476007)(36756003)(26005)(6512007)(1076003)(478600001)(6506007)(6666004)(186003)(107886003)(6486002)(66899018);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Ov08CbaVCgM8Zf/RaBxIb92wdkS7Se3MU4/sdXOMGRQztR/j0Z8CHaYhE79X?=
 =?us-ascii?Q?7iNsbE+a/dJlLT2Qwxr41IwevuzVjJxBqxKXhwf3TunRAh5lf4jPhIa5OURp?=
 =?us-ascii?Q?N/NhrZm5pBxhbfPwsoSq7OvicQgcCRVyq7h3cTyFQNwHtc8Q7QaAFbn8vEPQ?=
 =?us-ascii?Q?Hkv/CqO4yDHMom0Sn4pFw+7FTvXuScUA4Qr+D6mSJg3zvXDcyTYpH+2IL0+i?=
 =?us-ascii?Q?Dph0hvGHxddHrzuecUqXUt8yd4D0/Vl3ipo+/53NfKCX92HM+iFtCHNr44do?=
 =?us-ascii?Q?LHLV9p1IVEpVUSMQINnOjGYcyQCYDH+UvBRBVoAx9sEtdnxAPCDAYv+UAFHV?=
 =?us-ascii?Q?8nhyl4eJEx2x6uJN/1mmIjxczhgS/4gugFK4foaTHhp4ee+OyoQKD+7KitKb?=
 =?us-ascii?Q?en5segWHepzJbe4sLOK0Gs7sVOFR6FmO9XIJBlxSk7zdJiJqzs/CDcquSxVJ?=
 =?us-ascii?Q?B9hpX7htmIEDBwKLQn5P0PN8qA0RV2oeqyPxd/Q5CkC4fqRjhywIjKICCVaZ?=
 =?us-ascii?Q?ui+i8Z3Kodf7lZTXKAgqmGKQgYvNKOopwPdgwVHBGVGqcAd9HSqkumNlF58e?=
 =?us-ascii?Q?wYqQKHY8v8hfSyDx6KYn2ozosQAJfM/xivK7yh6HcgESzT+0aKrT9EIUiiM8?=
 =?us-ascii?Q?ZlGDGlKxntktPeF0WmnRzZ2vToHWnmTsRubSIhxr4MtazhgNFq0lyKA+9QIp?=
 =?us-ascii?Q?xJR7GFS2SLz7rrf8s3/omFJIkXFYBom8hYC9AutR+q8QYmhdWSA3PKzP7vhz?=
 =?us-ascii?Q?jlYPx/YMJNYE4Q4Qt+NCvu9Lzp4cAuiZ+t+1FMy5NdR2hCTYVoJCJuQiCYyr?=
 =?us-ascii?Q?sh7pcy95U4yMzuH22VVVgbCSfmUyjI0qLTlkFEHsddZrW3ZIgWEHUecANyD0?=
 =?us-ascii?Q?ek8ooosB9pZyc8W1MXKmLFHKess8B6HDFyvv0YC9g7I8v1StAmxHv5Ai2cXI?=
 =?us-ascii?Q?P8DIDQfPUoiSvuHnQsIVGs9QsAq96AAqWFiYr3F6V4ungWpuBS6TiqMlbrOv?=
 =?us-ascii?Q?q1nlpceTx3aDoVa7TsKTyel+HahAtjCVJaiqBUcRzO+vajV2kKP2DjsySLI1?=
 =?us-ascii?Q?8dG7xS3Iddn/ZFRytuhwMel71g9gkk7QCttTrhlZSDWuz3CdvzcqSl7OdUof?=
 =?us-ascii?Q?yb8SyV9UmREQpdkPE9U08/yt+/IhdU/xQL0Cmik5TsZvG2yw9mMdBtUXTmCB?=
 =?us-ascii?Q?g7Np2T/uAUsbekPsUaqqrKmYHi7pCCIHb9lqOg0tzQPU/I6ABRGh+IEfL5ma?=
 =?us-ascii?Q?J7hEeEJxqXgxmrKwE7IhVPHYbsJgultnk+dlNg6f32xFK+F/ek9q5GD0TAS5?=
 =?us-ascii?Q?eIiMWJQY1t5zeRMzrSh0QdJW7enJwlFzAN4UF3JVQUNWzCN1iqfyzDjIfL2n?=
 =?us-ascii?Q?JqVpZtdgMmt5LWUY/FMsZcyWm3AcF/E6cVkoxf0MRYJaQesLFUpa5zPE29DS?=
 =?us-ascii?Q?WZW3XaeZUdx8ZlDcXlaqcFNBlyrbs5e2pJ20OgQy3SHdzghaj3ZBiFCynVg1?=
 =?us-ascii?Q?YoXuOxNTIod4d0gcbMQZejNxpB+yFQjV16vRIL5LNLw8RJrH0iXLjgbwRbMn?=
 =?us-ascii?Q?A71nszE5aIfrZG5hBvtxFppqM/y43nojkmbbSFr5EMhgLV/Pd913HExEW3+H?=
 =?us-ascii?Q?sQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d3e9828d-bcea-46d1-b421-08db06251d45
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2023 20:27:48.0077 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VynCICLgIxjgvjHvO3EL50ZqIYvrGSQpXaKlllO8Q5ijslZCR543gtSfoLHKuxY1ThTaSCmLvkZmYbIwUNg0rA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4586
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [PATCH 0/6] Disabling display with modparam.
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
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

These patches here are already reviewed and ready for
getting merged. But I will hold on the pending ones
so we don't have to deal with rebase conflicts.

Mauro Carvalho Chehab (6):
  drm/xe: allow disabling display at modprobe time
  drm/xe: place all modprobe parameters at the same place
  drm/xe: move XE_DISPLAY to the Kconfig
  drm/xe: move xe device display logic to a separate file
  drm/xe: move xe IRQ-related display logic to xe_display.c
  drm/xe: move xe PM-related display logic to xe_display.c

 drivers/gpu/drm/xe/Kconfig           |   8 +
 drivers/gpu/drm/xe/Kconfig.debug     |   7 -
 drivers/gpu/drm/xe/Makefile          |   1 +
 drivers/gpu/drm/xe/xe_device.c       | 184 ++-------------
 drivers/gpu/drm/xe/xe_device_types.h |   2 +
 drivers/gpu/drm/xe/xe_display.c      | 323 +++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_display.h      |  85 +++++++
 drivers/gpu/drm/xe/xe_guc_log.c      |   5 +-
 drivers/gpu/drm/xe/xe_irq.c          |  36 +--
 drivers/gpu/drm/xe/xe_mmio.c         |   5 +-
 drivers/gpu/drm/xe/xe_module.c       |  22 ++
 drivers/gpu/drm/xe/xe_module.h       |  13 ++
 drivers/gpu/drm/xe/xe_pci.c          |  13 +-
 drivers/gpu/drm/xe/xe_pm.c           | 109 +--------
 14 files changed, 490 insertions(+), 323 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_display.c
 create mode 100644 drivers/gpu/drm/xe/xe_display.h
 create mode 100644 drivers/gpu/drm/xe/xe_module.h

-- 
2.39.1

