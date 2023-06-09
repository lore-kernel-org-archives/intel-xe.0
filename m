Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39C66C7EE29
	for <intel-xe@archiver.kernel.org>; Fri,  9 Jun 2023 21:23:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF14D10E0CD;
	Fri,  9 Jun 2023 21:23:05 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29B8910E0CD
 for <intel-xe@lists.freedesktop.org>; Fri,  9 Jun 2023 21:23:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686345784; x=1717881784;
 h=message-id:subject:from:to:date:in-reply-to:references:
 content-transfer-encoding:mime-version;
 bh=IHqoaLTBeelef/gxGNVolyqhhM7a6rvALL3nueJEbQo=;
 b=Bspph9YmkGGZqShfIgemi26WMXh+ryOcoBHF4d4K/EAPmz3CcIHhuppM
 HUbJEZlor6uskOfPMO6APCkk0rDjXiB+o9Xdk5/GP8CnGVuD5L+WWDJr/
 PIdeGZbhd8SeplRHcs50/ItXccdN1DPFqGcH4H3xFSqoWxl6qWnPaJu1F
 B/Y+JT3rYNgIVTG9t2XNxeIFJxNfE7mu1q/2iHPmHAcRmshiNOPCstBYq
 qEaD23MbCZUHiKgg1R740EzB3/oCx3UF49a5TsdC40JTQAm/95qJi0Gb4
 CG02IbWRe6LitIWXHflP1+gXEgw4zKnLfCf+fAdoe44LTdt94JblzYCmN w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10736"; a="423570032"
X-IronPort-AV: E=Sophos;i="6.00,230,1681196400"; d="scan'208";a="423570032"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2023 14:23:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10736"; a="660891922"
X-IronPort-AV: E=Sophos;i="6.00,230,1681196400"; d="scan'208";a="660891922"
Received: from uniemimu-mobl1.ger.corp.intel.com (HELO [10.249.254.208])
 ([10.249.254.208])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2023 14:23:01 -0700
Message-ID: <5d37019e7b99c6f0fa052229a825d8dc9a7448e7.camel@linux.intel.com>
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org
Date: Fri, 09 Jun 2023 23:22:59 +0200
In-Reply-To: <20230609182627.143150-4-matthew.brost@intel.com>
References: <20230609182627.143150-1-matthew.brost@intel.com>
 <20230609182627.143150-4-matthew.brost@intel.com>
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
User-Agent: Evolution 3.46.4 (3.46.4-1.fc37) 
MIME-Version: 1.0
Subject: Re: [Intel-xe] [PATCH 3/3] drm/xe: Use Xe ordered workqueue for
 rebind worker
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

