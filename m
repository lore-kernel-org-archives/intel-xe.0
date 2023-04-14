Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 790EDC77B71
	for <intel-xe@archiver.kernel.org>; Fri, 14 Apr 2023 19:59:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D53610E07D;
	Fri, 14 Apr 2023 19:59:17 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A07710E07D
 for <intel-xe@lists.freedesktop.org>; Fri, 14 Apr 2023 19:59:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681502355; x=1713038355;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=1fYzBiDLxKeERh7Vh1YnmWGBQcKam8CrEWHSWvjXCDY=;
 b=KwkWg3j5yI/41E4nLoESVpYiSB10cZCtE1gi8bnf8x5VRunbJCACb9pf
 jPgjXgIIisUkcv6BuHVGj5UM+GB8HfDMh+8N0r/IMNiYosqyIal80rREd
 pgobcIjBmZgpVyZY6f6jSHa8P2+BOdYGNWkeyGVzjVlVBQm9EtfokEdNi
 ub8xKMYyx0TM6FMzw5qgDgINd8tQwVI3yolrWqLdaSO7xsxsdsjDu9lP+
 8pC/7nnd8MJSRsK5i5H0tfEqRSh6S6P5BA7HRPXQEfWYTPw+JB6yfGfIL
 +a5YLNjRbEik0NXBabXuntm21Z1lFqNRX/oUsowYMNzIy/CKw2Sbt+4YS w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10680"; a="342050316"
X-IronPort-AV: E=Sophos;i="5.99,197,1677571200"; d="scan'208";a="342050316"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2023 12:59:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10680"; a="692540223"
X-IronPort-AV: E=Sophos;i="5.99,197,1677571200"; d="scan'208";a="692540223"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga007.fm.intel.com with ESMTP; 14 Apr 2023 12:59:14 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 14 Apr 2023 12:59:14 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Fri, 14 Apr 2023 12:59:14 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.44) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Fri, 14 Apr 2023 12:59:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iiKpyVUHHXLfDnrh3QNFVSKAbiOE50ws8j5pYZALtssMjTAzX9ZuYw+DdFSDiKowcjFeOzd+DHU6C1Puz6MskGSCF43GvrLJLSntdsbMYP+X73IjAcilbyo63GvMNcDsHXWAQ3jVrvK1pmu3m/shOkGnhu4tGkFagHYHNZ63Ur87/dJR7TRAz2F8bXN3HBsaArSCB5rH/r6QbPgUuWH3naWLxjSfzZvCY9YN0Uq/Er5gkDUkiSOZn1t8A7YuGzE1K/fJmuiVYBOjl22m+U/3Fg36JS7pb0S89vzlz6I9/sc12T4Jj6dOXwY5Q3kbf3KhlpZKKH1+gOv79F8CIpBbsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZTFqcwv0b65/VmL+5rmwAkh7oCh0cbDqMgfrvMClYlM=;
 b=AZV6Lf1uTokFDA2hg2YpdUxxy9zdYTHioIIi8bmSFUocklbNOeWY/NkCfrbuApwZ1xgT1y3bhjlv6R+5cTzk10lSHmo07S5w2AZ5axxYoxvnlWyhD5ekVdNCo5E2UZ4TjxL7W18gZFzz6JqBgfNn5T2NHfmHoS7CTrP/9yD/JCFm00FjyGvkJy/+h7OL+9ZwPhoxk0yN7noNCRwA6E4gFfi3vwZAYWZJ1YYXcqeT8zCOy+1la7vmZbQR5MkNZx2vi4PKzyNqy1Digno+kJwrSR0dqjXG8t1utmjUs4SZN7sv1PJwwODPOSjFeBFzE8g5bccZveAi/7Sv3hGAnqznCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by MW4PR11MB5823.namprd11.prod.outlook.com (2603:10b6:303:186::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.38; Fri, 14 Apr
 2023 19:59:11 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4%3]) with mapi id 15.20.6298.030; Fri, 14 Apr 2023
 19:59:11 +0000
Date: Fri, 14 Apr 2023 12:59:09 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Message-ID: <pgpfezzdbqokqiwme4yjhdtkvfb7yhefh4w6jk4fzv4nqm3n22@x42ziwajb6mn>
References: <20230412225248.3229571-1-matthew.d.roper@intel.com>
 <20230412225248.3229571-4-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230412225248.3229571-4-matthew.d.roper@intel.com>
