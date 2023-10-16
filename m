Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75F12CDB465
	for <intel-xe@archiver.kernel.org>; Mon, 16 Oct 2023 18:09:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2641E10E239;
	Mon, 16 Oct 2023 18:09:15 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5590A10E239
 for <intel-xe@lists.freedesktop.org>; Mon, 16 Oct 2023 18:09:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697479753; x=1729015753;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=lLc7zynWI0YOC3Aul0olfH3jqfIcSJutjfW8gNgjsgE=;
 b=JVbICYkjqgk8F61m3Sth9/sty65FGH3O5D4ZPfbXlx6Ozzdmj+r7mhoS
 IVwOdIlVntEAsgD7eTA6o2DviMqCrSV8FTj8wdMotIELL1fi+enre7IvL
 Bhm5tcenC/td+SQy4RTIKp5aSV6PV8U9gIM7GnznMlyexZO+cZG/mY6V3
 aeOZW6VVN7PHKvz37YDuB54qPcASZu7g2b1OVRPJejunhhpfowXHPGQfZ
 IpopskluUtWdkC+0gnl201Dhb3ZzmejIXLAUT0NhdSy1KVGEwiGJq672E
 dD1LCPDSgd4yGtlGWcXjntwO000JYRDv94w2hFC9KciK0cY8p2MrPBW4f A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10865"; a="416673632"
X-IronPort-AV: E=Sophos;i="6.03,229,1694761200"; d="scan'208";a="416673632"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2023 11:09:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10865"; a="705705638"
X-IronPort-AV: E=Sophos;i="6.03,229,1694761200"; d="scan'208";a="705705638"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 Oct 2023 11:09:12 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Mon, 16 Oct 2023 11:09:12 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Mon, 16 Oct 2023 11:09:12 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Mon, 16 Oct 2023 11:09:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AYQXDNAb6/KEQBOPsed/pG54cq06a+sUDA2GPNJ+vPiu87EoZExZrAU6Rksbo2XmRqH+p7zPVu5mx/yb30knTXbvlotQTgvfP4W9pL8B29oTH3Tb9leKHpSgYn9g4RaE8/XvtqgKgDr5yXjt53OEwu6OIMgNMi117p0uvr9KzJvapZlhkaY3HouizXNSFYuSQMi60t1vcwLtyQSYZXL/QUlJV4ckeXdrVuKfWfKKy7ACeFTDtWhoWXM0J35OFrIqorfzXEwZSFAvLawlOA556tuRr2F3UHVMn/FNtd17/e2E/rn0ThzP2FbKi8olM2ahYDXePwGJZKFXkhhtzzKiVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pfxR2VX72JEcxs4Oes4WZ0Bvs5Neot1+Dl5aDOQJHEI=;
 b=jPG88ZApu6o9yiAwijnpzOq10eSdGj8/Z8gF65Uw0YdyFS6Cj4WKGYybZXcOribev6R4wRf7n6fnW6mUX6lk2x51e7yM4Frchs8aYlxWmH8LQbW+MUuxnVtvM2tl4pfIERT9knBwg4KK0BSHngnGNeXDbntv2CAfKdJYhIkU1wuaUpEW0p3wYkD5xT8HTKVBwtCo9spMU9rtt0FKW6vZD1DKRmwLtXzdCrdDa1RpwCzV2c9IkS/6YD//THWAevs39yzPTpbs10hG6qS7dv0+iCIM4IR3NDrfDwaMy8BFAjoKlJswDGbxE8rditq0WPNka/QWcW/R+tgOd7Q3kwu5rA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by DM4PR11MB6094.namprd11.prod.outlook.com (2603:10b6:8:ab::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.35; Mon, 16 Oct
 2023 18:09:09 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593%7]) with mapi id 15.20.6886.034; Mon, 16 Oct 2023
 18:09:09 +0000