T24gRnJpLCAyMDIzLTA2LTA5IGF0IDExOjI2IC0wNzAwLCBNYXR0aGV3IEJyb3N0IHdyb3RlOgo+
IEEgbWl4IG9mIHRoZSBzeXN0ZW0gdW5ib3VuZCB3cSBhbmQgWGUgb3JkZXJlZCB3cSB3YXMgdXNl
ZCBmb3IgdGhlCj4gcmViaW5kLCBvbmx5IHVzZSB0aGUgWGUgb3JkZXJlZCB3cS4gVGhpcyB3aWxs
IGVuc3VyZSBvbmx5IDEgcmViaW5kIGlzCj4gb2NjdXJpbmcgYXQgYSB0aW1lIHByb3ZpZGluZyBh
IHNvbWV3aGF0IGNsdW5reSB3b3JrIGFyb3VuZCBmb3Igc2hvcnQKPiBjb21pbmdzIGluIFRUTSB3
cnQgdG8gbWVtb3J5IGNvbnRlbnRpb24uIE9uY2UgdGhlIFRUTSBtZW1vcnkKPiBjb250ZW50aW9u
Cj4gaXMgcmVzb2x2ZWQgd2Ugc2hvdWxkIGJlIGFibGUgdG8gdXNlIGEgZGVkaWNhdGVkIG5vbi1v
cmRlcmVkCj4gd29ya3F1ZXVlLgo+IAo+IEFsc28gYWRkIGhlbHBlciB0byBxdWV1ZSByZWJpbmQg
d29ya2VyIHRvIGF2b2lkIHVzaW5nIHdyb25nIHdvcmtxdWV1ZQo+IGdvaW5nIGZvcndhcmQuCgpT
aG91bGQgcHJvYmFibHkgYWRkIGEgbXV0ZXggYXMgd2VsbCB0byBwcm90ZWN0IGFnYWluc3QgY29t
cGV0aW5nICFMUgpleGVjYnVmcy4gQnV0IGxldCdzIGRvIGEgZm9sbG93LXVwIGlmIG5lZWRlZC4K
ClJldmlld2VkLWJ5OiBUaG9tYXMgSGVsbHN0csO2bSA8dGhvbWFzLmhlbGxzdHJvbUBsaW51eC5p
bnRlbC5jb20+CgoKPiAKPiBTaWduZWQtb2ZmLWJ5OiBNYXR0aGV3IEJyb3N0IDxtYXR0aGV3LmJy
b3N0QGludGVsLmNvbT4KPiAtLS0KPiDCoGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9wcmVlbXB0X2Zl
bmNlLmMgfCAyICstCj4gwqBkcml2ZXJzL2dwdS9kcm0veGUveGVfdm0uY8KgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgfCAzICstLQo+IMKgZHJpdmVycy9ncHUvZHJtL3hlL3hlX3ZtLmjCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIHwgNiArKysrKysKPiDCoDMgZmlsZXMgY2hhbmdlZCwgOCBpbnNlcnRpb25z
KCspLCAzIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUv
eGVfcHJlZW1wdF9mZW5jZS5jCj4gYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfcHJlZW1wdF9mZW5j
ZS5jCj4gaW5kZXggNzhhZDhjMjA5ODczLi4yMTllZWZlYjkwZmYgMTAwNjQ0Cj4gLS0tIGEvZHJp
dmVycy9ncHUvZHJtL3hlL3hlX3ByZWVtcHRfZmVuY2UuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS94ZS94ZV9wcmVlbXB0X2ZlbmNlLmMKPiBAQCAtMjUsNyArMjUsNyBAQCBzdGF0aWMgdm9pZCBw
cmVlbXB0X2ZlbmNlX3dvcmtfZnVuYyhzdHJ1Y3QKPiB3b3JrX3N0cnVjdCAqdykKPiDCoMKgwqDC
oMKgwqDCoMKgZG1hX2ZlbmNlX3NpZ25hbCgmcGZlbmNlLT5iYXNlKTsKPiDCoMKgwqDCoMKgwqDC
oMKgZG1hX2ZlbmNlX2VuZF9zaWduYWxsaW5nKGNvb2tpZSk7Cj4gwqAKPiAtwqDCoMKgwqDCoMKg
wqBxdWV1ZV93b3JrKHN5c3RlbV91bmJvdW5kX3dxLCAmZS0+dm0tPnByZWVtcHQucmViaW5kX3dv
cmspOwo+ICvCoMKgwqDCoMKgwqDCoHhlX3ZtX3F1ZXVlX3JlYmluZF93b3JrZXIoZS0+dm0pOwo+
IMKgCj4gwqDCoMKgwqDCoMKgwqDCoHhlX2VuZ2luZV9wdXQoZSk7Cj4gwqB9Cj4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV92bS5jIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3Zt
LmMKPiBpbmRleCAxOTY2YTU4M2I3NjEuLjIwOGUyZjBiZjQxZCAxMDA2NDQKPiAtLS0gYS9kcml2
ZXJzL2dwdS9kcm0veGUveGVfdm0uYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV92bS5j
Cj4gQEAgLTMxMDMsOCArMzEwMyw3IEBAIGludCB4ZV92bV9iaW5kX2lvY3RsKHN0cnVjdCBkcm1f
ZGV2aWNlICpkZXYsCj4gdm9pZCAqZGF0YSwgc3RydWN0IGRybV9maWxlICpmaWxlKQo+IMKgCj4g
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgLyogUmViaW5k
cyBtYXkgaGF2ZSBiZWVuIGJsb2NrZWQsIGdpdmUgd29ya2VyCj4gYSBraWNrICovCj4gwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgaWYgKHhlX3ZtX2luX2Nv
bXB1dGVfbW9kZSh2bSkpCj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcXVldWVfd29yayh2bS0+eGUtPm9yZGVyZWRfd3EsCj4g
LcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgJnZtLT5wcmVlbXB0LnJlYmluZF93b3JrKTsKPiAr
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqB4ZV92bV9xdWV1ZV9yZWJpbmRfd29ya2VyKHZtKTsKPiDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoH0KPiDCoAo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgZ290
byBwdXRfZW5naW5lOwo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfdm0uaCBi
L2RyaXZlcnMvZ3B1L2RybS94ZS94ZV92bS5oCj4gaW5kZXggODU4MjA3YTIwMDE3Li42MDg2YzQ1
NWE1MWQgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3ZtLmgKPiArKysgYi9k
cml2ZXJzL2dwdS9kcm0veGUveGVfdm0uaAo+IEBAIC0xMzQsNiArMTM0LDEyIEBAIGludCB4ZV92
bWFfdXNlcnB0cl9waW5fcGFnZXMoc3RydWN0IHhlX3ZtYQo+ICp2bWEpOwo+IMKgCj4gwqBpbnQg
eGVfdm1hX3VzZXJwdHJfY2hlY2tfcmVwaW4oc3RydWN0IHhlX3ZtYSAqdm1hKTsKPiDCoAo+ICtz
dGF0aWMgaW5saW5lIHZvaWQgeGVfdm1fcXVldWVfcmViaW5kX3dvcmtlcihzdHJ1Y3QgeGVfdm0g
KnZtKQo+ICt7Cj4gK8KgwqDCoMKgwqDCoMKgWEVfV0FSTl9PTigheGVfdm1faW5fY29tcHV0ZV9t
b2RlKHZtKSk7Cj4gK8KgwqDCoMKgwqDCoMKgcXVldWVfd29yayh2bS0+eGUtPm9yZGVyZWRfd3Es
ICZ2bS0+cHJlZW1wdC5yZWJpbmRfd29yayk7Cj4gK30KPiArCj4gwqAvKgo+IMKgICogWEVfT05T
VEFDS19UViBpcyB1c2VkIHRvIHNpemUgdGhlIHR2X29uc3RhY2sgYXJyYXkgdGhhdCBpcyBpbnB1
dAo+IMKgICogdG8geGVfdm1fbG9ja19kbWFfcmVzdigpIGFuZCB4ZV92bV91bmxvY2tfZG1hX3Jl
c3YoKS4KCg==

