Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B809EC04FEE
	for <intel-xe@archiver.kernel.org>; Wed, 20 Sep 2023 19:31:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6160310E53F;
	Wed, 20 Sep 2023 19:31:19 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C3D210E53F
 for <intel-xe@lists.freedesktop.org>; Wed, 20 Sep 2023 19:31:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695238278; x=1726774278;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=H4bm0IqpjR2LVRsODrXHTOOyS+B+HlJjUPthO1WKIj8=;
 b=kYcEHy7Gth7cbaaH+xxf8rGJdim680lsWgrkJFZo2tEc5/XKgxEVhX3I
 5GWIOu/uauxUXPpbrRTmgNIOMfAqdryx7aZ1a9GZtA2VrrVZmvSqhkHa7
 e+d1lMLLuJgbofntMroftO5MqiVKr+DCzB2UU6bzws7J6/DrS/VD0inBQ
 lrwbPsc65P+N5whtmybU8QFUAmaWnDCqMFLLU+MwdWSTBLGwwgw8lgSv2
 WIqwRuIqzqq90PtqsUcspKPXjoEJ/I/h9x4rij7UHD29dXSojMkFfNamK
 Sv90ltdaMqptdWA+M+PtjzDt/oOvYSUvq9uFnppCkrOqP+5VPWYONDTbW g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="377619091"
X-IronPort-AV: E=Sophos;i="6.03,162,1694761200"; d="scan'208";a="377619091"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2023 12:31:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="812287900"
X-IronPort-AV: E=Sophos;i="6.03,162,1694761200"; d="scan'208";a="812287900"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Sep 2023 12:31:17 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 20 Sep 2023 12:31:17 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Wed, 20 Sep 2023 12:31:17 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.47) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Wed, 20 Sep 2023 12:31:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PiIpVrs//y8NIWeZaGra6XOS0qmPX+2NgQe4Jdf5SOA3zriMuvHWPv3xz965UbgVI3GI+kgNBBPJAgGU0H9mrzYDPBYFNL7nwnrobUbrTiiZqx0CVq/AWzkUPwX9MgA1xvOSB4uLFgD5/xjd92m3MBnQDn1gR5lBw327g2QmmeIJkVTvK5gFJPYpwRFDCuLzFjLIRZ06J4vZV7kcLiJ7Hn9h3GW4PlRe9AoV7y/WFuKxMlvN7fed08QXbA6NWrpBVqkK6xS7GT8lml85jTEOi0HGny2nQzz7BO2t9lqcYtbp6hORhwYyLguHJMhuw3Uws0kARnSLiRZsGYYFclmF3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0JqO8YinQbny1i4D6zXlCgLLtM51vgAMqU5Z5zwYfMU=;
 b=W3/GH6U46XSGgcTvnm2X0qkV0foteameBzaQZCtdPLSKkzCZzPoBZWUskL05ispgd/a5U1XeYwc6lgao3ULuiIx2XB+KP6k8nw9nrHv/zgrqQYL/LLSiFApk45bWKBCWMZcWY2bccidsGso2nKxNU9cYlriw9n3CFsh/4WCObqOjm4gv2ok7JGaN2yDXQhQCEsrugaTLfTAX8GXx58e2JUBYqy85ANa+9CzkNdXK5BvZLgyGdE6NRtvzOoxGFbeDIQIOx+lbGckXPisbQSoK6BzgrWkIVluQEMIwGOqpPVPfEkEONsw/NpN3T8nMwshY/CD0bNV5lEqXEhPLWn0/Eg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by MN2PR11MB4661.namprd11.prod.outlook.com (2603:10b6:208:26b::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.28; Wed, 20 Sep
 2023 19:31:02 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593%6]) with mapi id 15.20.6792.022; Wed, 20 Sep 2023
 19:31:02 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Wed, 20 Sep 2023 15:29:40 -0400
