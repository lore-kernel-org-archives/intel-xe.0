Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54582C71131
	for <intel-xe@archiver.kernel.org>; Tue, 10 Jun 2025 15:13:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F127C10E49C;
	Tue, 10 Jun 2025 15:13:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WHS1o4Rs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EDE810E49C
 for <intel-xe@lists.freedesktop.org>; Tue, 10 Jun 2025 15:13:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749568397; x=1781104397;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=vc6mnrJ7WYDp+JlVqdug8nI1hI0h2RjKTwjsDaAhGYc=;
 b=WHS1o4RsUF4NWA399uvx9rk++IabV5OI4ccpJi+hqHpo+86wFPRdHLPm
 u+mHf3cxKNZpfqdw+Rgh4PjVz098rQLizNBrVi/TE0+Kewa3n76FCzIVo
 9ApNB/ZqCwVDTDCggB8tg6/BvQO/8wD2FsxvHARahmRpgUErtbywEhcsb
 U00YDb1bVfPte6Q8xNWN+BK7lDu2glHrMEm95Zmwx3SU/3xMBWERtYw9j
 OIVmb2vj8VtNUC/XJ7b0tvO8IZvjUrxWk0UFSooQkUyQiHWkKcjzS1zYs
 VAB2tIjRPmL2FpsIUgJ5WQAy1XJ9QdtC1VeDyA7d0kYz0KmRY10n2wiAO A==;
X-CSE-ConnectionGUID: gj+cDAglQ5KqCUVx2uUQwA==
X-CSE-MsgGUID: APAZcf0JRtarDodHcwgYyQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11460"; a="62340283"
X-IronPort-AV: E=Sophos;i="6.16,225,1744095600"; d="scan'208";a="62340283"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2025 08:13:15 -0700
X-CSE-ConnectionGUID: CTiswnUrRTiXX8hXwn9/mg==
X-CSE-MsgGUID: hJ03N6j+TRSmXKcshsgY9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,225,1744095600"; d="scan'208";a="150715738"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2025 08:13:15 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 10 Jun 2025 08:13:14 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 10 Jun 2025 08:13:14 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (40.107.243.55)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 10 Jun 2025 08:13:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pxOOm+l6Fl7VgOrQiRcUnMa+4DSWbkkjlVHDrZHDMgg2u2T1GDDgRX6URofapvmZhouVFcuFkLwAkur9Tubqz8h4LOk/NhxZsku2fUqJFyxI+oB9XTgd9zkMOMHFXGM4b0rkI57ijsw5NVRvm7ygo+pDYPStU9bd1jENae2UosgggFg3p3iwHi2/4OUbjfmNit6WbsqXDVCrcMNJxQkiuebJBJtwVHX9i96d8YsiWS5yeF6Vskk8358f7b3L54yOjudzfytd56kx10bPvBS0xj5malpedW5Hx51T3iMr1V+OQmrg0xVZZwq5Ml1weJiHfSeVVX4y5QYHNV+LNiQ1lQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fk0LfeV7AHe3/hIugHqnckZN4Hlvzl/oKAyjrszERhU=;
 b=KJylDTelS6fJldOvijZXduSguc34DpOZNRYwIVFSJ6IPrBo1v3FyW9hsw7G2Quy95ddB13Q4y4vpZKwuFMBQi3f+FNiPa+DwB6XXvCKabBsRaPJu9FxXCbTrL3ZoqIKud1dnbHWn59LMdKjH0INPrZ27aY5OHvAJ/509YLTPlmvTXBzIfUffdtpeo+WWntM7Fky0/FRRDMg48EGzyOBndouIKky7yu4BqO6KgZyCeggJlL5sEOtMWkI2dMGoi9SYtMiEu6PnR79aBgwYcwWWAlvFmDufLfvy/7V3pyIPD6glfsMn/bk/4aunMfaFkVHE1yLL2oQqa0iE86SgLjbhLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by PH0PR11MB5142.namprd11.prod.outlook.com (2603:10b6:510:39::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.25; Tue, 10 Jun
 2025 15:13:12 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%4]) with mapi id 15.20.8813.024; Tue, 10 Jun 2025
 15:13:11 +0000
Date: Tue, 10 Jun 2025 08:13:09 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: "Bhadane, Dnyaneshwar" <dnyaneshwar.bhadane@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Taylor, Clinton A" <clinton.a.taylor@intel.com>
Subject: Re: [PATCH 8/9] drm/i915/wcl: C10 phy connected to port A and B
Message-ID: <20250610151309.GS5080@mdroper-desk1.amr.corp.intel.com>
References: <20250606195104.1771715-1-dnyaneshwar.bhadane@intel.com>
 <20250606195104.1771715-9-dnyaneshwar.bhadane@intel.com>
 <20250609150527.GL6239@mdroper-desk1.amr.corp.intel.com>
 <IA1PR11MB62668338EF7E973EBC4AB446E26AA@IA1PR11MB6266.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <IA1PR11MB62668338EF7E973EBC4AB446E26AA@IA1PR11MB6266.namprd11.prod.outlook.com>
