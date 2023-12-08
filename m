Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7CF9C10F05
	for <intel-xe@archiver.kernel.org>; Fri,  8 Dec 2023 17:13:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C78610E29A;
	Fri,  8 Dec 2023 17:13:39 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EB7A10E29A
 for <intel-xe@lists.freedesktop.org>; Fri,  8 Dec 2023 17:13:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702055617; x=1733591617;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=SLk80hBEu8SLaMrkzDlMDOJdgnPuVGhkFZq9ObKQntg=;
 b=cNU0kNJopDYlYKZEL43vnM9xaygG5Y3pEIwS0H9FQqWFrxaMi0AwVEwY
 3veZoZEjWfCOLk5xUPnEwLir4QdT2LzDm/YzPCFw5LBv0BUtjaozKvekR
 0kDvBSn4pnets4a3WRUiBw2/PaQRwtNMG3QkVpw2TmeXc7nw/Zu7YDxAs
 1gGH4+LcIXTmN3BGimanSHXaAu6e3vyFdDIThnVDH7N8E0hkiccEwIINk
 NBm5u3DB1PgCOedjXSvYQ0sQOhJNg9PiX+EH5xVKdP6zxLjLWI4HMRBop
 oR43Djkg2559J+2BLg6ZdKtk3yVQwtnK/hNVNI2hzb8lxgdM3BpIeTd7P Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10918"; a="458746910"
X-IronPort-AV: E=Sophos;i="6.04,261,1695711600"; d="scan'208";a="458746910"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2023 09:13:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10918"; a="1103627748"
X-IronPort-AV: E=Sophos;i="6.04,261,1695711600"; d="scan'208";a="1103627748"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Dec 2023 09:13:27 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 8 Dec 2023 09:13:27 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 8 Dec 2023 09:13:27 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 8 Dec 2023 09:13:26 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iw+3I0at7yV9JDRYlYDyFV7jd/b/rg1SfJrcPVBQr6wbfr0+MBm+Nv0om8JeS90O2MatZOQY+JoGF3H7131KBiAwE66ax4RsaUWNP9qibkMUQgF2i8m6GVbS+R+c04Np2vt8TQ/63Gtczvt/oK2IuA25EkAXevRSUDESVV8V3JvPx0vrWoayPVcDVlmqVlgnFNpuc7a6L0CLEYRPe1j8/BhnBvzNzWrgK7DehdoJBxSexQ2nss1sp3KTtlZFg89EbxarfnYqX7U7u58mCtCohoxRpHlDKYytyNK+zprXuGgV8XyNlJ1iS2VVIqrG2GwzC3mqN0oIaFpYInSwCffYDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZBobtjPM7Ja4oQ2UK3Eb15rILxgAtEfwtez4OviZ6kg=;
 b=NXOTZXQ5GSMtQdrCa+vd04Mj/hJElrjpMZYdrgnNXGq26F+kM4/ZteTxQtF0zkYiIzRzVusAltQrHJVGQJ0WTkGnROUFx7AulD6DMHahhuwd6C0PJ8TgfqPnb7L7gFVoCYe3wehtYz60xdrKQHvHS47hKsifZjujNKAg+6HGBxDFvuXmvWdy8WenmUh7OdGq3MfG6KbVw2F310sfKNd2ETfgVNwD9OE1dMt6lCeNW6TeqZre6lRyKlLR8dGd08YJ5Oo8TyBI+wtLZTfrTr1kZ4CYm+GkQH3dARzIsdzHLk7Thw4naAyc/zW2TOoBQvKqC3UaaRXACdJdyKBXym+3ig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by MW4PR11MB5934.namprd11.prod.outlook.com (2603:10b6:303:189::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.27; Fri, 8 Dec
 2023 17:13:25 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179%5]) with mapi id 15.20.7068.027; Fri, 8 Dec 2023
 17:13:25 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>, <lucas.demarchi@intel.com>,
 <thomas.hellstrom@linux.intel.com>, <ogabbay@kernel.org>,
 <daniel.vetter@ffwll.ch>, <joonas.lahtinen@linux.intel.com>