Date: Mon, 16 Oct 2023 14:09:05 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Luca Coelho <luca@coelho.fi>
Message-ID: <ZS18QYFnoxZBRAtl@intel.com>
References: <20230522221527.2181802-1-rodrigo.vivi@intel.com>
 <20230523032805.GB6250@mdroper-desk1.amr.corp.intel.com>
 <ZGzGJYuTAUpfeXe5@DUT025-TGLU.fm.intel.com>
 <20230523163849.GD6250@mdroper-desk1.amr.corp.intel.com>
 <ZG1Rwd2k6oDdiHHT@DUT025-TGLU.fm.intel.com>
 <8de90ac856b0caf3d0bd82717769e9f6fe1687a0.camel@coelho.fi>
 <ZSRtavVCM2lqbV5y@intel.com>
 <f8c1a6a39300f01b6affc5ecee7b4486dbcb6baa.camel@coelho.fi>
 <ZShRTTLRD7ltDGSS@intel.com>
 <f352c534f049f7068cef667b4faa88d7cca9b8fd.camel@coelho.fi>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f352c534f049f7068cef667b4faa88d7cca9b8fd.camel@coelho.fi>
X-ClientProxiedBy: SJ2PR07CA0013.namprd07.prod.outlook.com
 (2603:10b6:a03:505::15) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|DM4PR11MB6094:EE_