X-ClientProxiedBy: BY5PR13CA0030.namprd13.prod.outlook.com
 (2603:10b6:a03:180::43) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|PH0PR11MB5142:EE_
X-MS-Office365-Filtering-Correlation-Id: 08ef5046-6cd9-48b2-de32-08dda83150a4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?k4LERtnoBTkDWDkF3iRdILXH5sr2esyiaW6Phcai8vRjPxTGSngf+IL5WpPO?=
 =?us-ascii?Q?rI+CGm3brlIWESyOzspaOE2zWD2Xj+5GbUthEdZfcezRvhFnAEc2FVKsTcM5?=
 =?us-ascii?Q?NZLtQi+3X0zNTm7kAh1RFCJEEmD5vPJYusRi3BaBU0pq9xpip7XM3UUztdHx?=
 =?us-ascii?Q?qtlHwMt6zDsF5gUZW0eeKxB+hGQL0tyYka/cOIj5mdoAs3OvkLczWPrk8894?=
 =?us-ascii?Q?6MMmYAgaXxb0C8hlZhHGL6aNFE7kWQgCJ0lpFYuqeSVmqZMceX201TPRMwPb?=
 =?us-ascii?Q?mS5jJCjLlsCJoTShUqtrxd8r8lLzv3vU3jAP1PnrVH4+p70jusjRqjeWhz6s?=
 =?us-ascii?Q?Qzqmo5dsO14AbiELM8vSYL7gL92KND4j4zyAOsqi+uTGyo1t2fXiXwzsOCcU?=
 =?us-ascii?Q?g8p5HfDduyZ8pfJ5vKIm5Yhh0NDZ1IRjDhBzLOJDW2GhKwOsWtXduw4wspWe?=
 =?us-ascii?Q?pSpBtwRt0Bk89pPlvpBEMhcR41pnRK1o3CcYmMTOfgvRlURmikywljuQTmJa?=
 =?us-ascii?Q?y7Q1/iGzwqtmEbN24Rmoqm6e8SmFIQzxhBxgtEVD3xlaHbJKKfbyaUhzzILz?=
 =?us-ascii?Q?Y5hX6a44jNW6t9havsZeHw242KgFL8pRt7/66UFOIzcsPPj2+Cz8iiXPmRHE?=
 =?us-ascii?Q?0WSMsONrRAMEpATFUMpqkdiJi6EgMD9+ucfLmaisUytmdH8mhLGTU9J4C/1t?=
 =?us-ascii?Q?LwU+W0msVaSD2aw3VXaTHErdPxhJ7YNgYL6BgIpBb4t9BI0p+u+NJ9vXa9M2?=
 =?us-ascii?Q?oMjARzLrUJhlZ++0NGi0jKbBrdgZNEwDGLwIvAdc1DhmzQ7cn21Mv13TJjSu?=
 =?us-ascii?Q?obTVwN3iolVt9YHDIrQ4IxJrnxYmJOrixITdHMabj/gRNP7QmJfKwT+pTISE?=
 =?us-ascii?Q?lgjw/kcrZ/0S/zLbaqvNZQxcnMfsYdNI0bnuLjeOKCrOj3pWZ8ParFPuYlzy?=
 =?us-ascii?Q?9EwmV6M1/JRn4PqaCYr6hKmtfO0nhP71IVuYkWHsib6McU3Y1YM7YBLjlvK+?=
 =?us-ascii?Q?U85nwfwxCuYUB5fc3PclFyNEleEq/MceyHl7fKetSwFUqg51QxVnYOpm8dvn?=
 =?us-ascii?Q?JFN1kNsWz9z/ZszZ+oWXb/bwCvu/Cy8RtN+RMN7uTFn8jP7XBswKtI7RP/st?=
 =?us-ascii?Q?yD81pXq9/m+EdJkrxN3TwS9YnlsrVaXZU4y7xN7qrohF82Y1Lhpf7pyFgGYm?=
 =?us-ascii?Q?aXv8/mrFZ70qLKQTBPhz6dnXZZVFtmg+JzA4CAwg8PM45beKspqIaXkfbC1N?=
 =?us-ascii?Q?qy+r7/vlZ2nD5iZdSHmRplAoRAcu0Ac5apG8+6G99yPKM56JWWp3HTxuXpSC?=
 =?us-ascii?Q?iyR42sIOMFuBe2TGbztkcbpPNJN5/43ck1lGjpS8Q119A8uVseE2mZWWyGTD?=
 =?us-ascii?Q?maa4Vkw8MfWJy+irgh2jmI5rzFAp0CYuS0mTKDZnx2+ptMzjAXBWF8aXUWK9?=
 =?us-ascii?Q?sB8cVbEk3QA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?j5W2X56iT8UwYuYJ9zQA/fD8zgdzAXvseniCtCEGgknHcm4rCMwF21Rrjt/y?=
 =?us-ascii?Q?cTRgveyGRREuPR9xczwB+fDF+NcX3XahOXABB/a1PKKv93p7hP6RKIjjXlJr?=
 =?us-ascii?Q?tyglcrKEw4bx/63tMt3pro9fuJjDRXLeQk5qt37nwg77pod1nue46WANc7lz?=
 =?us-ascii?Q?Dlza2AEPIzE+ly4WX7UuGhXTcb2h+LspS1ecMj3Jxgdq5vDBtG0KiGeiaSvh?=
 =?us-ascii?Q?qBlLnCOF5OVIpo7F++FWulTCqUAocLVoAK75uGxyEzp+gDyQnk0O9nP8qVNg?=
 =?us-ascii?Q?nOmoyVc2647Bxa4fdPZKccr39nD1KvvmkLChuWA6EKbuYaGcH3Rv3bZ263Dv?=
 =?us-ascii?Q?YK8OGXokpoP6Guuur092iTJTqc8SWZVLccG4azbYiPrN/nMxdb4TAGZaqh0C?=
 =?us-ascii?Q?/XZistwY7zURws21NUsF3VihmQ04e3yz9Rpj+MkRytX3LUCvwzTWLL9scZeR?=
 =?us-ascii?Q?o1YmD88aL+3NTBr76TwxUQLAg0sj4Y3vJLCFFsaoaIlAWa6qZbvNuSsvdE4t?=
 =?us-ascii?Q?sEniY0nfDw6eYLHV8ItpNYmjip3ab2E1Q2YiA/Y/qAeZJS3Mk0ZyojvwPWQY?=
 =?us-ascii?Q?iUocQUhGrg8eSeIT/5dsy+2VkBOpOa90ZIf9hMZ0csAkXxQO37fYBW3gqNe5?=
 =?us-ascii?Q?0q/SuY1X9AWxqN0PSbkCAqR+9R/mSA/kj8unh9kDoPeaZ2sirVwyV4CxaMcD?=
 =?us-ascii?Q?a8R1biD+FJSJdFPuR+Tay3uOoIRYXpVy6vjTou2Bg1H7SK8Fa1fdg7f4el/S?=
 =?us-ascii?Q?/5EoPPboM2WsfWzmRezzpaDEjl0bYbd3JI/iwkjvqv36puqqkeL9CREKqZlb?=
 =?us-ascii?Q?xPbFA22a//Y+1FmL/pcJ75clCWsMUeJ9SnfmSrM3FIQoCB6QTq+mQYx1br5D?=
 =?us-ascii?Q?2+tgOzOkYh1pI62FcdhAtev30Nld0j/5N9t4avU/oPP5cKD797PIuyQgglab?=
 =?us-ascii?Q?+lePwjfaxSeFChAjVSSBZQHWizsZyytF6wxS8PuC6Lh7ZRk3LyB4xE825xPW?=
 =?us-ascii?Q?8b5b91aZweEGAcMXnaXcHOfQYRY0x3qhKGjkqYPiNEuW3qZahteFBaJ6repF?=
 =?us-ascii?Q?a8Ex2pFH/lttiKWMaO0RNy7d2W4ptt3GtFhMPW7g9aoXJdL1Feym5aDvBnPk?=
 =?us-ascii?Q?uyU4TIuisg1zMaoscXR3FjNxDGA57NZpOpUPrEBv5VBnPHqseugxE1aTvyEO?=
 =?us-ascii?Q?8wGKecLmnmw9sHOxFAsn1ndoztO/XIAlcV292A+Xbwip8EdzWFXcF2wmU4Ad?=
 =?us-ascii?Q?qqtcLv/LHUN+04AtxubGIBv3B/zDhm103/a0bjZB8SoV627JHkDUukPd3lAl?=
 =?us-ascii?Q?slvE6uC6gn8SI9wYlY7POAaZxGEVA5v+gMLLWDa5Sy6gMA1ZOxgfPMkPPgaW?=
 =?us-ascii?Q?Gd4DwYO3Y68pghxYQXD6I4FtqHvrbfhkzsFwiIMu2jCh8Xld7RiWaqSb/xQ8?=
 =?us-ascii?Q?i5ASWbHu5D1536ns3hIaDbk5fG0zM5jK/oMdsb50ktjIzSoDhPANCwVLN5Fs?=
 =?us-ascii?Q?WpsjMb9oO/O12s5xO6vsGswsSrLrRxZYel3CIOfNVOQaqYzracsCb3yzRcGK?=
 =?us-ascii?Q?fZSjS8nNrc/D8zJ/G4wj6Q/LLvg9iU5fIJ+Xzna879NRn9PcCT774bC2RFdn?=
 =?us-ascii?Q?CQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 08ef5046-6cd9-48b2-de32-08dda83150a4
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2025 15:13:11.7529 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zEqu1Q2YedwH5GE0tHbjtLeBtwiGCvKdQuQEk3S9wiPxpK6mkNDvBnSRblSOTmTOMPsDYuynJpGsMaMJqyrOACkGTFJ40VdU564uK1fL5Ag=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5142
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