Message-ID: <20230920192940.135004-21-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230920192940.135004-1-rodrigo.vivi@intel.com>
References: <20230920192940.135004-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY5PR03CA0019.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::29) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|MN2PR11MB4661:EE_
X-MS-Office365-Filtering-Correlation-Id: b748f43b-5415-4e05-ae70-08dbba101fe9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nHKEoNgZyY/m4YaLHJyI5NF0+4EL+JeTsHg51igkx6x8hST149+XZJSzsoXLOcPMfrfWIn8bcWHqOxLGSorYR85BV6KJCWsjKJPkYs/go+9eTywq56tMx1J07domnQG4/OaIOWYo8K986VQmIlnCYkmq30EaUmMJFGonMHykYPsuX0RRT0U1etlI7bCVILnsigGOtl3+GC4S2Lh5j+DRwBs8wKpJrqHAUPvomx1KeTHFK5N7KxIwgoI3vyXxU/+/zHcQtkj2JCtawbhZwoa1fpXp240KpREfhnK9agndtTkYvqUaGJYkS4HczhMWab/nhd6h8tkgOfDWbSfRZxHWQrkPaY214cWSIz8XY+X6CyRkx0vYW9Uu8/oE7rzAk4DcPjJ2VyjDMzVu6lP4rS74gXGn+wWdUEMnXFGeNSfXZe5n2VJdDzUlsiAf6vY1a3qcJMOl8ZNNdtDHzRbuXSwufANoSoWxQTuxSrtgJRJ0ty8j70ZgiF3wZHYpBLhEtHNBEabLbWZ8wrhZ2ugHd4moR0s9k1Id7c+2v7TS2w6SbjIcI/6gDsUCjmvwgBvuDY8g
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(346002)(376002)(39860400002)(136003)(366004)(186009)(1800799009)(451199024)(6666004)(6512007)(6486002)(6506007)(86362001)(41300700001)(54906003)(66476007)(66946007)(6916009)(316002)(478600001)(66556008)(38100700002)(82960400001)(1076003)(8936002)(8676002)(4326008)(36756003)(26005)(44832011)(5660300002)(2616005)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Nr5YXbLwmTXR/Rfj35I6Q9p7TyGaG72RbfIaKI0yBC5PATqjEJwU+pw18KK5?=
 =?us-ascii?Q?pr6cAtod7hgalHxusGA0h5EXp8DUG9HShHbQ6N4DgTlkWTFDBAUjGb/W5evq?=
 =?us-ascii?Q?IrIcZSrpguxZlHBwv23XvmYbNH8KsfNBa0dx6mtZmfaEUxzl+rk47yetcBp/?=
 =?us-ascii?Q?g2nCRmiCECdfXzbo585RZZnk8Q9c0sW9H+I4m41VVbt3h+zpuCd3uxB2yuev?=
 =?us-ascii?Q?ryHSF1UL9rjAvPWJ6PLnJsNlJyeXhce1aDf66Q0DvTv3zmR2uSs983NPwtkW?=
 =?us-ascii?Q?KTSuWpsvq83zVrO7LsUj2rP+odwD2t/wElFgyPMz5F7IvpxzaYco5b+s4gtG?=
 =?us-ascii?Q?5uQqz7mqw3MNC5bKOXYM2xCIMJycY+7LiCIEaMUiu1H3XA/Ek0Azde7ALM5Q?=
 =?us-ascii?Q?65esApou4KP3gpn4yHJYOj56p/hY3/qFEHkWUHjv5lqgSRsKYtoWkQXE2l93?=
 =?us-ascii?Q?QugSlLLvDfivi+nwPHy/ZbIEmX33H41S7S9HW4yzXRVQc1wFH+1LHUTGr0tT?=
 =?us-ascii?Q?H4N72F4a61ZNj/rl95fDkn9ugOBLs7lbc8S1fGPJlBvB2lkXLy/wFzRaSnIs?=
 =?us-ascii?Q?hM+JYe7zYdo+DklZMcRicgSx64ncLqsKHhRj2XyrE5PmX4BGbS/OO+eAQINP?=
 =?us-ascii?Q?c4yJw8dIHANoXw9jfnZ2e58AwFDTfV3hklXOcvhMxd7Aer/NNpYQi6r6ghu3?=
 =?us-ascii?Q?4D3euyCUQ7H/u2pcrAWDevSE0q2TuNXS60Cws7jYqg5aoecjpajeP4GN7/zz?=
 =?us-ascii?Q?U+o2sJ3wH6cppaRaW3YfPQgVlL/X2J7jArXMQ6LHOltHfF/tIMa5nX6anjF0?=
 =?us-ascii?Q?surNZEwBYZbTd1JnGcFgBgoDWoFpYl0vv/Y49+AdEPiqQd23KsApNAvDBjcg?=
 =?us-ascii?Q?gWNIMVt1WzjWKiW2pof30jVIH/sr6BvVzfDyWJjPDFhRoQsn9iy3gWiWhptJ?=
 =?us-ascii?Q?fiJYZ00g1ChRWTbtwDRZsRZvhSVQqJjA2H59ZfYmfjRlD4TS4M7p30B2Cerp?=
 =?us-ascii?Q?ykBFZaivLgGYCm7QsaijzFes5olDs4uswFvf7SAEXJGPrOvh+oUCvnrVFfQ6?=
 =?us-ascii?Q?Fb6A/rr8tcM2koPEgHyUu+j31RH1kwHeJfArkZX2tWDbPARs+ElRO5Khp7wD?=
 =?us-ascii?Q?WnfRImH7vge4UwF51mGQWMW6qsEK7CiaisTz4ajoAVJ20KSeoC4yycA0vsgl?=
 =?us-ascii?Q?XUGJf5A6rQJJzkrrqL0Qqfr9v7y4jVt1z3tkJ+d33/tQcyVISMLeqy0wX6AP?=
 =?us-ascii?Q?xG3sU6vjVkXO/qluIGJsxgQBy4HEPZY3IXy69nSljUP5aLHiHnQP4D4TF68r?=
 =?us-ascii?Q?FE276Ywm/y5p9ni6gU5/R1FUcDfG+bNC8KftODxZOqjH5HFlAvh0uRXmzNZd?=
 =?us-ascii?Q?wUDnOWsmxrfrg5Rm7UKiwucjzjAKICt2hJwBuzFmJ1wkvn/zIStDHZesNjTK?=
 =?us-ascii?Q?Y+ZEYjvmqTx1Xw+tbt5sVFk/A+JnNoWezfYmHf88w+OA0eF8opncWKXER5b8?=
 =?us-ascii?Q?GUHHqCC0RBFA/AtlWDXaSfG2nuygMSw1VzYw1jvws8GfKlq3hcTN1mXNLA7F?=
 =?us-ascii?Q?RsR9YBFyQeiNndUCJeK05AgGtGMiXotxADrcijF9WuiRqqoFECk59oK3nBzQ?=
 =?us-ascii?Q?AQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b748f43b-5415-4e05-ae70-08dbba101fe9
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2023 19:31:02.2795 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 46KGVa2scm7tmPXqCPd1fgzrsZWeAGte/77uD410HnbFIhPrWCQJhuw/MzlE1f0tKEvVVJ/ThaV+WSiPQJdNNA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4661
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [PATCH v2 20/20] drm/xe: Extend drm_xe_vm_bind_op
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
Cc: Francois Dugast <francois.dugast@intel.com>, Lucas De
 Marchi <lucas.demarchi@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

From: Mika Kuoppala <mika.kuoppala@linux.intel.com>

The bind api is extensible but for a single bind op, there
is not a mechanism to extend. Add extensions field to
struct drm_xe_vm_bind_op.

Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Francois Dugast <francois.dugast@intel.com>
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
---
 include/uapi/drm/xe_drm.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index 5156bac84f20..1651f393260f 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -656,6 +656,9 @@ struct drm_xe_vm_destroy {
 };
 
 struct drm_xe_vm_bind_op {
+	/** @extensions: Pointer to the first extension struct, if any */
+	__u64 extensions;
+
 	/**
 	 * @obj: GEM object to operate on, MBZ for MAP_USERPTR, MBZ for UNMAP
 	 */
-- 
2.41.0