X-MS-Office365-Filtering-Correlation-Id: 0ae3f5f6-a8fd-478b-c7c1-08dbce72fe2b
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: j4ItWdIhKAIJr1xdqTZUwxiKteG3segLYBdQSecQ0bH2jtxQ7uhEASUD0joIlHLJ305SpQEHhFY/8tbpjOzva4z1vBjrzEhY2av2NMwhiy4W3kJelU7uJxFoYpaJgILyzLU0wnVJhlTB0bNf3IlhJh5p+Lt9wgU4duJtGlABZnJSt5U9GQFdhsCQJnSqQl+TRlgduVASUyu5lN2xmohMrxiqlT8WG0xLdG2iNjZpZwToGXDy+k7WVONAdvfQDvvu9llHb076dIGcIVoiysH4r+w6pr3k0CX7+phc5IvYd5V3npIA4o+6arTrfZqEBzlfUtAXFS2LETjm0vYTtLIfIaa7QwYdJv2243Kq5UgjFVqUg9605jVBYeT+UV9uytteLC4jqGlpN9ThU4QusQooYaTz7hcwS+HNaP4NvZqn99lBv0kPdfyD5nBNkmj8KjY0jRi+Tix0kmdOXoUmFG2vqE48UO4OMLCr7zXjBWctpW/ivZYPo7WOuOolK7P850MR4Nw4rvNoPFp2U0C7LOkiLbNRVl4besUnUhK+Gypt7sJQw9NqPxBpSDOnqLCswdvJ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(39860400002)(376002)(366004)(346002)(136003)(230922051799003)(186009)(1800799009)(64100799003)(451199024)(83380400001)(66574015)(2616005)(26005)(5660300002)(41300700001)(4326008)(8676002)(8936002)(44832011)(30864003)(36756003)(86362001)(6486002)(82960400001)(2906002)(4001150100001)(478600001)(316002)(54906003)(66946007)(6916009)(66556008)(66476007)(6506007)(6512007)(6666004)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d2NxUFVHSFN1Q3h2VmpoZ094TXBhWndoUEU2NktPc2U3ak1UZ3Z5NS85V1N6?=
 =?utf-8?B?T29wTlU2UndNZkIvS3VZNHZpNXNXc0lEdXY0andEdVFNeGhiNCtuNUkwQWND?=
 =?utf-8?B?UW9udUNFb0YrK2owcVljaHlyc1RTaVd1ZW5nU3QveXRWaVhCb1lRRkVoYUxv?=
 =?utf-8?B?UTZ2UWhRaC81TE1FOUNFMXUydEJTNXJTWGlmSkdSeTJxMkRQc3M4RU1nNUxu?=
 =?utf-8?B?amZMTG5HS2hpanlZaHIxNUl3bkN1L3J3Rnh3WWIxWHZOVS9RVktITlgvb1Fw?=
 =?utf-8?B?VjVCM0loTkZqME5rcTFuR0l2d1hpcE1YNlNKRFFLb0ZJS1kyRDhJSm5Wbita?=
 =?utf-8?B?NHdBT2hpTFBuWmJSdTk2VUxQWTVmQzRHZzhNOUFDaWtxdk53K2htQWViK0RQ?=
 =?utf-8?B?aHdyb3FSZlViblZXUkFLR2poYVNKZHZWd3NldlozWFNONkU2V2JTeXJIY2pv?=
 =?utf-8?B?c3RHL1czMGFyYVl6UGEyb05SNmEyNGc3b3h2VXNKTmJ2MXFhNHhaYmE2RU1a?=
 =?utf-8?B?MUliYzY2MVVnV3FocTdmME8vNVc0cDR5ZUlMWEhDSHRLM2NnWVRGT2plQzhP?=
 =?utf-8?B?R0t3K2VqSHRiNTJLbk9xRFl0a2hZamh4OVFmNUZTdUVPaGs0cWE5cGdBeXBV?=
 =?utf-8?B?WnlTdmpReTFBUXRwako3eDZDczVwV0NOMzV3dUpJMEZBNXV4YnhZTjlaQTJl?=
 =?utf-8?B?ZnQ4ZkZrZDlXVWNYQWVVNjR6MlRwb0RiUUNTQlBJL01xNGJTN3RhYm5lV0pJ?=
 =?utf-8?B?aHRib095aWlVODBJK2t0QVNqbjlJS0l0a2NoeDF0QnlwWUhvblZCL2kyQVMy?=
 =?utf-8?B?SXFsQk9FaXNWSHJlMzgyQkdPa2VHdm0vT0JySDFyRWFMZzVtS3NFdHpydllj?=
 =?utf-8?B?U3ljSUdyajNsUzVPZGJzNlNwam1sMWlMRUxPYTl4UUU5aDZzRjlNTTdXUWYv?=
 =?utf-8?B?UjhJRlVVdVpCd3hPSGUzaEhSdHhzRURKamJGa2EwcG5qcERvMm5tWGRqOTlY?=
 =?utf-8?B?bkNxZWlGcEFjK1hHTVQ0T21oWlAxMUNzQjZPL0JkY1ZVczZpeXoyUmI3VzVU?=
 =?utf-8?B?VDk5RzRPNWtTTlliSDNhNVgxMGNUN1JUUjZ5UHIwTFFJWDF3UGFhUWlKKy8w?=
 =?utf-8?B?Q0RQKzRlSEdlL2JQM0JRVFBMYnVlRmNUVktEQXJxN2VLWlQ1cFBsMWU3V3M3?=
 =?utf-8?B?MktGWFJ1MTFSTTdjT051cTZUWjhuRzI2WFVFeW1jYWFsVHoxUnc0QmQrQTVC?=
 =?utf-8?B?b3U1aUYvTW5SYU5jdnkyS01wMFF5T0xhV0YvNVR5eEFrOXd1ZWJ2NjFYVTB0?=
 =?utf-8?B?OVJ3RDdXeW9TZzNLZkR6Z0p2NkNhU0MycGhMUFFWZ2RnMk9Fd0JDM09wYnYw?=
 =?utf-8?B?aExPRHp5c1Z2L1dSayswSTNYeFVDd1JvT2RqRzJJUHJBRDVVNFZqNmIwQUJz?=
 =?utf-8?B?akY3dkZBNWZkeGNVejBQTmdLWVhLdzBZWmR1SE1iRHdQVi92R0ltaFJ1eFlF?=
 =?utf-8?B?T0RWZkFPZU9YYmtzOGp5SDNRNlIwQmdtWkxhd0dwMGpxWEF6dnc3VWVXZ2Q1?=
 =?utf-8?B?Wk9KdkZ5Rm56c1pmcnJTWnlqVjB3K1lrdVgwcG4vTFIrbkQxenFhclFLZWJ0?=
 =?utf-8?B?YnJCQTNJblh6QytkMEZ3dk02c0FXemZTcWNJRGtKSWdMd21DUGViZEh6TFdh?=
 =?utf-8?B?OHlQOFNwaExDa0tSK0txdXdtdHdyNlhuaERUOVhsVDJ1OVhDNEY1RjladHU0?=
 =?utf-8?B?UFZDbHFselNRRjJud1JydzBGeW9Oajd6VGo5UXo3dXE4Z2ZtcUk0bERwR3Y0?=
 =?utf-8?B?cHVYR2wwYjFoNk5hSjVwSG1lb1lGYnlwbU1ZbVloWlgrQ0Q5Y3hSQzA3SUZF?=
 =?utf-8?B?cXQ4TXk2NWdOVitGYStoYjFBY3RkRmwwV0hML0YrSTV4VVBCZGIzUmMycmgy?=
 =?utf-8?B?YTN3dnJ1VkRDMTVKdHpmYjBmV2U3LytEdEVML3V2QUh3Rit1ZUYxS1VaTFNQ?=
 =?utf-8?B?eDJiclg0emdHY1RTUmNHMXdPQXM5K2RtMUFiZkRRR3dRZUtYUnNTcm9RNTA3?=
 =?utf-8?B?d2NleDFOcStNa0NuTjc1RUZWOWh6WkRzdU9nTVpUTXVad3NkV0xkTTU2WmRB?=
 =?utf-8?Q?UQETX2kNCaIRlaOHtpMGapWS1?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ae3f5f6-a8fd-478b-c7c1-08dbce72fe2b
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2023 18:09:09.5456 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8574oIczJGCppWZBGXGhiqCkoc0pb59v5U2cFmwM5VJbeVdVep+z6/tHvSjx19GHakYKoOYbjwWZ3ZVbjVrslQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6094
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [RFC] drm/xe: A minimal assert for some forcewake
 domain on xe_mmio.
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
Cc: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@intel.com>,
 Jani Nikula <jani.nikula@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Matthew Auld <matthew.auld@intel.com>, Matt Roper <matthew.d.roper@intel.com>,
 intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Mon, Oct 16, 2023 at 01:22:32PM +0300, Luca Coelho wrote:
