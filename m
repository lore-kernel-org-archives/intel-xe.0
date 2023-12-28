Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1629C46CD2
	for <intel-xe@archiver.kernel.org>; Thu, 28 Dec 2023 02:13:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF8C710E23D;
	Thu, 28 Dec 2023 02:13:25 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE66910E258
 for <intel-xe@lists.freedesktop.org>; Thu, 28 Dec 2023 02:13:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1703729604; x=1735265604;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=wnLXVHphW4id7lfidwx+lWi1RAhxXVlDBARVALeIjR0=;
 b=TKJCjuyew4PSc4VuYUs3ZqS5+ZfN1BV1e/PLKMgdJyMMgDkXkCytNnWB
 tC3xcaeCc0g/Rd/+7w25uZs7Ixc2dVtwnCzJCVxBDwYPJAIxKWwQuRIkp
 N+3fyHTYkUG/JquMP/rmM1MUxrVxFmBfj/rEKrUCAlqhic+i9oEqKRxxM
 o6JDY7ObILC1K9g44I6nAqukyxegFWtcBpCaFZXbb8Hp3J0nQlp5b8ZEh
 KSNq1eC+7f6nlRk5E2JySil/jn1BLir3HE+xA/Q1jPtd5Q+tNPwDt1GkG
 z/ssQW/namV+WLasFaiHS0a9yfmIjXnmEF12g9hKKygH9xwM6Bpa5JcQT A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10936"; a="3807716"
X-IronPort-AV: E=Sophos;i="6.04,310,1695711600"; 
   d="scan'208";a="3807716"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Dec 2023 18:13:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10936"; a="921983504"
X-IronPort-AV: E=Sophos;i="6.04,310,1695711600"; d="scan'208";a="921983504"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 27 Dec 2023 18:13:23 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 27 Dec 2023 18:13:23 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 27 Dec 2023 18:13:23 -0800
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.41) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 27 Dec 2023 18:13:21 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aag2o+Vn/xxHEcwl+71ci73sGMZ9IJnuWh7VAQfG/YUTi3MH2BMrKqD9ehTt0TLWDIGkjLt6QVpCKUnATbVotwP7/O/FYfZpM56CAo3TmkH7TIb321+R6TV5IbH1UBKdypY0Ermx9/IvA7eF+e2SVKErvHln0yL82ICh0TA3QC4OxIpjvnHDwpIkAkqEFMbBx46IcYYPe0OAM2AYACrPm653PnS4tr0e7OiI6oAekWHL0eWs7Ls6MBB4s8+lIcTuCcR0jQT2kjX70Id0izvhT/hHyqc8GOtLd7PwQQ9Vx68mcvwRIgsg3hSAejO2Nc59OjRHEjAJKLdCPG3+mnQ0WQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3LRrNmB+hXCzv/JdL2/BIwidr0pdB+QJQn0I5QngVzE=;
 b=nvxNipZa8z2wsq0/P/xYvzvq5MiSuhr/VP6wBq6bp0aZ0TJyHZgXnNwOu4aTphnKFMs5oWGftvZO8rW9xX1lwDcXj/HvLBG7tmxP6UfDd/20/w7iC6AIQdMVaRRN0L3oyK8r7TUd+iAoeKpskoAL28Y5N3BQQNQvfa5Cy0cRs6W9hUQ5wXac9BOIGtQ5I/anUJbPrs8Ime6CkN+tsi1mYlXLPlw91VHWF3v+JpJaF6jRIX1DBCZRxQ9Nk20P3L8GkUJ0ovUmiQFu408g946KHPuSBsysL6UoO8ed8fTIIazW5ooTKJiB1ZCGh/PX/P5xoUKEVbtoK/v0qd8rTgKRVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by PH7PR11MB7146.namprd11.prod.outlook.com (2603:10b6:510:1ed::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7113.27; Thu, 28 Dec
 2023 02:13:14 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179%5]) with mapi id 15.20.7113.027; Thu, 28 Dec 2023
 02:13:14 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Subject: [RFC 11/20] drm/xe: Ensure device is awake before removing it
