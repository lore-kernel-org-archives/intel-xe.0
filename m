Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34664E7D0AB
	for <intel-xe@archiver.kernel.org>; Thu, 21 Sep 2023 21:08:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB9EE10E619;
	Thu, 21 Sep 2023 21:08:19 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCEFD10E619
 for <intel-xe@lists.freedesktop.org>; Thu, 21 Sep 2023 21:08:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695330498; x=1726866498;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=wEa/skq1oWpdSeOPUc+KyRaAgh0HYimuWiXIEdZVnjo=;
 b=cl0AafeoEpVM2mWvlzaVYLLoRSMZUeJkbkU9ai07rzbpXQyc+bMY9n/Q
 HQNo4Uxir7btlWnpK5rcAABYWfnwYKccCexP92tvwoR+gX72nkGr1vIW6
 oeD6FhkWGxYtyxCENrR9+wSQZ3bBiyUvPGAbVmVp8vFibeFqAlN7NxXpN
 Gk/ZFa6uN0GMpNhRiA2faLKDfQGy3P/x81xuZw74lTf2rNYXY5JrzW005
 LixzavKfr/tRLH6M3LVdrswoUyRDXmFR8381K/Ry8QSGagfDw678mZEo2
 xEFBVTktdzUwpFe6bvzYrWz2nS4HtpiRsQxC+4rwA6wcyHemELda4POlF A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10840"; a="370985639"
X-IronPort-AV: E=Sophos;i="6.03,166,1694761200"; d="scan'208";a="370985639"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2023 14:08:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10840"; a="817538622"
X-IronPort-AV: E=Sophos;i="6.03,166,1694761200"; d="scan'208";a="817538622"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 Sep 2023 14:08:14 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Thu, 21 Sep 2023 14:08:14 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Thu, 21 Sep 2023 14:08:14 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Thu, 21 Sep 2023 14:08:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hjnQFinffXXPY8muINH5YavxNgn/5/oI6jwpgMACEr6+f8zjpuJ+i675B70Q40Jzbre7d+O1VSm1Fxt9wMVg7FAHM4Qrrb5cwJ3+Ieg2G6+Q+jGzzQa1gdwg8N5QkYZ4uWSuAbKfXROa42UI1VDIi17dl6L6mJoEX3noKDdyid8jlfQ3kMZJ8jlbVI/ytYemnzS1RarklEqMXMbRYxDjFuDiQnCJ4o0xfCpS037WpozxO6NalTDEQ0gjmG9aNX3nDo/yGgRkSxqdSwBr+13eEfseGESWojlmUDxW4MSayglh9/mIKiLfp1rlXwqc3E0rsKVLJaxJ/rQxrSDhAer+hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I0b8OvfaRHoMuH+pohhyVjcAT3ErYGmN+AkQN5rTW+Y=;
 b=fKOx9c1jji5Jvy8IIl43ORtBy9yHl26v/CyHJUNXh+pRBLykDqMXJmM9YhCuLzUtOjq3qnav7uqGr0U6TGrFdHX32QfM/NnjJHHlHZBavSWyxu9rHei79Olr2+ATey3lGle5Rcp3mYN5p7BWxKOfx+WAI+tmOMVHCdpcAo4TKA6u1HECOvQtN5msyAqv4HNrB8Y9HLQzVZp/ikqSdon5MW3uTczeBQSeyBrmYIJY3tEFaGYkQDPjBn0xnRJbsZz7GCslzBtZQI0xv0tJ+ss8O/jb+w8eu8ylqHSS5XKlBh+XU85goNPaMhZnUrRtexfRrOq1Oi+xxAQwCVfX8nn4MQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by PH7PR11MB8060.namprd11.prod.outlook.com (2603:10b6:510:24f::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.28; Thu, 21 Sep
 2023 21:08:12 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593%6]) with mapi id 15.20.6792.022; Thu, 21 Sep 2023
 21:08:12 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Thu, 21 Sep 2023 17:07:58 -0400
Message-ID: <20230921210800.170275-1-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.41.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0180.namprd03.prod.outlook.com
 (2603:10b6:a03:338::35) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|PH7PR11MB8060:EE_
