Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46DBBC2D0CD
	for <intel-xe@archiver.kernel.org>; Wed, 21 May 2025 17:04:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D85118A064;
	Wed, 21 May 2025 16:56:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EFsnek/j";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0765314B76F
 for <intel-xe@lists.freedesktop.org>; Wed, 21 May 2025 16:52:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747846322; x=1779382322;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=9E1wumN+CqoAFVexNqWVRMqHK7pLZ1ZRp/7kH6lWP+Q=;
 b=EFsnek/jQSxcxpsRXzhn1NG/92K0HNJYYzjw8M9N0s7Lta2XtmTSF0X7
 oezZ2eT9wL1Pgv1QnqDMovsDGGTJwM1VBOAxFtZF1O9z9iweHF0hIDnC6
 z2IZeSmsdyWJE8SQwHQGXp9yV0UXRMQcQteNvY9JyCqDzubrZVVBoracD
 WcwaMOilMeo00oJPcxCP7/N1aKh0iBzY3z2Tx09/fWE+35quaoZlSXMyq
 7MTFaYLjAurnhObg4ZpVgR+kd5M7n6x41DU+k1gydGWf/NbV0t38z2nQ2
 NPKiLlxqSbjnga9S0jkUP/y+IjpAVusyVNiRUQbGr3GDlJEmUyKd1SKv2 Q==;
X-CSE-ConnectionGUID: KAQ1YEZIS2SUKaTwTJ3Kog==
X-CSE-MsgGUID: XspdmayaRu+4VZbSUGQb5g==
X-IronPort-AV: E=McAfee;i="6700,10204,11440"; a="49976117"
X-IronPort-AV: E=Sophos;i="6.15,304,1739865600"; d="scan'208";a="49976117"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2025 09:52:01 -0700
X-CSE-ConnectionGUID: /mHgvfeOQJO3RgB0cDCg/Q==
X-CSE-MsgGUID: BslOc526SD2yiooODblr1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,304,1739865600"; d="scan'208";a="145293410"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2025 09:51:58 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 21 May 2025 09:51:54 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 21 May 2025 09:51:54 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.177)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Wed, 21 May 2025 09:51:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vsWV1Gq5Ir/yopyoXgMjlogW7IeMVC7on7AhHDDWTQvGrfkGpwE10umgER3iLj4DyLZQK2qhCN90gRZ7Yk58r4vhHdjEMfbcTmIpCIfcM8kn7AY4+6ClEvAiNZxm6Kv95ozHRKbV240OQj4cC38pxwj3NDglTxP3bT9TdYX5lMrQqV9zBtY5qX0HS1x3NPWhPjhM8qQK12KlbHO6NF3/9LE8cRBjhL9o5bz+4EqaPPCku4/eTqhxqOECf34Ef8WrKx8dJrW7XB7+YyToK4N0kvreOj+jcM4lTB8F77M9WAQOGts5byhFk2pvXA3Bkt5IYRgdo4/Xxn6I14qtCQ88ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K4/yOg5EDUUGcAlUFZPA4c6nItq9+Hw8bGMeWz+9h0s=;
 b=T/5S5UjbxfDoG4D17IqEfAsHy2NuIJkY2v61JM6b4SuH2bIPIvOpynMSbKRwxrQDyvqRPFHrbboRK2IaRkwWpIrl1ygGMfLMHiO/JnNo6E7Psl9KwSRG2WMnW4sJt50NPUYopj/md4BeqWZEXLRBJ1+UmoZpbhpTZTnWKHRzVCKEr0IEYNFQ216qm8B7okrg6sNPmaU2tdg2Wy8DsyTPZSAzIwPXXPzfHAiF4fkrkPYMtw/ioovofC6zHIXJzTtlh2oPdL/R4IG2vMVWhfuJMFQicWW99r0Dm5JgdctLqtUjFdydD4YgJjDwW4hyBOFz3KRJqo24P3TnkTjdQqN3rw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by IA1PR11MB7296.namprd11.prod.outlook.com (2603:10b6:208:427::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.33; Wed, 21 May
 2025 16:51:52 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%6]) with mapi id 15.20.8746.030; Wed, 21 May 2025
 16:51:51 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH 1/2] drm/xe: Make xe_gt_freq part of the Documentation