On Tue, Jun 10, 2025 at 06:49:01AM -0700, Bhadane, Dnyaneshwar wrote:
> 
> 
> > -----Original Message-----
> > From: Roper, Matthew D <matthew.d.roper@intel.com>
> > Sent: Monday, June 9, 2025 8:35 PM
> > To: Bhadane, Dnyaneshwar <dnyaneshwar.bhadane@intel.com>
> > Cc: intel-xe@lists.freedesktop.org
> > Subject: Re: [PATCH 8/9] drm/i915/wcl: C10 phy connected to port A and B
> > 
> > On Sat, Jun 07, 2025 at 01:21:03AM +0530, Dnyaneshwar Bhadane wrote:
> > > WCL added a c10 phy connected to port B. PTL code is currently
> > > restricting c10 to phy_a only.
> > 
> > This seems like it's a characteristic of the platform rather than the IP itself.  We
> > should probably go ahead and break WCL out into its own display platform that
> > we can match against rather than assuming WCL only uses display 30.02 and
> > vice-versa.  Or maybe we can just update the existing PTL condition if this
> > function would never be called on PTL with a non-existent PHY B?
> Hi Matt, 
> 1. We could add the WCL as display platform. But for now, there is not much reason to add the WCL display platform define for single instance. Thoughts ?
> 
> 2. We could not extend the condition directly with display->platform.pantherlake && phy < PHY_C as it will wrongly select the c10 PHY type for the PTL itself.