X-MS-Office365-Filtering-Correlation-Id: 9fe5c907-8a74-43ac-daec-08dbbae6dd0f
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lYbx4ukECgHKO6Fp9eN3CrQ3nvf1RD1LPBtXcrrv5gbhUZ1FP7LD67QnaWIs2MyOdkBWwf+2AcYMkUJcrq8lU+fOVkQgRwvX9uQFrDB3OHSviVko/tOH4sgtzM6HumGZ82AbtSSZ2hLPJFpFT2OI3vtxpQGksrIlpdthJj426R7iH+KUGWZWJoGNW1IB2ZgUYCC/qmxbUeiYHgfheP09pV8uZJHu0xQPdm6NTL0iN1LRN4SfwoyEb1FG0q3PYvuVzcjqPkdX8DFNZfcodqjQZuPQlFEpwkmR2/vaZC82eexaDSiswqJrf+wIOirNY7nJZHWrFtrcRYilHlyZ/raPRuUemX527yMAlFMfOsxv0e9TnnI5gp5Hh3Eu8ZTzw12ztdKEXjg+iPqUvLqkNJMQpccu+61mDNF6DgrAhCFvua5nNq0vrUkjrdNZ6Kz30eIXIPeN3e3vP93J4lzATdpqPp4SoHlL97Z1fVFHroO0Ui2IqjIEZ8/hdi+go7tAjjMSnGrpwd8n4jyR6xpSfudmi8IiHHjTCskvMkSKTBnx5CJvtMVd5lVPwoEAWsA+iuFy
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(136003)(39860400002)(346002)(366004)(396003)(1800799009)(186009)(451199024)(478600001)(2616005)(1076003)(83380400001)(36756003)(107886003)(82960400001)(38100700002)(26005)(86362001)(6486002)(6666004)(6512007)(6506007)(316002)(41300700001)(4326008)(6916009)(5660300002)(66556008)(54906003)(66476007)(8676002)(66946007)(2906002)(4744005)(8936002)(44832011);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?a5mXsDsVxk6Y4xnJbczKXgxiMHZwNyMKdBzYC14sFNpwfXZbZ2txS0PHYfDh?=
 =?us-ascii?Q?Kx2qq68OOWis9jdO6kAG2Wh+UPVltYx0XQlNfvZKB9JHDPk6zpFIp6RZHJBo?=
 =?us-ascii?Q?NWfw+m635as/IwMucB3mxLPa4YsWglqV0sHDBVixvwSY1gLGC/8VmkMS9b17?=
 =?us-ascii?Q?Wvv0myzrzEa20PPi2YAyV06HHnUQsgtFj3qAgr65DfsXp0h5ZoeM/rhShp4t?=
 =?us-ascii?Q?e1HFVhmw58slCbv1XmiIB179gUQE/96gWY1EzYok7hr+GoWBHcSjf5NDd4vP?=
 =?us-ascii?Q?MUky3ejSmC3hMyv5ToNbtmQwXQug396hhTJ9y+ySX7Ll5LclOtUZBSfBez9B?=
 =?us-ascii?Q?LhTFNsG2Glc6h954TV7X+h7bORTdqIZMdeI6YzK3gmVp0oG8xCpEp7i32XaT?=
 =?us-ascii?Q?wj0p5R7S4Ktig6xhLbxpM5wHRl9N1lnoJT2XR8RhvZgd27pfqjywGJpAI/vt?=
 =?us-ascii?Q?L9dhcwt7GmHDRfGVoDNnH925hS7aG63az7+jeNrXtxMAZ56jBPNy5nbYgMKo?=
 =?us-ascii?Q?1ChJIzBK97gW08QDkk09ao5xjEh0Y6PGYkvL/dfmo1WEzo2zqU+i2enl0Eho?=
 =?us-ascii?Q?ZzsB18g+9CuTnmwf0h4et4OHSTmejPOwe9dqdvEi0VSVxBHjQg09/VaG0sch?=
 =?us-ascii?Q?hau+dXEIBRtI0VUHcq0vo7b8UisO4SRQq0v7WIRKu+o+PM/PJvZPnspcG8n1?=
 =?us-ascii?Q?+kVvfZf+WfWCJYidZMADcctJKlCfXnDsBnLtnD5hv63CWHfLDethR3iuSC3w?=
 =?us-ascii?Q?c/69q+2EWt7ii9LE0Uy1rXZu8d/fMftu1cUjq7c7MCNtUd/Bee+J5gxymYDM?=
 =?us-ascii?Q?OCOWLo1d4QO+sX9Me8/dWOt+uDzuOxQvJi4wrDpCuA/HRUtwuv/tmE1E24v7?=
 =?us-ascii?Q?GywilC7RjIGLj7/n3okzKHnbyu5dWMx7Kwo4iXDC1hrjN6AU8a4Rl+cef61n?=
 =?us-ascii?Q?By2wH/eG8Vsn0CyLGdznosBMhzoyl3UNMpx342ybDy95ryQskSZ8RBqX2SlO?=
 =?us-ascii?Q?DL8/xeHBe6tG44rkxiTnv71aF7jlInQIeJTjGwrgJ52Aeb3TrkPORnVbGmKj?=
 =?us-ascii?Q?ewHnCsm/kv8JuYJo/FIj/olKCkhOfPVz1LkDbSNJUjVvFE+jH19/t8nnstmb?=
 =?us-ascii?Q?opLuEMuGwqPDXTizS2oFZbZIMKZGAefeZ9FQYb5IBq4FH2W3nGUtakzIV04y?=
 =?us-ascii?Q?dNrwvl4CnCXn2zQNGgHsi2BhH03urexEOzdjxWDqQR54es9v5shBfZEGvTpp?=
 =?us-ascii?Q?lWf8QLgSzRL6G9EfaW/6RReyV23ja+s8X3fS8wgabvqhvDYFTmTjwai+qk3Z?=
 =?us-ascii?Q?i3szIDJ9Imr5whcmdiVdcqaG9+t/zE0To5m4zxMVVq6KJ7C9uAKzjXFVNz6W?=
 =?us-ascii?Q?x09iz0tWrDPzHyCGmgqexrvLwx9DsSr/bnrrB7RnFf8TSpXGKWCMd8dwXGcJ?=
 =?us-ascii?Q?XodLgij/wKmtIZcxhHIhbPhkw0ag9QEvX9RrMJ1ew7MATSgJf9DenOWfQ7zr?=
 =?us-ascii?Q?iVN0anOC0IAENn/DUTeKmfvfUY64zXtKpB+kLwOpnLEzhPLrhqazh2zpfJnJ?=
 =?us-ascii?Q?vT49Aj6DqqJLWCywI87n71Tg/bZe/Kq7tfWMIkCOt0SGUzPMvMWCXdvjWoV2?=
 =?us-ascii?Q?+Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9fe5c907-8a74-43ac-daec-08dbbae6dd0f
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2023 21:08:12.4012 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 76rh5jmCSdngplQj5FRCCYppBJr6xOYi7l/vapbjiGWVmmyoG+5YWgVfwTVmFQYsAVoQZvTvlOsj6kRq+uSQQA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8060
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [CI 1/3] drm/xe: proper setting of irq enabled flag
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
Cc: Ohad Sharabi <osharabi@habana.ai>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

From: Dani Liberman <dliberman@habana.ai>

IRQ enabled flag should be set only after request irq succeeds.

Reviewed-by: Ohad Sharabi <osharabi@habana.ai>
Signed-off-by: Dani Liberman <dliberman@habana.ai>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_irq.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
index ccb934f8fa34..f98aa1f06c8f 100644
--- a/drivers/gpu/drm/xe/xe_irq.c
+++ b/drivers/gpu/drm/xe/xe_irq.c
@@ -590,16 +590,14 @@ int xe_irq_install(struct xe_device *xe)
 		return -EINVAL;
 	}
 
-	xe->irq.enabled = true;
-
 	xe_irq_reset(xe);
 
 	err = request_irq(irq, irq_handler,
 			  IRQF_SHARED, DRIVER_NAME, xe);
-	if (err < 0) {
-		xe->irq.enabled = false;
+	if (err < 0)
 		return err;
-	}
+
+	xe->irq.enabled = true;
 
 	xe_irq_postinstall(xe);
 
-- 
2.41.0