Date: Wed, 21 May 2025 12:51:47 -0400
Message-ID: <20250521165146.39616-3-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY1P220CA0022.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:5c3::14) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|IA1PR11MB7296:EE_
X-MS-Office365-Filtering-Correlation-Id: 5f4f2b70-75ec-4143-d0f2-08dd9887c8f2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?4XdvijvLaR5ash4NQpc0wzTpdiN4ttgnJCsmX4D721ANBXsHq5t3QSBVvF2r?=
 =?us-ascii?Q?Rp5szDzDVGWo9uMnR9iQkBbw8DgAKaX2lz1yl2Osi0/a/QJwFFcpk0+ySAtJ?=
 =?us-ascii?Q?yI9GI5JKS45PG8y4Fvn00tNkKujkNnmfqZ1doAXve6tTpt3N9x7VkMWuxyN6?=
 =?us-ascii?Q?LQ3J9LveAvyH8ruQ7p5oxXr9cmm0O9jA4JSUYxgdGzb73CR6reBUn9ZBEfAm?=
 =?us-ascii?Q?QTkpAazkCTH5heYLS1WWySXU/Sq1aTWWHKggUeoiMg5RWtk8hbq0VdxYXiSX?=
 =?us-ascii?Q?GaxxyfgJMeoK9J0HkWOo/3GpHhY6kHSKiLFI5+cRx/NkC7V9TN7YF+jsKSbd?=
 =?us-ascii?Q?xr94Ax/9zhXju5zpZoIhLeGj1Iq698QgLuEhuQ2tcmJz7vHb+Pk74WGIq7gk?=
 =?us-ascii?Q?7dbtc9uqd1M4zkb2Sw/60T5Ro2bvcuPBgRY2Pn+KzYPNao84X9gslZhIGdWU?=
 =?us-ascii?Q?CjMrR2spjMjcW8bt1+0Us8VS7hxf8mqy9N8//vshGdi5Oea1cpgdwxRo8lzY?=
 =?us-ascii?Q?EM5XppnKkSmKYtJvt40izlFrEkyijs9PUbOI6rVciiVTtrfw83zsc+MPBbYr?=
 =?us-ascii?Q?ZKUkz0KoeOXQThkcF3nA5WUt/EZOqzMLR56fTtRgAmju2eMYyCAOsFMTrxy6?=
 =?us-ascii?Q?mcKE5vCwGAy3zsXH8zpZhfEXZRqUD9XW/GOVi+AFo3dgZX3jic5KDaNv/fsS?=
 =?us-ascii?Q?S3ikrZzX/bpKlkJPr8tn89ywlvnHakXAHSimK3KVV0X97vQz4ovgP2ubbyF2?=
 =?us-ascii?Q?x2iBZ/D96+WS1O9G0KzWSIdmzYj0vfqy2ysC5y+/zrdl+cC3mLy00GFeVpii?=
 =?us-ascii?Q?Zw2/SmC0UNB0OzbITvUm7BSg6FMwcUQv3qaZpRYx/LeI4RjXCe4Y/F1vXJFE?=
 =?us-ascii?Q?LTXauZ/L8LdN8YCkeD7h8Y7lSXPuS/CuXeCuP+GYIB6PbrXjcsCS+UzSomqD?=
 =?us-ascii?Q?3nedbhd5ptu1AtyjrXfqrkdbi8M5l3NcCFrryCT6eiU50WBhnVs7cSqlJYiR?=
 =?us-ascii?Q?M9p5vDFVr4x4xdW4bo7tXixQ1a4ebq0HY4Lerwkz9GDA4AWcd3SVJBOvvlHb?=
 =?us-ascii?Q?E5lxT7fbPhEieIn4ItDgAZWgOEr0F6y+PHVw6FKfjNDvsLfovwlMJoJ51JHj?=
 =?us-ascii?Q?BfKjpObHZC+W272wkTZQB92P1wZSkXwVJvy5JBDA+sPPKLGi+c6cRTT/iKBq?=
 =?us-ascii?Q?AeRjSqA6x8KlsUEx31uyHGJjJ3fDIHrY+RYnE0boNA/uHPZgqTGpjfji/uHB?=
 =?us-ascii?Q?yxeV+resmfLSJPDl8IhE1jg4WRNMPg5cm2DVvfaN9+BnCLCf2vGNkFWEQfmx?=
 =?us-ascii?Q?l0W/65Cfy6uBrS51xDEM4y+T8QQMwgsz6Z5tshLn9FupAcCVgRQmQxm+/Zhm?=
 =?us-ascii?Q?v9B4jl1HZE/yf0Ik8VWpIrFzKYZaolU9KDZVt1iaHa+BzMoRHz5dGays243L?=
 =?us-ascii?Q?Lst8W0YuPjE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?LdYN7p3rSDy25Y5qkZh3w1hYOv7KHW+EMNE9sHDmkdtU7zVrdcuESAVbcWu8?=
 =?us-ascii?Q?SZSZ01nIHAhttDwToS2stnz9u/XW7Ciw0K0kbYb9fUx2FkyoP4RuObXhQaHW?=
 =?us-ascii?Q?cdxJdreCkk7gaoM4JNb+LPmge33eh6SyJ7ZJbOjae02NTA5qap4/7CZU/7uw?=
 =?us-ascii?Q?PbDZCUUX8k6vMY7QYdnQqBV9Gf6gQ9+6VydtAIj2exjn1lMx9QHHnqQJFFzR?=
 =?us-ascii?Q?/PITNIi8HuuyH+RBLUOpRF9jr5aklkfVwkCeFvVtYyYkOFCzdiggeBsx4o8Y?=
 =?us-ascii?Q?nq6RtVonkVvMJDY+7DQkbJap17kus/Qn93VqtocJGjCg2dNfdaSBdhB0RtLm?=
 =?us-ascii?Q?MpGa1R0QzIEPes/+sx156LMrRND1kemKEy6GUFKoNjIlZUA6/nx6Wvuwv8UU?=
 =?us-ascii?Q?4sQPqtqhUcVeoQGtqpRP2OLGWsV35BDazsbC4GI3QX6+mjgBuiHCLzGZhFmh?=
 =?us-ascii?Q?gcy0N5plaAsQwJXrkiDxFfHGi4XEf7GorWsorV1GNCjgXmYRKIFmVnFD6r74?=
 =?us-ascii?Q?bec1bocRQDOev9OAWgYRmpGnM31pxzVdTuB316Dg2leYFizuyq+MRGK/fdxl?=
 =?us-ascii?Q?+Z5kXD+IVNW3UB8ygxMRsLCh7YonB4VxqF5rYcTuS0EUvw7zE4yFSH5Iyljr?=
 =?us-ascii?Q?Jjnhdsdpuz9nK8OdugKECwOZMlvQ+ki3vWWDVnmwPuBwqgZRfXpATVKWExJI?=
 =?us-ascii?Q?fW+868BoGiW/FxTH7nTqwPwLXAhIiNmUFCjdlfPTg2I/aNrjVupVgynXHGVO?=
 =?us-ascii?Q?AXltUhhsVjh6lla1LvxYQip5/D+Fsa5klzeQvXHWZQqjBYamXwCRirolEH+K?=
 =?us-ascii?Q?J1UNy6KLjOeEkEwgrLnPFasILYcVVYJQ5xzgeVu5RTwDENHTP3V7FlVGJv5E?=
 =?us-ascii?Q?15ir5ei+0opUVHdk49dqUrhVwB6mjZqVFprSM868wWqA4UWbi6tOxcf2GQwo?=
 =?us-ascii?Q?n57CscQF5uiAhSSmSVzYR7fy1GXWs0BmiHPtAAA2NPKMW4NuCTEp25NkPGjz?=
 =?us-ascii?Q?e75bSlFPws7WlWeUkCK9YNYMdMwn3kz9HCW4Y1TgXgAKZOVDXjXv4OkdRhS+?=
 =?us-ascii?Q?cBv2PLdrVBu5Kb2EbI3xuY85+KDwftjrYXaE+pQPhrIO9ab6GjiWTtBAWJ38?=
 =?us-ascii?Q?+OzYUUrElhZw9jdKJXhMYoi4HzbxFMp3KECStseOKdDqsY+dBVd2K93pXddM?=
 =?us-ascii?Q?wZNS45TzuHHlkxsZ1tWLxGvWNdF/7hS5KjiCIxFhh5Q0bLDndbtp9dgj1rUV?=
 =?us-ascii?Q?FEqHau7HzSMD4MV5FtHEZS2RRL5rRspeiVc4EYl3R2WDMkcPO8c+WS3ZeX7Z?=
 =?us-ascii?Q?PpXogCXJSoGye4snnardCxWQpZ0MGRCB7xzrbGplta+YxIP3jBtgsh1avARy?=
 =?us-ascii?Q?5gK4BTWk3bzW6h++baqUm5oGHc78+bPiXz9CQJCLXTStbYcWwj4Q41uLgvkl?=
 =?us-ascii?Q?VTcmw/go+jlNj6q38OY5MWWC8ClCr2wLM3DaqaUbJt3lyGduZQXnvPBMS8z0?=
 =?us-ascii?Q?gseNQyo8nyLQauf2q3iJvkpKk6qeQ4XcUB9GsrbRvJyBm0n3WeiBxi0ss0g3?=
 =?us-ascii?Q?7Vu+EamjOHraI0vF1/6SaemF+jTqTph6CidIVwTs?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f4f2b70-75ec-4143-d0f2-08dd9887c8f2
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2025 16:51:51.8101 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 89aKn37o4woBO/NGnsPd79tSfsAl3D3LZxr438S1Ox18Xyn53J9Zqj9S3vRTKdknL+A+IMMIu5R7ziaTKf/RsQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7296
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

The documentation was created with the creation of the component,
however it has never been actually shown in the actual Documentation.

While doing this, fixes the identation style, to avoid new warnings
while building htmldocs.

Fixes: bef52b5c7a19 ("drm/xe: Create a xe_gt_freq component for raw management and sysfs")
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 Documentation/gpu/xe/index.rst      |  1 +
 Documentation/gpu/xe/xe_gt_freq.rst | 14 ++++++++++++++
 drivers/gpu/drm/xe/xe_gt_freq.c     |  2 ++
 3 files changed, 17 insertions(+)
 create mode 100644 Documentation/gpu/xe/xe_gt_freq.rst

diff --git a/Documentation/gpu/xe/index.rst b/Documentation/gpu/xe/index.rst
index b2369561f24e..42ba6c263cd0 100644
--- a/Documentation/gpu/xe/index.rst
+++ b/Documentation/gpu/xe/index.rst
@@ -16,6 +16,7 @@ DG2, etc is provided to prototype the driver.
    xe_migrate
    xe_cs
    xe_pm
+   xe_gt_freq
    xe_pcode
    xe_gt_mcr
    xe_wa
diff --git a/Documentation/gpu/xe/xe_gt_freq.rst b/Documentation/gpu/xe/xe_gt_freq.rst
new file mode 100644
index 000000000000..c0811200e327
--- /dev/null
+++ b/Documentation/gpu/xe/xe_gt_freq.rst
@@ -0,0 +1,14 @@
+.. SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+
+==========================
+Xe GT Frequency Management
+==========================
+
+.. kernel-doc:: drivers/gpu/drm/xe/xe_gt_freq.c
+   :doc: Xe GT Frequency Management
+
+Internal API
+============
+
+.. kernel-doc:: drivers/gpu/drm/xe/xe_gt_freq.c
+   :internal:
diff --git a/drivers/gpu/drm/xe/xe_gt_freq.c b/drivers/gpu/drm/xe/xe_gt_freq.c
index 868a5d2c1a52..3293d89f1386 100644
--- a/drivers/gpu/drm/xe/xe_gt_freq.c
+++ b/drivers/gpu/drm/xe/xe_gt_freq.c
@@ -32,6 +32,7 @@
  * Xe's Freq provides a sysfs API for frequency management:
  *
  * device/tile#/gt#/freq0/<item>_freq *read-only* files:
+ *
  * - act_freq: The actual resolved frequency decided by PCODE.
  * - cur_freq: The current one requested by GuC PC to the PCODE.
  * - rpn_freq: The Render Performance (RP) N level, which is the minimal one.
@@ -39,6 +40,7 @@
  * - rp0_freq: The Render Performance (RP) 0 level, which is the maximum one.
  *
  * device/tile#/gt#/freq0/<item>_freq *read-write* files:
+ *
  * - min_freq: Min frequency request.
  * - max_freq: Max frequency request.
  *             If max <= min, then freq_min becomes a fixed frequency request.
-- 
2.49.0