X-ClientProxiedBy: SJ0PR03CA0211.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::6) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|MW4PR11MB5823:EE_
X-MS-Office365-Filtering-Correlation-Id: 47466c5d-61ff-4953-47c3-08db3d22b709
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Od12KWfWzh73sfDXT0foDCngEJXRmz11jJ3opIQBHTcreDlmOjtcYJVZtQw2qWUvh9l2+4ZYAKD/5nrs4FmChon80uf9Ha+zr4e8rGYpzdgX7AYdsmkE8CD/9/LMamcot2ZsDueopo/AR2ww48vvckCecmxwnCwme4GiFBspsc6zOeuZh0rYblKW1iHxmc4Cc3Gq64N9pqirC4owQXczD+dOl2VB1Xy7NdAhzEV87356uu0nb0WNtz5wVAE2xo6dkXY/nU/y/dS++XetC3HyzNEk3QrkkeMjtuGwDUWX4BmQAFTL2VFIWyDMNAinUaWPpQEGuC4DlBCCqihAEo0lruQgD/qXxnuCuyDv/fuR6vAPVJi4tdMvvzX57/9StWfldRrSjrmeiOjPDQIt3usI3xBMFafIZy3pF0KvveJtvlXP8BtXIozLR5aTWdduJCFSN44tNj1ojxEpyNd8EZf/Yhc/Ta/bIKvfQDZOg693B/R5TiuPGMlmDK1F4J8qEWnMPQ0o6BLROnfnSugbrNbiLloiOqaA4xL7w012jNnWHS0BUkztXDWKZfNeDCc1y392
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(39860400002)(366004)(346002)(396003)(376002)(136003)(451199021)(8936002)(86362001)(6862004)(4326008)(66556008)(33716001)(66946007)(82960400001)(478600001)(38100700002)(66476007)(6486002)(316002)(41300700001)(6636002)(83380400001)(6512007)(186003)(8676002)(2906002)(9686003)(5660300002)(6506007)(26005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?nUYXZBVgb6sRaFE1DmjQrYQF2WRWAScg1+ezrKPOLBU8UpZx/54NtDYDAux6?=
 =?us-ascii?Q?666GQrrKNV6OvbmlNcf0BNhNT2a9yw9InKQpMLUsfvudTPCVuYpUXWMy8msO?=
 =?us-ascii?Q?oOas+RvoWYerxxOK31nu4T5yqWDEMZ+w7bv0mIGaxtye2X03xQ0ANqzTcAlx?=
 =?us-ascii?Q?OdA+nfFZq1h/uZDMtjkkA+JWMj64gkF7vVwgxZDpQhoW4Z/IGWOiI+OPeNBt?=
 =?us-ascii?Q?M33e9u0tU5lYKQVNDYdFG2GdD4qE1gbri0q7wO4vAueaRtfXog1lbOjxsjcM?=
 =?us-ascii?Q?iSDuBKY9I2CJChR7+O4uKiY9mlyQF4vt+NhlvBcWvq1nzFwgXy+xmpbaclgF?=
 =?us-ascii?Q?/LufMLoryZMWg0jKrrKP4G5IfV2oZccF3lp19Z96vaVkapD5bY8FTOVzlZYy?=
 =?us-ascii?Q?xFb9oIjPcUc5KfKu2QFnYsDJyqX6PtVXMtvAQj0CoOLxEDPCCGwIU6XY5ejc?=
 =?us-ascii?Q?Nwap/kgFbOuqu0SHVdVcfoksPuw7UN+vSCTyFVXCuVAX1rZcZMQWA/NjQj15?=
 =?us-ascii?Q?fu6KOlbSVqrx/PQypC7C7DzMaeOxB4nwMfVJvpiUXeGj20XoHmYla7fQTQ7b?=
 =?us-ascii?Q?TlYY9AttwheOl3Es1HRnHAzzA81tVV6lX9yDXjdcNuecv3lCfF/rH4Eh1A1E?=
 =?us-ascii?Q?vKnbVFBfth2NhER9WW7ND3CHP+k6+sM5uXkt6YR8UB7+yC5VN49PLZYD47lE?=
 =?us-ascii?Q?6lH2NFzhI5Jo0omKK2N+Fv2pwJp9IwZjNwEEO2/n1mJB6OBfqUHs1BzENnsZ?=
 =?us-ascii?Q?S2gxzqCap27UPxpPstGrgATh+RXUaSq+eH6cGwdZAFYZYM2sV7JAllUsVwyr?=
 =?us-ascii?Q?+VshG8ADRYdzoCpvQlzQl8lK5qoDSUSkn+UI6rQfeshhEtYIJH7VHFiVtBQR?=
 =?us-ascii?Q?mwx1se/VZsxzoGSFkxvR10uPdZ/cnQroEl7q/ZilqXCtCypZRktiv7669qVf?=
 =?us-ascii?Q?WuJRfE2buW9mGHeYoqVJGp2UTQYI0kfcSMWI/sznNty1Mtxqz3W3v3QrOM7B?=
 =?us-ascii?Q?xkqsV9lvUloChuWJkpKB95uNZ7UKIEPdfrY8rpnHdyVv5MlOLCMk4fwHg6Qv?=
 =?us-ascii?Q?JmNXb3MtfYewaTeQTmNJGAOfIy5zjlWHu+5RvnzfLNv9k18GiAi61GDKxr8A?=
 =?us-ascii?Q?VNMWVkd13ycY8q4B6uShomfLF8aT+EBd9gLPNzrzfbTJOVUcQFL3ZDpM23G3?=
 =?us-ascii?Q?IXj9pMxmEzXpeZ5tHzVILWGA5/yh5Wh5pe+uDIm/lvA5fWbP2kteVyCirww4?=
 =?us-ascii?Q?l4HsCG0cw6vuNtxUtuyj6JULdU/soxEb3CqKSiVjggPBt5yPind5SFWR53nb?=
 =?us-ascii?Q?ECgodyjxLxL7oVSyLdmV3NBE9SdDmDiQ2eGMR8p3PY+7aVD6cl8iHSuMsye8?=
 =?us-ascii?Q?IMNcMjy8sIYssh+2Ysup3klHYiLE4nv5JphJ6cwY+d2VoFMlJGs4JE0Vu4G5?=
 =?us-ascii?Q?Zfxsim+WrZ86F37/lPSA1OWY8/795WxMz0KG9tmIH3+QCqn88YQob9vTjmjt?=
 =?us-ascii?Q?0R5SyLqfR8ci5c7BVSMZwjSpCDnEbgtRCBoIhmhAPC8dVAuKHcDi0og2Z1iJ?=
 =?us-ascii?Q?wDtvuiatoidPh2iweIl8ufAHrRYXaInDwykV2rTRUKRGbR0pPAMaq6HAGoNM?=
 =?us-ascii?Q?kg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 47466c5d-61ff-4953-47c3-08db3d22b709
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2023 19:59:11.4157 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9xuRa20KlUiWV3YP0BuLpum2OedCA8EbrL66qKHhEOJJbhzn349GCqO2pZbWVuntqw4BEBUIodFPaKcbmKfBc0RGGOHZtk9ycEBnWHUuNss=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB5823
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 3/8] drm/xe/irq: Process Gunit interrupts
 in relation to the device
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

On Wed, Apr 12, 2023 at 03:52:43PM -0700, Matt Roper wrote:
>The only Gunit interrupts we handle today are GSE ASLE interrupts, which
>are an old opregion way of doing display backlight notifications.  These
>aren't related to GT at all, and if/when we have a multi-tile platform
>with display in the future, we'll expect such ASLE interrupts to always
>be delivered on the primary tile, the same as other display interrupts.
>
>dg1_irq_handler() is currently passing whatever GT was processed last as
>a parameter to gu_misc_irq_ack(), which isn't what we want.  Switch
>gu_misc_irq_ack() to just take a drm_xe_device as a parameter so that
>its handling isn't tied to the previous GT processing loop and there's
>no ambiguity about what it's doing.

why don't we move it to be inside xe_display_irq_handler()? If we don't
have XE_DISPLAY enabled it doesn't seem like we want to do anything
here.

>
>Signed-off-by: Matt Roper <matthew.d.roper@intel.com>


Anyway, change here also makes sense by itself


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi
