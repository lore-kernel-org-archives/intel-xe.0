Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F677C4332F
	for <intel-xe@archiver.kernel.org>; Mon, 13 Nov 2023 14:23:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4004F10E379;
	Mon, 13 Nov 2023 14:23:46 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D5AB10E379
 for <intel-xe@lists.freedesktop.org>; Mon, 13 Nov 2023 14:23:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699885423; x=1731421423;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=MxMgOnGOWlsWC2PZ4W4ZXuOcS341PWVi28CMbVSo9lw=;
 b=CcxWgeaZW0NDsv2vqztDkKRpXmW8RkXbhIoN9cPcYwaONI9up53e3oDq
 qtVM1r/IZ4yQmle1FF207uW29MXiaLClmgkoQfTfAx+T4iiujjHAypbOT
 UjobUMahEOduD1iM+3Kqu98izekgNBVu5/WQTw03IITUrI+kY+uYffOtn
 WcNumu0GCPqLfd+sf6LCCGiDnOgHFlR4XUx5DBFJ9iSMqdHrPWETIEmNY
 Gr0kAVdggOks3w6AXnJ+HvgZecYGAEFH1bPY7Y6Z2Grxf5vFcuoH4uaHx
 A8zGcvACO+AfXXSBvJxdL32JNNDN67oeMavT8Vv8IGPNbuEKve0YJWIOK g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="369779273"
X-IronPort-AV: E=Sophos;i="6.03,299,1694761200"; d="scan'208";a="369779273"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2023 06:23:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="1011553247"
X-IronPort-AV: E=Sophos;i="6.03,299,1694761200"; d="scan'208";a="1011553247"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Nov 2023 06:23:43 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Mon, 13 Nov 2023 06:23:42 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Mon, 13 Nov 2023 06:23:42 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Mon, 13 Nov 2023 06:23:42 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mIgwjZERCSOEGKqQgp0DtYyU8TJ81EXaJjLwI3WzSCcMrrG1y1LXYa2DxsgebsZ7/s6vMm1AVvXQtGxbEmYcoXAOVlAdkdXMXewCzlVIN14fQIqwxSAczczXD/Yfe8AnF8u+aWK44gAJpTolwBEszwbSqsPYs1L+f039E/oftmiXJ/t9TkLqA1cfgw+wYotfYi17OqIEPgoO+7+YzjbcgPWNFOUHlo/M/2SJVcYqLXCg32OMQzo4Qtfi60EGB7Q+rdD22zUB+4n0oyWBNf4OOVZtI1cJayWKY8kauABp25jBCsuPZm4fNVRTq+0VmpBPcTG3NJ8c1/vD1voWDTgW7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=10Ri0J7nH4rJwACciTNuImzBS09ukDVBBLV9k6qyD9Y=;
 b=kYK2G/epVPkIlCaqm+VKJdEXGTuf6Zt58QNOMSbc9ioDUqBnE1GLOAvYSz0KzmUT3AKOB1KSnnptnhIxxuAwy0TTVEYmhFJZvDLvvn3+MxJfZj2AHBosk+WLYb9o95zMhnVD6ZHVtU0ebBJbK71Q2jo2W0o4ebO2w4i56tEVgRSnY6HUMSTKMIM4oVG3HyuA/ukRSSxRBcGwhtJs4X26ReUo0x3fLTAbaXQ+S6HXgLvbo7WIti6dPhzAB1Z5zJWQJ4mEqwFpCl5l03ls4RU+qa8FxUtSd/FW+DGPEIrg4IuGkIYEMAqkTiOymLh1gDHO5N5CeiCTjC+N1WBKhwse6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SA1PR11MB6943.namprd11.prod.outlook.com (2603:10b6:806:2bc::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.28; Mon, 13 Nov
 2023 14:23:37 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::fab8:8ece:c8fe:fc7c]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::fab8:8ece:c8fe:fc7c%4]) with mapi id 15.20.6977.029; Mon, 13 Nov 2023
 14:23:37 +0000
Date: Mon, 13 Nov 2023 08:23:34 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Bommithi Sakeena <bommithi.sakeena@intel.com>
Message-ID: <ksztic5tu4wjapm5jkyqfbcbjoen2364iemdrtjh5y3u6jgm5t@v47f5rt6wws5>
References: <20231109174709.4360-1-bommithi.sakeena@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20231109174709.4360-1-bommithi.sakeena@intel.com>
X-ClientProxiedBy: SJ0PR03CA0074.namprd03.prod.outlook.com
 (2603:10b6:a03:331::19) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SA1PR11MB6943:EE_
X-MS-Office365-Filtering-Correlation-Id: 5b86de72-2083-446b-26aa-08dbe454201a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0uyld//XHBL3ZuPyUpZnUgQ+tu7jwx/+UzSKzWogbzX/y8jeYNgVJiuiXB38Z2egj4+WIFPk091JG0J+2v9+FbQswvIi1Fms7zh96hsuNLDTa7h/CmLD6MApexw5dM7qQMQqB/y4CLzx7nvVWsxm5GJ+YN2QA9W5y1CcXt09D/iiJ7YStradg7hopRrgQVUPZVCccjwAS0MBM69MwUH+/3xV1IeCkZ6qXxTRPG+bAAV577o9DyniLxPaxlo2kxKW22lZK6vB/mVQyevSOpcpfF3N22YqbmMNocByjCS4Mjz0mXrz8BsM4qhxmopvvuYtV0JS/gmm4suakicQ8CQ7v1XaNudfNG20szTL0xAJTbzi5Pkmz3rfdaqZF0kqrnbJ/WmpBnrHTLV5qq7T0HIZd3NX6B9d2xDRuzGu9mUWagtD/nKjuYWWbxpL4prSfy2/x67/qTfhj/R6/5YhDL3sO592SpNnFkm4X23vvPdZx7Ua031+K5Nzg1jCf+ebnt3yRQdZUgxaNb2pn/soBh4aUq6QC0R9+7WrqYvRCQDLLyTVtmn/2tkPYTZGRqVpqYe9yYhusPkO9uY8NXWAQeTZPakNtrtt73XjO11ulpgSZ2qtUTmcjeGBd3t4JOdPyytr
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(376002)(396003)(346002)(136003)(39860400002)(366004)(230273577357003)(230173577357003)(230922051799003)(1800799009)(451199024)(64100799003)(186009)(9686003)(41300700001)(478600001)(6512007)(6486002)(6506007)(4326008)(83380400001)(8936002)(4744005)(5660300002)(2906002)(316002)(66556008)(66946007)(6666004)(66476007)(6636002)(38100700002)(82960400001)(86362001)(6862004)(26005)(33716001)(8676002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?2HD0E+ndIW958+WPe0w6ErTGjOAt8O2rH8LAXj56wjtULQHyBCcEgGm3/xOk?=
 =?us-ascii?Q?BdcotH9uk8BAeVQ/jlMe2i7o7Ll+2WsxagBLJBZr3+NQwyjJNuUfECCMR6zH?=
 =?us-ascii?Q?fQl+Cm6GnI5Gq4c09OzPZyULB+Iaz/Vjgim+XFqxLMSmiU9ywkuV9rpm1VPL?=
 =?us-ascii?Q?BVdtIGveMxtFwARtp5cq+FPt5un3mBDuAfgrQNNg41EvT75YqVgROjJglhuZ?=
 =?us-ascii?Q?80Myy88xr0jPiZC419JvhnIcn5UcTe7j5ZvGFutz6l0abg4VNZQksNuKcqil?=
 =?us-ascii?Q?KmgnGYl+7/BBgGLxOxi/0n/4/IRiianGyfhfd1XXofu6/CTagQWIT8p69QuB?=
 =?us-ascii?Q?4ZZE9TY1H4sWIipBKhqtz742jvmhMjWJrzgYYik0pi6orGzTtuchDucP5Xsb?=
 =?us-ascii?Q?GZ5noEely17RXi7suM8UzfXuh3ri47ZZwZpyc0OuP7SuU4K+Z2X0ghsLWC1k?=
 =?us-ascii?Q?Ni/qtwMe22Zynxh6ePjPDUc91a9aAm+Db9Ydq7wuDb7gRaO00dPvqNyDpjfc?=
 =?us-ascii?Q?CBSDa3YZu4yLncdmUpXbyjKAnqu5RX6px9ZckvRL2tIqyGLc7LAG32Z8Bu9V?=
 =?us-ascii?Q?DnJ1fodj4DsvJdvXBdMw7MNw8yTCLMtgGWIjz0KfnBa22x8+Qljsq6lKaRc/?=
 =?us-ascii?Q?3ICOKu+Xz63uEvvKPhaoaDmyOoEq5eYPG9H+Uxvm53MZyM39q2ZwPM/xp5sb?=
 =?us-ascii?Q?w8lD4Ia8qtvd8eh2sDw9H5vBP89dqXN+UGIWuk+D8/FP+i5lTHa2Vn1VNQ9v?=
 =?us-ascii?Q?ygwzE4u4RnebuHvb4KhO/PYwvL859b9jmX+DnlUv5r2/wLlCsPKZCjQlxg0p?=
 =?us-ascii?Q?JyQxoDeH1CBVGQe5jeDflf4q3bDtV7dcUxiFU4Dghvr0xgWmAoicAY92wb2i?=
 =?us-ascii?Q?Erpn/ytQ051ca3+TLTmGEhBQHP/OkR19vey3ot8PiCnqJGJMCpLBOZ2jUQOv?=
 =?us-ascii?Q?UePoRSHteo6FdMNcvGtPi791oiPJnrtsGSK3X8WR4sdc12aCguYSwVrzljzM?=
 =?us-ascii?Q?+IrOoVs3ebvqiBVpDTIvsfSwR7sRk2oihTj5W+yS+q1zrTtGPRu5fCIlHbW0?=
 =?us-ascii?Q?46c4+Px3AD+9PjcvYM8d+BxfqSI8dpO4JMfDOP3gFwTtplNzKq7jcfioj92o?=
 =?us-ascii?Q?HxkLZYapP0X/h0xrQN7bx7GYMYLDSCayKABmuy4xmRZQ/s8Stocr/9wMD4jN?=
 =?us-ascii?Q?y+LupUwvOOge7nw6qDoX5Xx29EisgpHhh5Px+XOSbe75spyEvRf85l3qfEF2?=
 =?us-ascii?Q?OYPx7t3J6HQ+4Typ8UNqx6JzfQhGSrrLARVH52j0PGCU2yZ4CBbOeO4mpN+c?=
 =?us-ascii?Q?CeaBiWUdPHr4maIDiHbctV5o5fOXUpkpzGEXSDvxdTMzxdX3Tf1CJnkFMDvJ?=
 =?us-ascii?Q?VcDDnPsS8NBMAQ2Jabd88pd9gm0v/PXIlFRtz+MqbCF5K7ohqhKmKny/yURv?=
 =?us-ascii?Q?8UZ2aP8eLY3rBRIdUUfWoYxwOgPn0p+JLzXL38eGvY2Aqat8s35uvN1oVJ3q?=
 =?us-ascii?Q?3YcqVbYKNx9K7OgUU2+6EBvsxD+qn6LtwfmjdkPxie5vvbFJpKsQnWu73Ncp?=
 =?us-ascii?Q?pkFZugKDOFFfqBIGWaR6CJWOnDxaQ4xs+hiiywUj8ZIFV+7RfBrIjrMQC8Vh?=
 =?us-ascii?Q?7A=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b86de72-2083-446b-26aa-08dbe454201a
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2023 14:23:37.1464 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XUrHTIwWtv+N91JWCbz50MuTlcX7LLWJK3K5y1nY2rsOsvk8nRpou6FeDIcKK6aj4X/ajNYCfhQ/czb1sPqoiTWhrOn0TGFJyasCvAo4tXU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6943
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe: Encapsulate all the module parameters
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, Nov 09, 2023 at 05:47:09PM +0000, Bommithi Sakeena wrote:
>Encapsulate all the module parameters in one single global struct
>variable. This also removes the extra xe_module.h from includes.
>
>v2: naming consistency as suggested by Jani and Lucas
>v3: fix checkpatch errors/warnings

checkpatch CI check is still complaining. You can reproduce it locally
by running

	dim checkpatch HEAD^..HEAD drm-intel

assuming you have this commit as top-most commit in your branch.

Lucas De Marchi