Subject: [PATCH 1/3] Revert "drm/xe/pvc: Add pci ids for PVC"
Date: Fri, 8 Dec 2023 12:11:04 -0500
Message-ID: <20231208171316.901795-2-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231208171316.901795-1-rodrigo.vivi@intel.com>
References: <20231208171316.901795-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0051.namprd03.prod.outlook.com
 (2603:10b6:a03:33e::26) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|MW4PR11MB5934:EE_
X-MS-Office365-Filtering-Correlation-Id: aee032a4-031b-4f12-b3c5-08dbf810fcdc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uGJV6TwILswh1dhXEm++s/PdTNGxN0aKVXJZrZKFqIaY4gm5CCqc1mFjMDeL4kH/ZqXlPGSBVrGT/FvUoVC2QvRb+SNrr+8u41/sMMsWkjQo98Llsjo+o3dVyT9zn8CptVTvv4VehmvZr3lEqI79aQ8WwtQ6RJSXFKSXK+9vEXdoQKv4XPPLI68oQyJh4oo6XXHC+bONZP8AvFAzadf+hFGY5qXj+t1ogjFSeA6Z954DDNIYVtDUSJ7zjJTddCRukBL/1cfMieU2jjQnOzzJPN4wQOEeWb7VGTOyj7mCDKb2I2DdCxCzhpKHfvumsJq3VTsf/B7f7yXv8jeatl+p9bAGx2BdCycoNTercs6sOUo+GGt0NjUMj90YVfSyEOl/CWAcUvvrMLj3DLj1IgOThIURyqqXCZEnhCdjTurPBPjXh5uxjQKR0+XlcNY4uBI8bUREBC2dPaUgXiITO+33ofwMVhVTclIa+Tq4mt/8gM3gvFz95YViVWnFYxatlm+W7UN0LaaJH+PrkOS++/fv4zQFtURTLzDtlOOVS4COI6eDk2buhSUI1u96K/lEeDPx
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(136003)(396003)(346002)(366004)(376002)(230922051799003)(186009)(1800799012)(451199024)(64100799003)(1076003)(6512007)(2616005)(26005)(82960400001)(8936002)(41300700001)(4326008)(8676002)(6486002)(316002)(83380400001)(44832011)(5660300002)(66556008)(478600001)(2906002)(6506007)(66476007)(66946007)(6666004)(38100700002)(86362001)(36756003)(4744005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?DvVWQMAtluc39h5Wg3WGPwC65dGXqbtcGu2ok27zDGrQJMTb/dhosEWSx9Pd?=
 =?us-ascii?Q?Eh7Sv0NFE9kjm8cYdkC+cddtpp/kgJgVxbZCDD6El+nss2ZkkplS6pwSzNJH?=
 =?us-ascii?Q?LNxXNqf7ElYVaZLlScc3New+FSW7Vbdjv7fYR9EcC/0crkeSxSANUyXTgJyk?=
 =?us-ascii?Q?nGjMUsVva02SBiWjvKW+DPrFu/CC6HdC/SQx1kE8TmmwWf0nhHDn5wg8AZHj?=
 =?us-ascii?Q?9BGa7BcgMXdcGjU5Y5LNPSmtET4+vnPCuYdpRD42JGN8p++Btx2RSrgr+LoK?=
 =?us-ascii?Q?Icue1xxMw4R/O3lVE+MULC045CDyK6qzrjvmQckTJ3tBewRfboX+NhnD3dp6?=
 =?us-ascii?Q?JPiouzSV4PM2mKtaSRYPHZVwZNTp0O0QqETvUKMdbDD7seMtCV8NyFLGiZQO?=
 =?us-ascii?Q?okKCy4s7ORkz+J6a9jE66A+pKrDYVVFWqE5qlOEZRUvBU7V8YQwXtKZkOyjz?=
 =?us-ascii?Q?mHvw8pAXqdfke4rIwEGWDJnfnPVC7fY8HCDm8bkNRKA2K9/76ZIKRRw+6cPu?=
 =?us-ascii?Q?VhKtHPVWxdKeUXrGY0lkfbBrOWiqFwyoG429DYkeLsHv+d6JO1eekebHhlsZ?=
 =?us-ascii?Q?zCBN1k9b0AmE2qz9xPpwWpjiZATMujNJJgxQo5yoSjrcZwao/Gtx6w6/b+sr?=
 =?us-ascii?Q?YefK3ZUW22IZEeCyZtRFUjKPybGgOz9RZfZ3QvHpSFMtQE7Cn6TRgyXd0BY5?=
 =?us-ascii?Q?rpULcuNn5xtaWL9lios+IqvXsaDs7Ygx76AaZoRuKrcV3kOy7elzAWQiCeCE?=
 =?us-ascii?Q?P4UJz0h4WvQryXwsQh2mZ6NrZV6uEyMFyc8LP9UESe1R9yjosAWi9ap2ahYB?=
 =?us-ascii?Q?ePZrHo+hO6pkLGQfje1NRFr/MMEAhl+TaeldvMLDrRPxkZrRGdK1EGfEa+gr?=
 =?us-ascii?Q?SYOGyht/C3pIkrKn9imTJIKtys2Kj18dpRSSqrtd3lR2mavH23CMR/5mutzX?=
 =?us-ascii?Q?NX43Npsol/hahLPMmNdVJvGTvbRWPFHACvE726WMN3+V9B0itvPFrPtAYsR+?=
 =?us-ascii?Q?SRY6i61mVqedxONxICF/GB7P3Qs7MWOwPjfiyhZJfJxCVbw7OiMz7bM4MhHl?=
 =?us-ascii?Q?ZYyPNarKFY2Ul0TCith2426ORI5ql929+VOncCtIxfRn7JWEaJQKDxm8UhdK?=
 =?us-ascii?Q?1vzT8IkbB5v/oTjqOOYezQKlT1QBQo3u6bVEJOUkco0fSCjLL1Z3ZV315BBv?=
 =?us-ascii?Q?rLkagVsMsZyi8szBiGpIHiJEd5uKlUJzCykkPjSPewZlVPZvOQBuqy8mfV7f?=
 =?us-ascii?Q?30IUBLAG8umK5WvY9yNDVTetFh1bBJ2T+NDYlnEhYM0qe1psN9Cdwe702+YL?=
 =?us-ascii?Q?FfIliImrbD3bwpk+g5JLU9m3h8wmpH4mrQVJeLHo/bkl27DhmSvQGGsPyAAp?=
 =?us-ascii?Q?N4ic/HmvgEMZ2eD45tyRg2+U50yI6+7YHyxWJj1ULTUM59CK3ajB1WkNd6Ye?=
 =?us-ascii?Q?VH1YQgILuxmGteagMmFJrabvFEsbYWEgltLUCIPTVdi2HSwG5w6whlpM03ZD?=
 =?us-ascii?Q?NIvTi0Wtxmnb9ijXm0KYPdPT7OiTDIXfw3aMk0JGySa7Xn+PPyyUl/VL4m9i?=
 =?us-ascii?Q?4fXYNiD1brIekQlkTlaCbAvfq85/1ZYR8r10Z1c7dCY2wVh0UpHAn3x8axuH?=
 =?us-ascii?Q?XA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: aee032a4-031b-4f12-b3c5-08dbf810fcdc
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2023 17:13:24.9701 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rKArHoVakR+B/S3SVnKtphpG8YWdo1wPnYWJco7r/YGrf3XbruggPCs5EbT2/wNXLwm3zFrFn7tIWEqNj9R1UA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB5934
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
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

This reverts commit fe2e5f2eed85acbbf03f411a4830ce6cbbaaf179.

Cc: Shekhar Chauhan <shekhar.chauhan@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 include/drm/xe_pciids.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/include/drm/xe_pciids.h b/include/drm/xe_pciids.h
index 3011d99a05c5..b1b4e50f5e0e 100644
--- a/include/drm/xe_pciids.h
+++ b/include/drm/xe_pciids.h
@@ -184,8 +184,6 @@
 
 /* PVC */
 #define XE_PVC_IDS(MACRO__, ...)		\
-	MACRO__(0x0B69, ## __VA_ARGS__),	\
-	MACRO__(0x0B6E, ## __VA_ARGS__),	\
 	MACRO__(0x0BD5, ## __VA_ARGS__),	\
 	MACRO__(0x0BD6, ## __VA_ARGS__),	\
 	MACRO__(0x0BD7, ## __VA_ARGS__),	\
-- 
2.43.0