> On Thu, 2023-10-12 at 16:04 -0400, Rodrigo Vivi wrote:
> > On Tue, Oct 10, 2023 at 10:00:06AM +0300, Luca Coelho wrote:
> > > On Mon, 2023-10-09 at 17:15 -0400, Rodrigo Vivi wrote:
> > > > On Mon, Oct 09, 2023 at 12:22:44PM +0300, Luca Coelho wrote:
> > > > > Hi everyone,
> > > > > 
> > > > > On Tue, 2023-05-23 at 23:52 +0000, Matthew Brost wrote:
> > > > > > On Tue, May 23, 2023 at 09:38:49AM -0700, Matt Roper wrote:
> > > > > > > On Tue, May 23, 2023 at 01:56:53PM +0000, Matthew Brost wrote:
> > > > > > > > On Mon, May 22, 2023 at 08:28:05PM -0700, Matt Roper wrote:
> > > > > > > > > On Mon, May 22, 2023 at 06:15:27PM -0400, Rodrigo Vivi wrote:
> > > > > > > > > > It is the maximum protection we can do with the current infrastructure.
> > > > > > > > > > 
> > > > > > > > > > Cc: John Harrison <John.C.Harrison@Intel.com>
> > > > > > > > > > Cc: Matthew Auld <matthew.auld@intel.com>
> > > > > > > > > > Cc: Francois Dugast <francois.dugast@intel.com>
> > > > > > > > > > Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> > > > > > > > > > Cc: Jani Nikula <jani.nikula@intel.com>
> > > > > > > > > > Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
> > > > > > > > > > Cc: Matt Roper <matthew.d.roper@intel.com>
> > > > > > > > > > Cc: Matthew Brost <matthew.brost@intel.com>
> > > > > > > > > > Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> > > > > > > > > > Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > > > > > > > > > ---
> > > > > > > > > > 
> > > > > > > > > > 
> > > > > > > > > > RFC
> > > > > > > > > > ===
> > > > > > > > > > 
> > > > > > > > > > Okay, so, this is more an RFC to brainstorm the future of the force_wake in
> > > > > > > > > > Xe than anything else.
> > > > > > > > > > 
> > > > > > > > > > On i915 the force_wake is built-in the mmio functions at uncore component.
> > > > > > > > > > 
> > > > > > > > > > With that approach we had few historical issues iirc:
> > > > > > > > > > 
> > > > > > > > > > 1. Display performance with vblank evasion that requested uncore to provide
> > > > > > > > > > the 'fw' variantes that are actually the ones that avoid fw (contrary to what
> > > > > > > > > > the name suggests).
> > > > > > > > > 
> > > > > > > > > In i915 there were more differences between fw and non-fw variants
> > > > > > > > > of register functions than just forcewake handling:
> > > > > > > > > 
> > > > > > > > >  * _fw() functions assumed that the caller was already holding
> > > > > > > > >    forcewake, whereas the non-fw functions would obtain it themselves
> > > > > > > > >  * _fw() functions also assumed that the caller was already holding
> > > > > > > > >    uncore->lock, whereas the non-fw functions would obtain and release
> > > > > > > > >    the lock around each register access
> > > > > > > > >  * _fw() functions do no tracing and no debug assertions
> > > > > > > > >  * _fw() functions do not check for unclaimed MMIO
> > > > > > > > > 
> > > > > > > > > I don't think the first bullet there (forcewake) really mattered much
> > > > > > > > > from a performance perspective.  For display registers, a quick binary
> > > > > > > > > search of the FW table (just a handful of CPU cycles) would quickly
> > > > > > > > > determine that no forcewake domains were needed for those register
> > > > > > > > > offsets, so we wouldn't be doing anything with forcewake at the hardware
> > > > > > > > > level at all.  For display registers, the more performance-relevant
> > > > > > > > > aspects of using the _fw() functions was doing all your register
> > > > > > > > > accesses together without contention with other MMIO work.  I.e.,
> > > > > > > > > holding the uncore lock over an entire set of registers rather than
> > > > > > > > > grabbing/releasing it for each one, and (for vblank evasion
> > > > > > > > > specifically) doing it all while interrupts were disabled.  For debug
> > > > > > > > > drivers, there was also a bunch of other stuff that the _fw() functions
> > > > > > > > > bypassed (e.g., tripling of the number of register accesses due to
> > > > > > > > > reading FPGA_DBG before/after each register to look for unclaimed
> > > > > > > > > accesses).
> > > > > > > > > 
> > > > > > > > > > 
> > > > > > > > > > 2. Missed ranges updates. Sometimes we messed up with the ranges, there were
> > > > > > > > > > other times that the spec was updated and we didn't get the notification, and
> > > > > > > > > > there were cases that the BSpec had bugs.
> > > > > > > > > > 
> > > > > > > > > > For these reasons in Xe we have decided to let to the caller the
> > > > > > > > > > responsibility to set the force_wake bits for their domains before doing
> > > > > > > > > > the MMIO.
> > > > > > > > > 
> > > > > > > > > I don't think #2 was a reason to skip forcewake in Xe.  Not noticing a
> > > > > > > > > bspec update (or the bspec itself having incorrect information) would
> > > > > > > > > lead to even more mistakes if the caller has to explicitly grab the
> > > > > > > > > appropriate domains than if the driver does it implicitly.  The explicit
> > > > > > > > > handling only helps in the subset of cases where we blindly grab all of
> > > > > > > > > the domains (as we do during part of init).
> > > > > > > > > 
> > > > > > > > > 
> > > > > > > > 
> > > > > > > > MMIO access that requires forcewakes really only should be in a few
> > > > > > > > places, off the top of my head:
> > > > > > > > 
> > > > > > > > 1. Init
> > > > > > > > 2. Reset
> > > > > > > > 3. Sysfs / Debugfs
> > > > > > > > 
> > > > > > > > In all of these cases I think it fine to blindly grab all forcewakes.
> > > > > > > > 
> > > > > > > > Please chime in if I'm missing something.
> > > > > > > 
> > > > > > > I think as we implement more features in the Xe driver we're going to
> > > > > > > wind up with a lot more places where we need to access GT registers at
> > > > > > > runtime.  A few examples off the top of my head:
> > > > > > > 
> > > > > > >  * EU stall sampling
> > > > > > >  * Perf/OA
> > > > > > >  * EU debugger
> > > > > > >  * Various OOB workarounds that ask us to twiddle a register at certain
> > > > > > >    times in the driver.
> > > > > > 
> > > > > > Hmm, ok a lot of these I could make the argument that these are not
> > > > > > normal operation so just grab everything and call it a day. If some of
> > > > > > these fall into the category of 'normal enough to be optimized' I can
> > > > > > also make the argument it is no more complex (perhaps less complex) to
> > > > > > explicitly grab the forcewake than having the logic auto-grab the
> > > > > > forcewake.
> > > > > > 
> > > > > > What a compromise of in a debug mode we auto-generate the asserts based
> > > > > > on a table but we still explicitly grab the forcewake?
> > > > > > 
> > > > > > > 
> > > > > > > > 
> > > > > > > > > > 
> > > > > > > > > > However I'm seeing many questions and doubts popping up:
> > > > > > > > > > 
> > > > > > > > > > 1. Are we confident that we are not missing any wake-up?
> > > > > > > > > > 2. Are we confident that the domains are set correctly?
> > > > > > > > > > 3. Are we not wasting power if we are waking up ALL the domains instead
> > > > > > > > > >    of some specific one?
> > > > > > > > > 
> > > > > > > > > I think we're only holding ALL domains during init; for most of the
> > > > > > > > > runtime MMIO accesses, I think the code is currently attempting to only
> > > > > > > > > grab the domain(s) that it thinks the registers it's accessing will
> > > > > > > > > need.  Although that might be working right now, I'm a little bit
> > > > > > > > > worried about how that will scale in the long term when a single
> > > > > > > > > register might be in several different domains depending on what
> > > > > > > > > platform you're running on.  There have definitely been cases in the
> > > > > > > > > past where groups of registers migrated from RENDER to GT or vice versa
> > > > > > > > > between platforms, so the exact domain you needed for an operation
> > > > > > > > > varied by platform.  And things are even more complicated if you're
> > > > > > > > > doing any MMIO against the media, since the hardware seems to change
> > > > > > > > > exactly how it splits up the media power wells somewhat often.
> > > > > > > > > 
> > > > > > > > > > 4. What about the display disconnection now because i915 and xe have different
> > > > > > > > > >    mmio approaches but reusing i915-display?
> > > > > > > > > > 
> > > > > > > > > > It looks to me that the cons of the current approach are superseding the
> > > > > > > > > > cons of the i915 approach. But I want to hear more thoughts here before
> > > > > > > > > > we decide which route to take.
> > > > > > > > > > 
> > > > > > > > > > Maybe we have that domain as part of the mmio calls themselves? Maybe
> > > > > > > > > > a double approach where the caller is responsible but mmio has the range
> > > > > > > > > > information and double check it?
> > > > > > > > > 
> > > > > > > > > As noted above, part of the challenge with forcewake is that even if the
> > > > > > > > > caller knows it wants to access register FOO, and even if it know FOO is
> > > > > > > > > a GT register that likely needs forcewake, it's sometimes challenging to
> > > > > > > > > make sure it's grabbing the correct domain(s) for every single platform
> > > > > > > > > the Xe driver will eventually support if the power management handling
> > > > > > > > > changes.  I think that was part of the motivation for encoding the
> > > > > > > > > tables into the driver in i915.  It seems like GT power wells don't
> > > > > > > > > change as much these days as they used to, but it's hard to say whether
> > > > > > > > > that will continue in the future or not.  Who knows...maybe they'll
> > > > > > > > > eventually start creating dedicated domains for stuff like blitters,
> > > > > > > > > GuC, etc.  rather than lumping all of those into the "GT" catchall
> > > > > > > > > domain.
> > > > > > > > > 
> > > > > > > > > If we do decide to go back to implicit forcewake handling with the table
> > > > > > > > > encoded into the driver, it might be worth doing something sort of like
> > > > > > > > 
> > > > > > > > Let's not do this intel_uncore.c is an unreadable mess, I don't want
> > > > > > > > anything like this in Xe.
> > > > > > > 
> > > > > > > When you say unreadable, are you referring to the macros that generate
> > > > > > > the table lookup functions?  I don't think that macro magic would be
> > > > > > > needed for Xe since we don't have to support old platforms that have
> > > > > > > very different forcewake behavior, and we also don't need to generate
> > > > > > > separate 8-bit, 16-bit, and 32-bit versions of each operation anymore
> > > > > > > (since I think everything in the GT is 32-bits these days).
> > > > > > > 
> > > > > > 
> > > > > > Just the entire file is unreadable in general, trying to avoid these
> > > > > > types of files in Xe, avoid traps of the i915 did this so let's do it in
> > > > > > Xe, and over engineering our driver to avoid hypothetical future bugs.
> > > > > > 
> > > > > > Matt
> > > > > > 
> > > > > > > The forcewake and shadow tables themselves are pretty clean in i915
> > > > > > > these days, and if we move to autogenerating them from a text file, they
> > > > > > > can become even simpler since the text file will basically be a cleaned
> > > > > > > up copy/paste of part of the bspec table.
> > > > > > > 
> > > > > > > 
> > > > > > > Matt
> > > > > > > 
> > > > > > > > 
> > > > > > > > > what Lucas is doing in the OOB workaround series --- drop the
> > > > > > > > > per-platform tables into a human-readable text file that's more similar
> > > > > > > > > to the format used by the bspec (exact ranges, forcewake domain, MCR
> > > > > > > > > replication type, etc.) and then provide a small parser program that
> > > > > > > > > will convert that into actual code (and do things like consolidating
> > > > > > > > > adjacent ranges).
> > > > > > > > > 
> > > > > > > > > > 
> > > > > > > > > > Any other idea? Thoughts?
> > > > > > > > > 
> > > > > > > > > Once the big GT vs tile refactor stuff I have in flight gets finalized,
> > > > > > > > > I plan to follow up with another series that creates a more appropriate
> > > > > > > > > MMIO target for register operations rather than using "xe_gt" as the
> > > > > > > > > target (even for things completely unrelated to the small GT subset of
> > > > > > > > > hardware).  My idea is that you'd grab an MMIO target structure for MMIO
> > > > > > > > > operations against a specific hardware unit, and then the info inside
> > > > > > > > > the MMIO structure would be able to figure out if there are additional
> > > > > > > > > checks and/or operations it should perform.  E.g.,
> > > > > > > > > 
> > > > > > > > >  * mmio = xe_mmio_for_device(xe_device *xe);
> > > > > > > > >     - Used to submit MMIO operations against the root tile of the PCI
> > > > > > > > >       device.  Only used during init (e.g., to read the registers that
> > > > > > > > >       tell us which tiles exist on the platform) and during top-level
> > > > > > > > >       interrupt enable/disable (since all interrupts are routed through
> > > > > > > > >       the root tile).
> > > > > > > > >     - No forcewake needed for register accesses through a handle of this
> > > > > > > > >       type since you'd only ever be accessing sgunit registers for these
> > > > > > > > >       types of things.
> > > > > > > > >     - Register accesses through mmio can warn on debug builds if the
> > > > > > > > >       register appears to be in a GT-related MMIO range.
> > > > > > > > > 
> > > > > > > > >  * mmio = xe_mmio_for_display(xe_device *xe);
> > > > > > > > >     - Pretty much the same as handles returned by xe_mmio_for_device(),
> > > > > > > > >       but if a handle of this type is used to try to read/write
> > > > > > > > >       registers outside the display range, we could have debug builds
> > > > > > > > >       throw some extra warnings.
> > > > > > > > >     - Unclaimed register detection could be confined to accesses through
> > > > > > > > >       these handles.
> > > > > > > > > 
> > > > > > > > >  * mmio = xe_mmio_for_tile(xe_tile *tile);
> > > > > > > > >     - Used to access non-GT registers that reside in a specific tile.
> > > > > > > > >       I.e., sgunit/soc registers.
> > > > > > > > >     - As above, no forcewake needed, can make MMIO operations warn
> > > > > > > > >       if used to access a GT range.
> > > > > > > > > 
> > > > > > > > >  * mmio = xe_mmio_for_gt(xe_gt *gt);
> > > > > > > > >     - Used to access GT registers in a specific GT
> > > > > > > > >     - Does automatic GSI offset translation for media GTs
> > > > > > > > >     - Can either do automatic forcewake like i915 does, or can do debug
> > > > > > > > >       check+warn like you have here.
> > > > > > > > >     - Can make MMIO operations warn if MMIO offset is outside GT range
> > > > > > > > >     - Can also trigger warnings if a GT non-GSI, non-media engine
> > > > > > > > >       register is accessed from an MMIO obtained from a media GT.
> > > > > > > > > 
> > > > > > > > 
> > > > > > > > Ack on this if we keep in managable, worried code / feature bloat those
> > > > > > > > that will result in a similar file to intel_uncore.c in Xe.
> > > > > 
> > > > > Just to revive this thread.
> > > > > 
> > > > > I've been discussing this proposal in the context of a change we need
> > > > > to make in the display, which is to introduce a wakelock for some
> > > > > registers access in order to be able to remove the DMC trap.
> > > > > 
> > > > > We came to the conclusion that this new implementation is very much the
> > > > > same as the forcewake proposal here.  From the display point-of-view,
> > > > > we could simply have a new domain and range of registers to protect.
> > > > > 
> > > > > We _could_ implement a separate "wakelock" mechanism for the display
> > > > > part, but that would be mostly duplicating the entire forcewake
> > > > > implementation.
> > > > > 
> > > > > So, are there any plans to implement the current proposal? Or any other
> > > > > plans related to the forcewake implementation for Xe? As I see it, the
> > > > > "wakelock" implementation in the display depends on this.
> > > > > 
> > > > > Any thoughts?
> > > > 
> > > > Hi Luca, thanks for raising this again here.
> > > 
> > > Hi Lucas! Thanks for your comments.
> > > 
> > > 
> > > > So, as I said in the past, I don't have strong opinions regarding the
> > > > overall forcewake approach.
> > > > 
> > > > The since GT MMIO is not used very frequently, I don't see a problem of
> > > > leaving that up to the caller to take the right domain when needed, or even
> > > > the FORCEWAKE_ALL domain. Instead of forcing all the callers to
> > > > go through this extra steps and then have to opt-out with the '_fw' [sic]
> > > > alternatives for the cases where the forcewake cannot be checked underneath.
> > > > 
> > > > So, for the new display wakelocks, that's the problem of adding them to
> > > > the drivers/gpu/drm/xe/compat-i915-headers/intel_uncore.h where the converions
> > > > from i915's intel uncore are happening to xe_mmio? So, when using the
> > > > intel_uncore's '_fw' variant you skip the wakelock and when doing the regular
> > > > mmio calls you just add a wakelock_get/put around the xe_mmio call with
> > > > the display domain. And in i915 you implement inside the intel_uncore.
> > > > 
> > > > What's the downside of this approach?
> > > 
> > > That's more or less what I was thinking.  I don't think there's any
> > > problem on the display side in calling the same framework.
> > > 
> > > 
> > > > Trying to understand all the pros and cons of different approaches, and
> > > > bringing some people to the discussion.
> > > > 
> > > > If we implement the forwareke underneath the mmio call, display needs
> > > > to anyway implement it twice on the i915's intel_uncore and on the
> > > > xe_forcewake, no?!
> > > 
> > > Yes, IMHO we should start making Xe the base implementation and
> > > backporting the new implementation into i915.
> > > 
> > > So,for this specific case, I think we can just make i915 call the new
> > > functions in xe and have them backported in intel_uncore.h for i915.
> > > 
> > > What I was thinking was basically this:
> > > 
> > > 1. Implement the xe_mmio_for_<hw_unit>() proposal in Xe​
> > 
> > hmm probably a new component then?! xe_display_wakelock that
> > implements and export the get/put domain in a similar way
> > of xe_forcewake, and then on the wrapper you add the get/put
> > around the existing xe_mmio calls?!
> 
> Yes, I guess a new component, but part of Xe.  I don't exactly know
> what you mean with "xe_forcewake", but it's the same as Matt proposed
> with the different functions for different domains.  These functions
> would do everything that is needed for the specific domain, such as
> keeping it awake, checking if the registers are in the right range etc.
> 
> 
> > > 2. Display code uses new APIs (xe_mmio_for_display ops)​
> > > 
> > > 3. Update uncore to handle "wakelock domain"​
> > 
> > then on uncore you would need to parse the mmio range and then
> > call the get and puts, that in that case would be static inside
> > the uncore itself like the forcewakes ?!
> 
> The callers will use the new Xe APIs, so in i915, the display code (and
> probably GT and others too) will be the same as in Xe. 

I confess a got a bit lost now. What's GT need here? Does GT need this
new wakelock or is it a display only thing?

if it is a display only thing, we have a new xe_display_wakelock component.
The mmio wrappers that translate intel_de mmio calls to xe_mmio would make
usage of the xe_display_wakelock functions. And no body else. no need to
disrupt the working GT code.

But maybe I'm completely misunderstanding what the wakelock is about.

>  I see it as a
> backport.  We can create wrappers that call the uncore APIs to achieve
> the same functionality as before.
> 
> There are things that we may not need to be backported, for instance,
> we don't really need the new wakelock that is needed in LNL (and future
> HW), because i915 may not need to support it.  So we can just make a
> dummy wrapper for this.  And it should still be easy to properly
> backport if needed.
> 
> Do you see any problem with this approach?
> 
> --
> Cheers,
> Luca.
