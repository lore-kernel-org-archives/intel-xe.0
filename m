Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52C8DC7EE29
	for <intel-xe@archiver.kernel.org>; Fri,  9 Jun 2023 21:18:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E420210E0CD;
	Fri,  9 Jun 2023 21:18:42 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 646C510E0CD
 for <intel-xe@lists.freedesktop.org>; Fri,  9 Jun 2023 21:18:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686345521; x=1717881521;
 h=message-id:subject:from:to:date:in-reply-to:references:
 content-transfer-encoding:mime-version;
 bh=rBV0pAH6Jb09y9e4x7AqDy7ygKGvRJK41m2u23Vow90=;
 b=GDdUvMMK/xUp6ix3ZwKRtNl6Ujf07aarVBYZWbYDY5HJyAuw9F6extaR
 gtNr5TxBC0NZgZYjcNOVLcu/vzoEBLE8NPGCG0rhXD5F8hF0Re2iJXAQN
 WBP+ljvIhALW0YzI22XuGIKOVHbgEJP/JW9rMhXPcXQJeqjC0NS0UBp6A
 z3GvfTeTU2w4g4wtECjHPBYom96IsPdF3h/xlPJjauWwa6BqcB3dTk06Q
 AiSW27eEhUf6bD9JfUYlxMVeGhQ7L95FQqV9yLWRaYKFqM4ixzZUVs0ID
 6hPVoR2+HKPurTisEJgJv0sh7fTqtUhC2zrbBqHTvLllUTshKhm0/evGk Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10736"; a="356583932"
X-IronPort-AV: E=Sophos;i="6.00,230,1681196400"; d="scan'208";a="356583932"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2023 14:18:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10736"; a="823196374"
X-IronPort-AV: E=Sophos;i="6.00,230,1681196400"; d="scan'208";a="823196374"
Received: from uniemimu-mobl1.ger.corp.intel.com (HELO [10.249.254.208])
 ([10.249.254.208])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2023 14:18:39 -0700
Message-ID: <738e96318fc7817fe2ffbf99f278ea68bbe158b5.camel@linux.intel.com>
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org
Date: Fri, 09 Jun 2023 23:18:37 +0200
In-Reply-To: <20230609182627.143150-2-matthew.brost@intel.com>
References: <20230609182627.143150-1-matthew.brost@intel.com>
 <20230609182627.143150-2-matthew.brost@intel.com>
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
User-Agent: Evolution 3.46.4 (3.46.4-1.fc37) 
MIME-Version: 1.0
Subject: Re: [Intel-xe] [PATCH 1/3] drm/xe: Handle unmapped userptr in
 analyze VM
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
IEEgY29ybmVyIGV4aXN0cyB3aGVyZSBhIHVzZXJwdHIgbWF5IGhhdmUgbm8gbWFwcGluZyB3aGVu
IGFuYWx5emUgVk0KPiBpcwo+IGNhbGxlZCwgaGFuZGxlIHRoaXMgY2FzZS4KPiAKPiBTaWduZWQt
b2ZmLWJ5OiBNYXR0aGV3IEJyb3N0IDxtYXR0aGV3LmJyb3N0QGludGVsLmNvbT4KClJldmlld2Vk
LWJ5OiBUaG9tYXMgSGVsbHN0csO2bSA8dGhvbWFzLmhlbGxzdHJvbUBsaW51eC5pbnRlbC5jb20+
Cgo+IC0tLQo+IMKgZHJpdmVycy9ncHUvZHJtL3hlL3hlX3ZtLmMgfCAxMCArKysrKysrLS0tCj4g
wqAxIGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQo+IAo+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfdm0uYyBiL2RyaXZlcnMvZ3B1L2RybS94
ZS94ZV92bS5jCj4gaW5kZXggZDFjMzgwYWQ3ZjZiLi5lNDMxMWM0OGNjNTQgMTAwNjQ0Cj4gLS0t
IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3ZtLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUv
eGVfdm0uYwo+IEBAIC0zNDUzLDkgKzM0NTMsMTMgQEAgaW50IHhlX2FuYWx5emVfdm0oc3RydWN0
IGRybV9wcmludGVyICpwLAo+IHN0cnVjdCB4ZV92bSAqdm0sIGludCBndF9pZCkKPiDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGlmIChpc191c2VycHRyKSB7Cj4gwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgc3RydWN0IHhlX3Jlc19jdXJzb3Ig
Y3VyOwo+IMKgCj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqB4ZV9yZXNfZmlyc3Rfc2codm1hLT51c2VycHRyLnNnLCAwLAo+IFhFX1BBR0VfU0laRSwKPiAt
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgJmN1cik7Cj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqBhZGRyID0geGVfcmVzX2RtYSgmY3VyKTsKPiArwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGlmICh2bWEtPnVzZXJwdHIuc2cp
IHsKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqB4ZV9yZXNfZmlyc3Rfc2codm1hLT51c2VycHRyLnNnLCAwLAo+IFhFX1BBR0Vf
U0laRSwKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCZjdXIpOwo+ICvC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoGFkZHIgPSB4ZV9yZXNfZG1hKCZjdXIpOwo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgfSBlbHNlIHsKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBhZGRyID0gMDsKPiArwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoH0KPiDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoH0gZWxzZSB7Cj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgYWRkciA9IF9feGVfYm9fYWRkcih2bWEtPmJvLCAwLCBYRV9Q
QUdFX1NJWkUsCj4gJmlzX3ZyYW0pOwo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
fQoK