Date: Wed, 27 Dec 2023 21:12:23 -0500
Message-ID: <20231228021232.2366249-12-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231228021232.2366249-1-rodrigo.vivi@intel.com>
References: <20231228021232.2366249-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR05CA0018.namprd05.prod.outlook.com
 (2603:10b6:a03:254::23) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|PH7PR11MB7146:EE_
X-MS-Office365-Filtering-Correlation-Id: 732ff773-b1be-4c8a-8c23-08dc074a8c4c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8FIbJrj84mIEpUDGtlTbspYxcG6GAToI4SohhAUcU37u+7pe2dtv5J105tm6IJXsq2F/IcHU3QTVzdHZc8z9SAz3EkPZK4wGWt6KEqN+Ezhm0qSQIuGaOcSYLJQKOfBescwJ+36IDWN5zHenwN2a1dsptejqHVjCCDw2mp3hxcnmTxmwLFoEbj/+t7RELunzqWv/Y80SaWA/u5PGHPitzY5qQCr6ix4UXsAx0jxt6//8D305raAfG/enPV2iMC7JS9szLq/mskWJy29XRoMZ/fHtQsloSq+Um+61gKEEEyPQo++YOdd6Et68uD0akIepRI2wA3xMUlxMTH+R30miTO5EKXN8gBu44VtXjEFavumbqg7qB2km9Fxf7vnQFTczNiOQr1vEe5HPlWZWfTvPCXelwkAuT6ZZec+LvdFGRFg1j1lOmPjc0UoeUeoTNsvRN8PUV63FEQxZo09ZWT5L+0jA/HWvCEDQFvLT1OeNF/vuAoW+hBSDehErQ9EcT+6DVV5WkFl2nc8Eibl59Nk06dEz8PPgdptHSdNuc91ePWmSm1HPvOROUOZhFgqiJgSx
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(39860400002)(136003)(346002)(376002)(396003)(230922051799003)(451199024)(186009)(64100799003)(1800799012)(4744005)(82960400001)(2906002)(38100700002)(36756003)(86362001)(41300700001)(66556008)(66476007)(316002)(6916009)(83380400001)(66946007)(6506007)(478600001)(6486002)(26005)(2616005)(107886003)(1076003)(6666004)(8676002)(44832011)(8936002)(6512007)(4326008)(5660300002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?e8MN75yU5CPqswSeFd+dLxJW/3XDBAOIrd8CsdWK+tH8TKCH6LH+U/O6ysgY?=
 =?us-ascii?Q?HY9jhGquTFLohJDrtyOijkwWvzE94YRdBXZrrCigSpMozv6FWHMNcsv3/KEZ?=
 =?us-ascii?Q?4Zw0sbyEQx+7KC96Dz9ZI6gevFzIuJiKbRQq2NPK0CsvxYKq+N1aH6huZO5P?=
 =?us-ascii?Q?tZMZ7vAKKAyQmV/8UmMNFrVBr6+FskFIFhClr0ubJe9A1yZCrUi7pKMAqu5N?=
 =?us-ascii?Q?u0akBYlYzHC7lPHzSOKC+AIh4eCy5xm2Blimvff2PM6OmlM9fusVt0uDW1/U?=
 =?us-ascii?Q?4Kc5uMpmq3m+Mvwk3VC6BtZ9+3dfpq24CTW6n6STDRo0jiEG3SIcXxTqIIsM?=
 =?us-ascii?Q?IaywvPBdo3N/GWRhEzvaCZZdVfnsVGPMtwKh2+pTxVqcXqSosYz0pCdmhs3s?=
 =?us-ascii?Q?faiEee5Yh+H4JOl7Zg6GWLrV7XEW9wUiiUoOAFWkcoVAvPFY2o7470NazHq+?=
 =?us-ascii?Q?u/jOSXi6imjRnm9oL+6tP69CugDxyHQX1nimdS38YjDOk3u7x0OUAHMXGMSK?=
 =?us-ascii?Q?wK0mbUhQ2rqeencgXsXVMf8oNHw8x7sTqowJ0bmpexXIiaaSXTpkfcl0mbwT?=
 =?us-ascii?Q?SBrMUXBZpRWWwv1rhsHFXohGPkp35HGCCwtbY9Iqwnwyq9PG6uvJCR7kStDN?=
 =?us-ascii?Q?/NPhG0nQuk4ynTAnrdmt9iWxuRoUVQHp8yT5xlgSq/LE/z2U69yz+IJZ9kHv?=
 =?us-ascii?Q?W5A61taHlzkxzBwqfVZ3y3I6wYiVRxT1xF6VucfdxIlLyJukG3ibmfljOfLK?=
 =?us-ascii?Q?Iq9A0yAgzjbx2gXQcCpIfW+GIbYKx/JcVBq/FIlybwMjtUhMRXPhNC2v+wZT?=
 =?us-ascii?Q?y3dxZ6uhfWb3bbfqmDhB4t5kNNT3K0n3A54iOWumuxMOxsNVV2mhNR/TYRhU?=
 =?us-ascii?Q?Q+AMF+hk7h7NputpM/LmZQRGlofa/jq6l8h+waWBds4H+ZZM7JG0cNuSf+l6?=
 =?us-ascii?Q?nRpv8OK0TZKaXYcUYfnUhjKrQmJIAkZ4utUAlshuIv+6lLbSo2WwTybK+gFT?=
 =?us-ascii?Q?6JkS+M5yUEK4TxSUNENj2+cWzg4ME730UVaCHyi6jiZM5ROq+ogEnBrN5r6W?=
 =?us-ascii?Q?O4PU9U1nVejI+D+iHeBlexGOHAYBLnqkGFT2wTUC8UPfe7BwRORhVzIonsc4?=
 =?us-ascii?Q?b0bqYYwBlzAMi3oEOye7dPbFMmPPpfv027E0CoKDBQ2e+9EpA31H8U6K0+G+?=
 =?us-ascii?Q?jix93ml03zvqj8LJw+F+iCXq3311Qiscw6aXLQpRJdZPNYS46p0pzzD0c81m?=
 =?us-ascii?Q?asBBz45sC+ALVJl/74KIxpbGdUa1iDXGp0q1NLjppB4UIy3ck/gh/QSK8OFa?=
 =?us-ascii?Q?oWrEGtfmJ/xn0rPDLH9H7uHuM+iZTCGUcIWNs9cG9wPqc7DVcRqf1Q+nwWrv?=
 =?us-ascii?Q?3nGAwj++pm83iP0+iG4dD8ZHlogZiOT2w+L7qdebk9RspdhA+U47rqtLdxOe?=
 =?us-ascii?Q?MeyVdGrsezzLfLDouGtN/p0DNdYGdZWSur+tAger90ZHM4tABnRQYyKq0Ikw?=
 =?us-ascii?Q?lUYgYiRzbN/cfs+GSnWPlKtVPtIv0zqLWcSAI6GfTI9qfo9m8Oharky6h0qd?=
 =?us-ascii?Q?x0Pf+hu0pKdvUB/QvfqKNI4lQ1o3jeqaWyUMl3QJQZuSB/EiUUuzHljxZtQc?=
 =?us-ascii?Q?gg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 732ff773-b1be-4c8a-8c23-08dc074a8c4c
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Dec 2023 02:13:14.5428 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: arFtP0g4+YpgndNjYciV2r6kH16AZamqrDPeIRmiSTeceRZt5JGOz2trnQ9mo242m9sJYCkjGaLNHU+yBKhljw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7146
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

If device is suspended, the module unload might face challenges.
So, let's ensure that the very first thing of the "unprobe" (remove)
is to wake the device.

Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_pci.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 1f997353a78f1..d4f36fa6572a8 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -686,8 +686,8 @@ static void xe_pci_remove(struct pci_dev *pdev)
 	if (!xe) /* driver load aborted, nothing to cleanup */
 		return;
 
-	xe_device_remove(xe);
 	xe_pm_runtime_fini(xe);
+	xe_device_remove(xe);
 	pci_set_drvdata(pdev, NULL);
 }
 
-- 
2.43.0