What do you mean here?  If there's no PHY B at all on PTL (based on
72571), then this function should never get called with phy == PHY_B,
right?

> 	
> 	But can be done
> 		 if ((display->platform.pantherlake && phy == PHY_A) ||
> 		 ((DISPLAY_VERx100(display) == 3002) && phy == PHY_B) )
> 			return true;

The PHY types are a characteristic of the platform, not the display IP.
So we want to try to avoid using DISPLAY_VER checks since then we'd do
the wrong thing if this IP gets re-used on a platform with different PHY
configuration, or if other WCL SKUs show up at some point with a display
IP other than 30.02.


Matt

> 
> Dnyaneshwar, 
> > 
> > 
> > Matt
> > 
> > >
> > > Signed-off-by: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
> > > ---
> > >  drivers/gpu/drm/i915/display/intel_cx0_phy.c | 3 +++
> > >  1 file changed, 3 insertions(+)
> > >
> > > diff --git a/drivers/gpu/drm/i915/display/intel_cx0_phy.c
> > > b/drivers/gpu/drm/i915/display/intel_cx0_phy.c
> > > index 75caccb65513..59eee0edef79 100644
> > > --- a/drivers/gpu/drm/i915/display/intel_cx0_phy.c
> > > +++ b/drivers/gpu/drm/i915/display/intel_cx0_phy.c
> > > @@ -40,6 +40,9 @@ bool intel_encoder_is_c10phy(struct intel_encoder
> > *encoder)
> > >  	struct intel_display *display = to_intel_display(encoder);
> > >  	enum phy phy = intel_encoder_to_phy(encoder);
> > >
> > > +	if ((DISPLAY_VERx100(display) == 3002) && phy < PHY_C)
> > > +		return true;
> > > +
> > >  	if (display->platform.pantherlake && phy == PHY_A)
> > >  		return true;
> > >
> > > --
> > > 2.34.1
> > >
> > 
> > --
> > Matt Roper
> > Graphics Software Engineer
> > Linux GPU Platform Enablement
> > Intel Corporation

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
